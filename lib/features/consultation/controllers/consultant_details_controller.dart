import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/core/utils/location_permission_helper.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/data/models/portfolio.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/response/consultant_on_portfolios.dart';
import 'package:pkp_hub/data/models/response/consultant_portfolios_response.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultant_portfolio_list_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/create_consultation_use_case.dart';

class ConsultantDetailsController extends BaseController {
  final String _consultantId;
  final String _projectId;
  final bool _isPaidConsultation;
  final UserStorage _userStorage;
  final GetConsultantPortfoliosUseCase _getPortfolioListUseCase;
  final Consultant? _consultant;
  final bool _requireLoginForAction;

  // Inject create consultation use case
  final CreateConsultationUseCase _createConsultationUseCase;
  final CreateDirectChatRoomUseCase _createDirectChatRoomUseCase;

  ConsultantDetailsController(
    this._consultantId,
    this._projectId,
    this._isPaidConsultation,
    this._userStorage,
    this._getPortfolioListUseCase,
    this._createConsultationUseCase,
    this._createDirectChatRoomUseCase,
    this._consultant,
    this._requireLoginForAction,
  );

  // Reactive state
  final portfolios = <Portfolio>[].obs;
  final isLoading = false.obs; // any fetch in progress
  final hasMore = true.obs; // mirrors !_done

  // Busy state for creating consultation
  final isCreatingConsultation = false.obs;

  // Consultant detail state
  final RxnString consultantName = RxnString();
  final RxnString consultantSpeciality = RxnString();
  final RxnDouble consultantRating = RxnDouble();
  final RxnDouble consultantPrice = RxnDouble();
  final RxnString consultantAvatarUrl = RxnString();
  final RxnString consultantLocation = RxnString();
  final RxString consultantAbout = ''.obs;

  // Scroll
  final scrollController = ScrollController();
  static const double _prefetchExtentPx =
      600; // start loading when < 600px remain

  // Paging
  final int _pageSize = 10;
  int _page = 0; // change to 1 if your backend is 1-based
  bool _done = false; // true when last page fetched
  bool _scheduled = false; // micro-debounce flag

  @override
  Future<void> onInit() async {
    super.onInit();
    scrollController.addListener(_onScroll);
    _hydrateConsultantFromArgument();
    await refreshList(); // fetch first page
  }

  void _onScroll() {
    if (_scheduled || isLoading.value || _done) return;
    if (!scrollController.hasClients) return;

    final pos = scrollController.position;
    if (pos.extentAfter < _prefetchExtentPx) {
      _scheduled = true;
      // coalesce multiple notifications within the frame
      Future.microtask(() {
        _scheduled = false;
        if (!isLoading.value && !_done) {
          fetchConsultantPortfolios();
        }
      });
    }
  }

  Future<void> refreshList() async {
    portfolios.clear();
    _page = 0;
    _done = false;
    hasMore.value = true;
    await fetchConsultantPortfolios();
  }

  Future<void> fetchConsultantPortfolios() async {
    if (isLoading.value || _done) return;

    isLoading.value = true;
    await handleAsync<ConsultantPortfoliosResponse>(
      () => _getPortfolioListUseCase(
        ConsultantPortfoliosQueryParams(
          consultantId: _consultantId,
          page: _page,
          size: _pageSize,
        ),
      ),
      onSuccess: (response) {
        final newItems = response.portfolios;

        if (newItems.isEmpty) {
          _done = true;
        } else {
          portfolios.addAll(newItems);
          _page += 1;
          if (newItems.length < _pageSize) {
            _done = true;
          }
        }

        _updateConsultantFromResponse(response.consultant);
        hasMore.value = !_done;
      },
      onFailure: (failure) {
        // Do not force stop pagination; allow retry via scroll/refresh
        showError(failure);
      },
    );
    isLoading.value = false;
  }

  Future<void> _createConsultation({required String channel}) async {
    if (isCreatingConsultation.value) return;

    final consultantId = int.tryParse(_consultantId);
    if (consultantId == null) {
      showError(const ServerFailure(message: 'Invalid consultation id.'));
      return;
    }

    isCreatingConsultation.value = true;
    await handleAsync<CreateConsultationResponse>(
      () => _createConsultationUseCase(
        CreateConsultationRequest(
          consultantId: consultantId,
          projectId: _projectId,
          consultationType: _isPaidConsultation ? 'BERBAYAR' : 'GRATIS',
          channel: channel,
        ),
      ),
      onSuccess: (response) {
        navigateAndClearUntil(
          AppRoutes.consultationDetails,
          untilRoute: AppRoutes.main,
          arguments: {
            'projectId': _projectId,
            'consultationId': response.id,
            'projectName': null,
          },
        );
      },
      onFailure: (failure) {
        showError(failure);
      },
    );

    isCreatingConsultation.value = false;
  }

  // Public: create consultation for this consultation
  Future<void> onChatPressed() async {
    // For chat, always enforce login regardless of _requireLoginForAction flag.
    final loggedIn = await ensureLoggedIn();
    if (!loggedIn) return;
    await _navigateToConsultantChat();
  }

  Future<void> onConsultPressed() async {
    final loggedIn = await ensureLoggedIn();
    if (!loggedIn) return;

    if (_projectId.isEmpty) {
      final hasPermission =
          await LocationPermissionHelper.ensureLocationPermission();
      if (!hasPermission) return;

      navigateTo(
        AppRoutes.createProject,
        arguments: {
          'consultantId': _consultantId,
          'isPaidConsultation': _isPaidConsultation,
        },
      );
      return;
    }

    await _createConsultation(channel: 'CHAT');
  }

  Future<bool> ensureLoggedIn() async {
    if (await _hasValidToken()) return true;

    await navigateToForResult<dynamic>(
      AppRoutes.login,
      arguments: LoginArgs(
        fromRoute: Get.currentRoute,
        returnArguments: Get.arguments,
      ),
    );

    return await _hasValidToken();
  }

  Future<bool> _hasValidToken() async {
    final token = await _userStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> _navigateToConsultantChat() async {
    final consultantId = int.tryParse(_consultantId);
    if (consultantId == null) {
      showError(const ServerFailure(message: 'ID konsultan tidak ditemukan'));
      return;
    }

    final name =
        consultantName.value?.trim() ??
        _consultant?.fullName?.trim() ??
        'Konsultan';

    await handleAsync<CreateChatRoomResponse>(
      () => _createDirectChatRoomUseCase(consultantId),
      onSuccess: (room) {
        navigateTo(
          AppRoutes.chat,
          arguments: ChatArgs(name: name, roomId: room.id),
        );
      },
      onFailure: showError,
    );
  }

  void _hydrateConsultantFromArgument() {
    if (_consultant == null) return;
    consultantName.value = _consultant.fullName ?? '';
    consultantSpeciality.value = _consultant.specialty;
    consultantRating.value = _consultant.rating;
    consultantPrice.value = _consultant.hourlyRate;
    consultantAvatarUrl.value = _consultant.avatarUrl;
    consultantLocation.value =
        _consultant.location ?? _consultant.address ?? '-';
    if ((_consultant.address ?? '').isNotEmpty) {
      consultantAbout.value = _consultant.address!;
    }
  }

  void _updateConsultantFromResponse(ConsultantOnPortfolios consultantData) {
    consultantName.value = consultantData.name;
    consultantSpeciality.value = consultantData.specialization;
  }

  int get completedProjectsCount => portfolios.length;

  String get experienceText => _consultant?.experienceLevel?.isNotEmpty == true
      ? _consultant!.experienceLevel!
      : '-';

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }
}

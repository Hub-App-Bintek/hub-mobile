import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/models/portfolio.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/response/consultant_portfolios_response.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultant_portfolio_list_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/create_consultation_use_case.dart';

class ConsultantPortfoliosController extends BaseController {
  final String _consultantId;
  final String _projectId;
  final bool _isPaidConsultation;
  final UserStorage _userStorage;
  final GetConsultantPortfoliosUseCase _getPortfolioListUseCase;

  // Inject create consultation use case
  final CreateConsultationUseCase _createConsultationUseCase;

  ConsultantPortfoliosController(
    this._consultantId,
    this._projectId,
    this._isPaidConsultation,
    this._userStorage,
    this._getPortfolioListUseCase,
    this._createConsultationUseCase,
  );

  // Reactive state
  final portfolios = <Portfolio>[].obs;
  final isLoading = false.obs; // any fetch in progress
  final hasMore = true.obs; // mirrors !_done
  final showActionButton = false.obs;

  // Busy state for creating consultation
  final isCreatingConsultation = false.obs;

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
    await setActionButtonVisibility();
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

  Future<void> setActionButtonVisibility() async {
    final user = await _userStorage.getUser();
    showActionButton.value = user?.role?.toLowerCase() == 'homeowner';
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

        hasMore.value = !_done;
      },
      onFailure: (failure) {
        // Do not force stop pagination; allow retry via scroll/refresh
        showError(failure);
      },
    );
    isLoading.value = false;
  }

  // Public: create consultation for this consultant
  Future<void> createConsultation({required String channel}) async {
    if (isCreatingConsultation.value) return;

    final consultantId = int.tryParse(_consultantId);
    if (consultantId == null) {
      showError(const ServerFailure(message: 'Invalid consultant id.'));
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
        navigateTo(
          AppRoutes.projectDetails,
          arguments: {'projectId': _projectId},
        );
      },
      onFailure: (failure) {
        showError(failure);
      },
    );

    isCreatingConsultation.value = false;
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }
}

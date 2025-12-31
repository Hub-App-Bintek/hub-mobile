import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/core/utils/logger.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';

class ConsultantsController extends BaseController {
  ConsultantsController(this._getConsultantsUseCase, this._userStorage);

  final GetConsultantsUseCase _getConsultantsUseCase;
  final UserStorage _userStorage;

  final RxString selectedSort = ''.obs;
  String _projectId = '';
  double _lat = 0.0;
  double _long = 0.0;
  bool _isPaidConsultation = false;
  bool _showCreateCta = false;
  bool _requireLoginForAction = false;

  // Reactive state
  final consultants = <Consultant>[].obs;
  final isLoading = false.obs; // any fetch in progress
  final hasMore = true.obs; // mirrors _done inverse

  final _logger = Logger();

  // Scroll
  final scrollController = ScrollController();
  static const double _prefetchExtentPx = 600; // load when < this remains below

  // Paging
  static const int _pageSize = 10;
  int _page = 0; // make sure backend expects 0-based; change to 1 if needed
  bool _done = false; // true when we fetched the last page
  bool _scheduled =
      false; // micro-debounce to avoid duplicate calls in a single frame

  @override
  void onInit() {
    super.onInit();
    _hydrateArgs();
    scrollController.addListener(_onScroll);
    fetchConsultants();
  }

  void _hydrateArgs() {
    final rawArgs = Get.arguments;
    if (rawArgs is ConsultantsArgs) {
      _projectId = rawArgs.projectId;
      _lat = rawArgs.lat;
      _long = rawArgs.long;
      selectedSort.value = rawArgs.sortBy ?? '';
      _showCreateCta = rawArgs.showCreateCta;
      _requireLoginForAction = rawArgs.requireLoginForAction;
      _isPaidConsultation = rawArgs.isPaidConsultation;
      return;
    }

    if (rawArgs is Map<String, dynamic>) {
      _projectId = (rawArgs['projectId'] ?? '').toString();
      _lat = (rawArgs['lat'] as num?)?.toDouble() ?? 0.0;
      _long = (rawArgs['long'] as num?)?.toDouble() ?? 0.0;
      selectedSort.value = rawArgs['sortBy'] as String? ?? '';
      _showCreateCta = rawArgs['showCreateCta'] as bool? ?? false;
      _requireLoginForAction =
          rawArgs['requireLoginForAction'] as bool? ?? false;
      _isPaidConsultation = rawArgs['isPaidConsultation'] as bool? ?? false;
    }
  }

  void _onScroll() {
    if (_scheduled || isLoading.value || _done) return;
    if (!scrollController.hasClients) return;

    final pos = scrollController.position;
    // extentAfter: content distance below the viewport in px
    if (pos.extentAfter < _prefetchExtentPx) {
      _scheduled = true;
      // Debounce to coalesce multiple notifications per frame
      Future.microtask(() {
        _scheduled = false;
        if (!isLoading.value && !_done) {
          fetchConsultants();
        }
      });
    }
  }

  Future<void> refreshList() async {
    // Optional: keep position, or scrollController.jumpTo(0);
    consultants.clear();
    _page = 0;
    _done = false;
    hasMore.value = true;
    await fetchConsultants();
  }

  Future<void> fetchConsultants() async {
    _logger.d('project ID : $_projectId');
    if (isLoading.value || _done) return;

    isLoading.value = true;
    await handleAsync<ConsultantsResponse>(
      () => _getConsultantsUseCase(
        GetConsultantsParams(
          lat: _lat,
          long: _long,
          page: _page,
          size: _pageSize,
          type: isPaidConsultation ? 'PROFESSIONAL' : 'STUDENT',
          sortBy: selectedSort.value.isNotEmpty ? selectedSort.value : null,
        ),
      ),
      onSuccess: (response) {
        final result = response.consultants;

        if (result.isEmpty) {
          _done = true;
        } else {
          consultants.addAll(result);
          _page += 1;
          // If server returns less than page size, we've reached the last page
          if (result.length < _pageSize) {
            _done = true;
          }
        }

        hasMore.value = !_done;
      },
      onFailure: (failure) {
        // Keep _done as-is so user can retry (via scroll or pull-to-refresh)
        showError(failure);
      },
    );
    isLoading.value = false;
  }

  String get _effectiveProjectId {
    if (_projectId.isNotEmpty) return _projectId;

    final args = Get.arguments;
    if (args is ConsultantsArgs && args.projectId.isNotEmpty) {
      return args.projectId;
    }
    if (args is Map<String, dynamic>) {
      final argProjectId = (args['projectId'] ?? '').toString();
      if (argProjectId.isNotEmpty) return argProjectId;
    }

    return '';
  }

  void goToPortfolio(Consultant consultant) {
    final consultantId = consultant.id ?? '';
    final targetProjectId = _effectiveProjectId;
    () async {
      if (_requireLoginForAction) {
        final loggedIn = await _ensureLoggedIn();
        if (!loggedIn) return;
      }
      navigateTo(
        AppRoutes.consultantDetails,
        arguments: ConsultantDetailsArgs(
          consultantId: consultantId,
          projectId: targetProjectId,
          consultant: consultant,
        ),
      );
    }();
  }

  Future<bool> _ensureLoggedIn() async {
    final token = await _userStorage.getToken();
    if (token != null && token.isNotEmpty) {
      return true;
    }

    await navigateToForResult<dynamic>(
      AppRoutes.login,
      arguments: LoginArgs(
        fromRoute: Get.currentRoute,
        returnArguments: Get.arguments,
      ),
    );

    final refreshedToken = await _userStorage.getToken();
    return refreshedToken != null && refreshedToken.isNotEmpty;
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }

  void updateSort(String sortKey) {
    if (selectedSort.value == sortKey) return;
    selectedSort.value = sortKey;
    refreshList();
  }

  void onSeeAllConsultants() {
    navigateTo(AppRoutes.consultants);
  }

  String get projectId => _projectId;
  bool get isPaidConsultation => _isPaidConsultation;
  bool get showCreateCta => _showCreateCta;
  bool get requireLoginForAction => _requireLoginForAction;
}

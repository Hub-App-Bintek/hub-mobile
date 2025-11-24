import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/core/utils/location_permission_helper.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';

class ConsultationController extends BaseController {
  final GetConsultantsUseCase _getConsultantsUseCase;
  final UserStorage _userStorage;
  final String projectId;
  final double _lat;
  final double _long;
  final RxString selectedSort = ''.obs;
  final bool showCreateCta;
  final bool requireLoginForAction;
  final String designTypeId;

  ConsultationController(
    this._getConsultantsUseCase,
    this._userStorage,
    this.projectId,
    this._lat,
    this._long,
    String? initialSort,
    this.showCreateCta,
    this.requireLoginForAction,
    this.designTypeId,
  );

  // Reactive state
  final consultants = <Consultant>[].obs;
  final isLoading = false.obs; // any fetch in progress
  final hasMore = true.obs; // mirrors _done inverse

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
    scrollController.addListener(_onScroll);
    fetchConsultants();
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
    if (isLoading.value || _done) return;

    isLoading.value = true;
    await handleAsync<ConsultantsResponse>(
      () => _getConsultantsUseCase(
        lat: _lat,
        long: _long,
        page: _page,
        size: _pageSize,
        sortBy: selectedSort.value.isNotEmpty ? selectedSort.value : null,
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

  void goToPortfolio(Consultant consultant) {
    final consultantId = consultant.id ?? '';
    () async {
      if (requireLoginForAction) {
        final loggedIn = await _ensureLoggedIn();
        if (!loggedIn) return;
      }
      navigateTo(
        AppRoutes.consultantDetails,
        arguments: ConsultantDetailsArgs(
          consultantId: consultantId,
          projectId: projectId,
          isPaidConsultation: (consultant.packageCost ?? 0) > 0.0,
          consultation: consultant,
          requireLoginForAction: requireLoginForAction,
        ),
      );
    }();
  }

  void onCreatePressed() {
    () async {
      final loggedIn = await _ensureLoggedIn();
      if (!loggedIn) return;
      final hasPermission =
          await LocationPermissionHelper.ensureLocationPermission();
      if (!hasPermission) return;
      navigateTo(AppRoutes.createProject, arguments: {'type': designTypeId});
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
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/project_type.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/core/utils/location_permission_helper.dart';
import 'package:pkp_hub/core/utils/logger.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';

class ConsultationController extends BaseController {
  ConsultationController(this._getConsultantsUseCase, this._userStorage);

  final GetConsultantsUseCase _getConsultantsUseCase;
  final UserStorage _userStorage;

  String _projectId = '';
  double _lat = 0.0;
  double _long = 0.0;
  bool _isPaidConsultation = false;
  bool _requireLoginForAction = false;

  final consultants = <Consultant>[].obs;
  final isLoading = false.obs;
  final hasMore = true.obs;

  final scrollController = ScrollController();
  static const double _prefetchExtentPx = 600;

  static const int _pageSize = 10;
  int _page = 0;
  bool _done = false;
  bool _scheduled = false;

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
      _requireLoginForAction = rawArgs.requireLoginForAction;
      _isPaidConsultation = rawArgs.isPaidConsultation;
      return;
    }

    if (rawArgs is Map<String, dynamic>) {
      _projectId = (rawArgs['projectId'] ?? '').toString();
      _lat = (rawArgs['lat'] as num?)?.toDouble() ?? 0.0;
      _long = (rawArgs['long'] as num?)?.toDouble() ?? 0.0;
      _requireLoginForAction =
          rawArgs['requireLoginForAction'] as bool? ?? false;
      _isPaidConsultation = rawArgs['isPaidConsultation'] as bool? ?? false;
    }
  }

  void _onScroll() {
    if (_scheduled || isLoading.value || _done) return;
    if (!scrollController.hasClients) return;

    final pos = scrollController.position;
    if (pos.extentAfter < _prefetchExtentPx) {
      _scheduled = true;
      Future.microtask(() {
        _scheduled = false;
        if (!isLoading.value && !_done) {
          fetchConsultants();
        }
      });
    }
  }

  Future<void> refreshList() async {
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
        GetConsultantsParams(
          lat: _lat,
          long: _long,
          page: _page,
          size: _pageSize,
          type: 'PROFESSIONAL',
        ),
      ),
      onSuccess: (response) {
        final result = response.consultants;
        if (result.isEmpty) {
          _done = true;
        } else {
          consultants.addAll(result);
          _page += 1;
          if (result.length < _pageSize) {
            _done = true;
          }
        }
        hasMore.value = !_done;
      },
      onFailure: showError,
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
          consultation: consultant,
          requireLoginForAction: _requireLoginForAction,
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
      navigateOff(
        AppRoutes.locationDetails,
        arguments: LocationDetailsArgs(type: consultation.name),
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
}

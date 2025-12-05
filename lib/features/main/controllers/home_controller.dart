import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/consultation_filter_status.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/response/consultations_response.dart';
import 'package:pkp_hub/data/models/response/wallet_response.dart';
import 'package:pkp_hub/domain/usecases/consultation/get_consultations_use_case.dart';
import 'package:pkp_hub/domain/usecases/wallet/get_wallet_balance_use_case.dart';

class HomeController extends BaseController {
  final UserStorage _userStorage;
  final GetWalletBalanceUseCase _getWalletBalanceUseCase;
  final GetConsultationsUseCase _getConsultationsUseCase;

  final RxDouble balance = 0.0.obs;
  final Rxn<UserRole> userRole = Rxn<UserRole>();
  final Rx<ConsultationFilterStatus> consultationStatus =
      consultationFilterWaitingConfirmation.obs;
  final RxMap<String, int> projectCounts = <String, int>{}.obs;
  final RxInt chatBadgeCount = 3.obs;
  final RxInt notificationBadgeCount = 5.obs;

  final PageController carouselController = PageController();
  final RxInt currentCarouselIndex = 0.obs;
  Timer? _carouselTimer;

  final List<String> carouselImages = [
    'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=800&h=400&fit=crop',
  ];

  final RxList<Project> consultations = <Project>[].obs;
  final RxBool isProjectLoading = false.obs;
  final RxString userDisplayName = ''.obs;

  final RxnString _token = RxnString();
  int _consultationPage = 0;
  bool _hasMoreConsultations = true;
  bool _initialConsultationFetchTriggered = false;

  HomeController(
    this._userStorage,
    this._getWalletBalanceUseCase,
    this._getConsultationsUseCase,
  );

  @override
  Future<void> refresh() async {
    _initialConsultationFetchTriggered = false;
    await init();
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onClose() {
    carouselController.dispose();
    _carouselTimer?.cancel();
    super.onClose();
  }

  @override
  void onResumed() {
    super.onResumed();
    init();
  }

  void onPageVisible() {
    init();
  }

  Future<void> init() async {
    await _refreshAuthState();
    await _loadUserName();

    if (_isLoggedIn) {
      _fetchBalance();
    }

    if (userRole.value == UserRole.consultant &&
        !_initialConsultationFetchTriggered) {
      _initialConsultationFetchTriggered = true;
      fetchConsultations(consultationFilterWaitingConfirmation);
    }
  }

  bool get _isLoggedIn => _token.value?.isNotEmpty ?? false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> _refreshAuthState() async {
    userRole.value = await _userStorage.getRole();
    _token.value = await _userStorage.getToken();
  }

  Future<bool> ensureLoggedIn({bool redirectOnFail = true}) async {
    await _refreshAuthState();
    if (_isLoggedIn) return true;
    if (redirectOnFail) {
      navigateTo(AppRoutes.login);
    }
    return false;
  }

  Future<void> _loadUserName() async {
    final user = await _userStorage.getUser();
    userDisplayName.value = user?.fullName?.isNotEmpty == true
        ? user!.fullName!
        : 'User';
  }

  @override
  void onReady() {
    super.onReady();
    _startCarouselTimer();
  }

  Future<void> _fetchBalance() async {
    await handleAsync<WalletResponse>(
      () => _getWalletBalanceUseCase(),
      onSuccess: (response) async {
        balance.value = response.balance ?? 0.0;
      },
      onFailure: (failure) async {
        showError(failure);
      },
    );
  }

  Future<void> fetchConsultations(ConsultationFilterStatus status) async {
    if (isProjectLoading.value) return;
    isProjectLoading.value = true;
    consultationStatus.value = status;
    _consultationPage = 0;
    _hasMoreConsultations = true;
    consultations.clear();

    await handleAsync<ConsultationsResponse>(
      () => _getConsultationsUseCase(
        GetConsultationsParams(status: status.id, page: _consultationPage),
      ),
      onSuccess: (response) {
        consultations
          ..clear()
          ..addAll(response.projects?.content ?? []);
        final isLast = response.projects?.last ?? true;
        _hasMoreConsultations = !isLast;
        projectCounts.assignAll({
          consultationFilterInProgress.id: response.inProgressCount ?? 0,
          consultationFilterWaitingConfirmation.id: response.pendingCount ?? 0,
        });
      },
      onFailure: (failure) {
        showError(failure);
        consultations.clear();
        _hasMoreConsultations = false;
      },
    );

    isProjectLoading.value = false;
  }

  Future<void> loadMoreConsultations() async {
    if (isProjectLoading.value || !_hasMoreConsultations) return;
    final nextPage = _consultationPage + 1;
    final prevPage = _consultationPage;
    _consultationPage = nextPage;
    isProjectLoading.value = true;

    await handleAsync<ConsultationsResponse>(
      () => _getConsultationsUseCase(
        GetConsultationsParams(
          status: consultationStatus.value.id,
          page: _consultationPage,
        ),
      ),
      onSuccess: (data) {
        consultations.addAll(data.projects?.content ?? []);
        final isLast = data.projects?.last ?? true;
        _hasMoreConsultations = !isLast;
      },
      onFailure: (failure) {
        showError(failure);
        _consultationPage = prevPage;
        _hasMoreConsultations = false;
      },
    );

    isProjectLoading.value = false;
  }

  void onNotificationTapped() {
    navigateTo(AppRoutes.inbox);
  }

  void onChatTapped() {
    navigateTo(AppRoutes.chats);
  }

  void onSelectConsultation(Project project) {
    final status = (project.consultationInfo?.consultationStatus ?? '')
        .toUpperCase();
    final isConsultant = userRole.value == UserRole.consultant;
    final isWaitingConfirmation = status == 'MENUNGGU_KONFIRMASI_KONSULTAN';
    final isActive = status == 'AKTIF';

    // Consultants should always land on consultation details, regardless of status
    if (isConsultant) {
      navigateTo(
        AppRoutes.consultationDetails,
        arguments: ConsultationDetailsArgs(project: project),
      );
    } else if (isActive || isWaitingConfirmation) {
      navigateTo(
        AppRoutes.consultationDetails,
        arguments: ConsultationDetailsArgs(project: project),
      );
    }
  }

  void onConsultationFeatureTapped() {
    navigateTo(AppRoutes.designType);
  }

  Future<void> onFeatureTapped(VoidCallback onHaveProjects) async {
    if (!_isLoggedIn) {
      navigateTo(AppRoutes.login);
      return;
    }

    var permissionGranted = await isPermissionGranted(Permission.location);
    if (!permissionGranted) {
      final status = await requestPermission(Permission.location);
      if (status.isPermanentlyDenied) {
        return;
      }
      permissionGranted = status.isGranted;
    }
  }

  void _startCarouselTimer() {
    _carouselTimer?.cancel();
    _carouselTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!carouselController.hasClients || carouselImages.isEmpty) return;
      if (currentCarouselIndex.value < carouselImages.length - 1) {
        currentCarouselIndex.value++;
      } else {
        currentCarouselIndex.value = 0;
      }

      carouselController.animateToPage(
        currentCarouselIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}

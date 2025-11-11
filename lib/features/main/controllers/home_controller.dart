import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/request/get_projects_request.dart';
import 'package:pkp_hub/data/models/response/consultants_response.dart';
import 'package:pkp_hub/data/models/response/get_projects_response.dart';
import 'package:pkp_hub/data/models/response/wallet_response.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';
import 'package:pkp_hub/domain/usecases/wallet/get_wallet_balance_use_case.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';

class HomeController extends BaseController with WidgetsBindingObserver {
  final UserStorage _userStorage;
  final GetProjectsUseCase _getProjectListUseCase;
  final GetWalletBalanceUseCase _getWalletBalanceUseCase;
  final GetConsultantsUseCase _getConsultantsUseCase;
  Worker? _mainTabWorker;

  final RxDouble balance = 0.0.obs;
  final Rxn<UserRole> userRole = Rxn<UserRole>();

  final PageController carouselController = PageController();
  final RxInt currentCarouselIndex = 0.obs;
  Timer? _carouselTimer;
  double _currentLat = 0;
  double _currentLong = 0;

  final List<String> carouselImages = [
    'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=800&h=400&fit=crop',
  ];

  final RxList<Project> projects = <Project>[].obs;
  final RxBool isProjectLoading = false.obs;
  final RxList<Consultant> consultants = <Consultant>[].obs;
  final RxBool isConsultantLoading = false.obs;

  String? _token;

  HomeController(
    this._userStorage,
    this._getProjectListUseCase,
    this._getWalletBalanceUseCase,
    this._getConsultantsUseCase,
  );

  @override
  void onInit() {
    super.onInit();
    // Register for app lifecycle events so we can refresh when the app resumes.
    WidgetsBinding.instance.addObserver(this);
    _listenToMainTabChanges();
    init();
  }

  // Expose a public refresh method to allow views or other controllers
  // (e.g., MainController) to force a data reload when Home becomes visible.
  @override
  Future<void> refresh() async {
    await init();
  }

  @override
  void onClose() {
    // Unregister lifecycle observer and clean up resources.
    WidgetsBinding.instance.removeObserver(this);
    _mainTabWorker?.dispose();
    carouselController.dispose();
    _carouselTimer?.cancel();
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // When the app resumes, reload token and refresh relevant data.
      init();
    }
  }

  void _listenToMainTabChanges() {
    if (!Get.isRegistered<MainController>()) return;
    final mainController = Get.find<MainController>();
    _mainTabWorker = ever<int>(mainController.selectedIndex, (index) {
      if (index == 0) {
        refresh();
      }
    });
  }

  Future<void> init() async {
    userRole.value = await _userStorage.getRole();
    _token = await _userStorage.getToken();
    if (userRole.value != UserRole.consultant) {
      final coords = await _determineUserLocation();
      _currentLat = coords.$1;
      _currentLong = coords.$2;
    } else {
      _currentLat = 0;
      _currentLong = 0;
    }

    if (_isLoggedIn) {
      await Future.wait([
        _fetchBalance(),
        fetchProjects('PENDING'),
        _fetchConsultants(),
      ]);
    } else {
      projects.clear();
      await _fetchConsultants();
    }
  }

  bool get _isLoggedIn => _token?.isNotEmpty ?? false;

  bool get isLoggedIn => _isLoggedIn;

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

  Future<void> fetchProjects(String status) async {
    isProjectLoading.value = true;

    await handleAsync<GetProjectsResponse>(
      () =>
          _getProjectListUseCase(GetProjectsRequest(size: 100, status: status)),
      onSuccess: (data) {
        final result = data.projects.where((p) => p.status == status).toList();
        projects.value = result;
      },
      onFailure: (failure) {
        showError(failure);
        projects.clear();
        consultants.clear();
      },
    );

    isProjectLoading.value = false;
  }

  void onNotificationTapped() {
    navigateTo(AppRoutes.inbox);
  }

  void onSelectProject(Project project) {
    if (project.status == "CREATED") {
      navigateTo(
        AppRoutes.consultants,
        arguments: {
          'projectId': project.projectId,
          'lat': project.location?.latitude ?? 0.0,
          'long': project.location?.longitude ?? 0.0,
          'type': project.projectId,
        },
      );
    } else {
      navigateTo(
        AppRoutes.projectDetails,
        arguments: {
          'projectId': project.projectId,
          'homeOwnerId': project.homeOwnerId,
          'homeOwnerName': project.homeOwnerName,
          'consultantId': project.consultantId,
          'consultantName': project.consultantName,
        },
      );
    }
  }

  void onNewProjectFromSheet() {
    navigateTo(AppRoutes.createProject);
  }

  void onConsultantCardTapped(Consultant consultant) {
    final consultantId = consultant.id;
    if (consultantId == null || consultantId.isEmpty) return;

    navigateTo(
      AppRoutes.consultantPortfolio,
      arguments: {
        'consultantId': consultantId,
        'isPaidConsultation': (consultant.hourlyRate ?? 0) > 0,
      },
    );
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

    // if (permissionGranted && projects.isEmpty) {
    //   navigateTo(AppRoutes.createProject);
    // } else if (permissionGranted && projects.isNotEmpty) {
    //   onHaveProjects();
    // }
  }

  void onSeeAllConsultants() {
    () async {
      if (_currentLat == 0 &&
          _currentLong == 0 &&
          userRole.value != UserRole.consultant) {
        final coords = await _determineUserLocation();
        _currentLat = coords.$1;
        _currentLong = coords.$2;
      }
      navigateTo(
        AppRoutes.consultants,
        arguments: {
          'projectId': '',
          'lat': _currentLat,
          'long': _currentLong,
          'type': '',
        },
      );
    }();
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

  Future<void> _fetchConsultants({double? lat, double? long}) async {
    isConsultantLoading.value = true;
    final targetLat = lat ?? _currentLat;
    final targetLong = long ?? _currentLong;
    await handleAsync<ConsultantsResponse>(
      () => _getConsultantsUseCase(
        lat: targetLat,
        long: targetLong,
        page: 0,
        size: 10,
      ),
      onSuccess: (response) {
        consultants.value = response.consultants;
      },
      onFailure: (failure) {
        showError(failure);
        consultants.clear();
      },
    );
    isConsultantLoading.value = false;
  }

  Future<(double, double)> _determineUserLocation() async {
    double lat = 0;
    double long = 0;
    try {
      var status = await Permission.location.status;
      if (!status.isGranted) {
        status = await Permission.location.request();
      }
      if (!status.isGranted) {
        return (lat, long);
      }
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      lat = position.latitude;
      long = position.longitude;
    } catch (_) {
      // Ignore and fallback to 0.0 for both coordinates
    }
    return (lat, long);
  }
}

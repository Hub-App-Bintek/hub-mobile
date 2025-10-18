import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/storage/auth_local_storage.dart';
import 'package:pkp_hub/data/models/project.dart';

class HomeController extends BaseController {
  final AuthStorage _authSession;
  final RxDouble balance = 0.0.obs;

  final PageController carouselController = PageController();
  final RxInt currentCarouselIndex = 0.obs;
  Timer? _carouselTimer;

  final List<String> carouselImages = [
    'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=800&h=400&fit=crop',
  ];

  final RxList<Project> activeProjects = <Project>[].obs;
  final RxBool isProjectLoading = false.obs;

  String? _token;

  HomeController(this._authSession);

  @override
  void onInit() {
    super.onInit();
    _loadToken();
  }

  Future<void> _loadToken() async {
    _token = await _authSession.getToken();
    if (isLoggedIn) {
      loadBalance();
      fetchActiveProjects();
    }
  }

  bool get isLoggedIn => _token?.isNotEmpty ?? false;

  @override
  void onReady() {
    super.onReady();
    _startCarouselTimer();
  }

  @override
  void onClose() {
    carouselController.dispose();
    _carouselTimer?.cancel();
    super.onClose();
  }

  Future<void> loadBalance() async {
    // TODO: Fetch balance from API or local storage
  }

  Future<bool> _requestLocationPermission() async {
    final status = await Permission.location.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      final result = await Permission.location.request();
      return result.isGranted;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }
    return false;
  }

  // TODO: Replace with real API call to fetch active projects
  Future<void> fetchActiveProjects() async {
    isProjectLoading.value = true;
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      activeProjects.value = [
        Project(
          projectId: '1',
          name: 'Project Alpha',
          type: ProjectType.NON_PROTOTYPE,
          status: ProjectStatus.ACTIVE,
          location: const ProjectLocation(
            lat: -6.200000,
            long: 106.816666,
            address: 'Jakarta, Indonesia',
          ),
          landArea: 1200.5,
          createdAt: DateTime(2025, 10, 1, 10, 0, 0),
        ),
        Project(
          projectId: '2',
          name: 'Project Beta',
          type: ProjectType.PROTOTYPE,
          status: ProjectStatus.ACTIVE,
          location: const ProjectLocation(
            lat: -7.250445,
            long: 112.768845,
            address: 'Surabaya, Indonesia',
          ),
          landArea: 800.0,
          createdAt: DateTime(2025, 9, 15, 14, 30, 0),
        ),
        Project(
          projectId: '3',
          name: 'Project Gamma',
          type: ProjectType.NON_PROTOTYPE,
          status: ProjectStatus.ACTIVE,
          location: const ProjectLocation(
            lat: -6.914744,
            long: 107.609810,
            address: 'Bandung, Indonesia',
          ),
          landArea: 1500.75,
          createdAt: DateTime(2025, 8, 20, 9, 0, 0),
        ),
      ];
    } finally {
      isProjectLoading.value = false;
    }
  }

  Future<bool> handleMenuTap(String menu) async {
    if (!isLoggedIn) {
      navigateTo(AppRoutes.login);
      return false;
    }
    final granted = await _requestLocationPermission();
    if (!granted) return false;
    final route = _getRouteForMenu(menu);
    if (route == null) return false;
    if (activeProjects.isNotEmpty) {
      return true;
    } else {
      navigateTo(AppRoutes.createProject);
      return false;
    }
  }

  void onNotificationTapped() {
    // TODO: Redirect to inbox screen
  }

  String? _getRouteForMenu(String menu) {
    switch (menu) {
      case AppStrings.menuConsultation:
        return AppRoutes.consultation;
      case AppStrings.menuLicensing:
        return AppRoutes.licensing;
      case AppStrings.menuMaterial:
        return AppRoutes.material;
      case AppStrings.menuConstruction:
        return AppRoutes.construction;
      case AppStrings.menuMonitoring:
        return AppRoutes.monitoring;
      default:
        return null;
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/request/get_projects_request.dart';
import 'package:pkp_hub/data/models/response/get_projects_response.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';

class HomeController extends BaseController with WidgetsBindingObserver {
  final UserStorage _userStorage;
  final GetProjectsUseCase getProjectListUseCase;
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

  HomeController(this._userStorage, this.getProjectListUseCase);

  @override
  void onInit() {
    super.onInit();
    // Register for app lifecycle events so we can refresh when the app resumes.
    WidgetsBinding.instance.addObserver(this);
    init();
  }

  @override
  void onClose() {
    // Unregister lifecycle observer and clean up resources.
    WidgetsBinding.instance.removeObserver(this);
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

  Future<void> init() async {
    _token = await _userStorage.getToken();
    if (_isLoggedIn) {
      loadBalance();
      fetchActiveProjects();
    }
  }

  bool get _isLoggedIn => _token?.isNotEmpty ?? false;

  @override
  void onReady() {
    super.onReady();
    _startCarouselTimer();
  }

  Future<void> loadBalance() async {
    // TODO: Fetch balance from API or local storage
  }

  // Fetch active projects from API
  Future<void> fetchActiveProjects() async {
    isProjectLoading.value = true;
    await handleAsync<GetProjectsResponse>(
      () => getProjectListUseCase(const GetProjectsRequest()),
      onSuccess: (data) {
        final result = data.projects
            .where((p) => p.status != 'CANCELED' || p.status != 'COMPLETED')
            .toList();
        activeProjects.value = result;
        isProjectLoading.value = false;
      },
      onFailure: (failure) {
        showError(failure);
        activeProjects.clear();
        isProjectLoading.value = false;
      },
    );
  }

  Future<void> handleMenuTap(VoidCallback onHaveActiveProjects) async {
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

    if (permissionGranted && activeProjects.isEmpty) {
      navigateTo(AppRoutes.createProject);
    } else if (permissionGranted && activeProjects.isNotEmpty) {
      onHaveActiveProjects();
    }
  }

  void onNotificationTapped() {
    // TODO: Redirect to inbox screen
  }

  void onProjectSelectedFromSheet(Project project) {
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
        arguments: {'projectId': project.projectId},
      );
    }
  }

  void onNewProjectFromSheet() {
    navigateTo(AppRoutes.createProject);
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

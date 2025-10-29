import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/features/main/screens/home_screen.dart';
import 'package:pkp_hub/features/main/screens/profile_screen.dart';
import 'package:pkp_hub/features/main/screens/projects_screen.dart';

import '../controllers/home_controller.dart';
import '../controllers/projects_controller.dart';

class MainController extends GetxController {
  final UserStorage _authSession;

  MainController(this._authSession);

  final RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  String? _token;

  @override
  void onInit() {
    super.onInit();
    _loadToken();
  }

  Future<void> _loadToken() async {
    _token = await _authSession.getToken();
  }

  bool get isLoggedIn => _token?.isNotEmpty ?? false;

  final List<Widget> pages = const [
    HomeScreen(),
    ProjectsScreen(),
    ProfileScreen(),
  ];

  void onDestinationSelected(int index) {
    if ((index == 1 || index == 2) && !isLoggedIn) {
      Get.toNamed(AppRoutes.login);
      return;
    }
    selectedIndex.value = index;
    pageController.jumpToPage(index);

    // If Home tab is selected, force a refresh
    if (index == 0) {
      // Use Get.find to get the existing controller instance
      final homeController = Get.find<HomeController>();
      // Fire and forget; internal observables will drive the UI
      homeController.refresh();
    }

    // If Projects tab is selected, refresh the projects list
    if (index == 1) {
      final projectsController = Get.find<ProjectsController>();
      projectsController.refreshProjects();
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

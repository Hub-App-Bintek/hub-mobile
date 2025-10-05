import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';
import 'package:pkp_hub/features/main/presentation/screens/home_screen.dart';
import 'package:pkp_hub/features/main/presentation/screens/profile_screen.dart';
import 'package:pkp_hub/features/main/presentation/screens/project_screen.dart';

class MainController extends GetxController {
  final AuthSession _authSession;

  MainController(this._authSession);

  final RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  bool get isLoggedIn => _authSession.token?.isNotEmpty == true;

  final List<Widget> pages = const [
    HomeScreen(),
    ProjectScreen(),
    ProfileScreen(),
  ];

  void onDestinationSelected(int index) {
    if ((index == 1 || index == 2) && !isLoggedIn) {
      Get.toNamed(AppRoutes.login);
      return;
    }
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

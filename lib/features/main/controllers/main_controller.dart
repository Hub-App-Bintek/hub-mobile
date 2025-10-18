import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/storage/auth_local_storage.dart';
import 'package:pkp_hub/features/main/screens/home_screen.dart';
import 'package:pkp_hub/features/main/screens/profile_screen.dart';
import 'package:pkp_hub/features/main/screens/project_screen.dart';

class MainController extends GetxController {
  final AuthStorage _authSession;

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

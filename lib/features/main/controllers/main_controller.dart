import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/features/main/screens/home_screen.dart';
import 'package:pkp_hub/features/main/screens/profile_screen.dart';
import 'package:pkp_hub/features/main/bindings/projects_binding.dart';
import 'package:pkp_hub/features/main/screens/projects_screen.dart';

class MainController extends BaseController {
  final UserStorage _userStorage;

  MainController(this._userStorage);

  final RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  final RxString _token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final token = await _userStorage.getToken();
    _token.value = token ?? '';
  }

  bool get isLoggedIn => _token.value.isNotEmpty;

  final List<Widget> pages = const [
    HomeScreen(),
    ProjectsScreen(controllerTag: ProjectsBinding.mainTag),
    ProfileScreen(),
  ];

  void onDestinationSelected(int index) {
    _handleDestinationSelection(index);
  }

  Future<void> _handleDestinationSelection(int index) async {
    await _loadToken();
    if ((index == 1 || index == 2) && !isLoggedIn) {
      await Get.toNamed(
        AppRoutes.login,
        arguments: {'fromRoute': AppRoutes.main, 'returnArguments': null},
      );
      await _loadToken();
      if (!isLoggedIn) {
        return;
      }
    }
    _switchTab(index);
  }

  void _switchTab(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

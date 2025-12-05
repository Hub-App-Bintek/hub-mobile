import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/project_type.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';
import 'package:pkp_hub/features/main/controllers/profile_controller.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';
import 'package:pkp_hub/features/main/screens/home_screen.dart';
import 'package:pkp_hub/features/main/screens/profile_screen.dart';
import 'package:pkp_hub/features/main/screens/projects_screen.dart';

class MainController extends BaseController {
  final UserStorage _userStorage;

  MainController(this._userStorage);

  final RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();
  int? _pendingPageIndex;
  int? _pendingVisibleIndex;

  final RxString _token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadToken();
    applyNavigationArgs(Get.arguments);
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _applyPendingNavigation();
    });
  }

  Future<void> _loadToken() async {
    final token = await _userStorage.getToken();
    _token.value = token ?? '';
  }

  bool get isLoggedIn => _token.value.isNotEmpty;

  final List<Widget> pages = const [
    HomeScreen(),
    ProjectsScreen(),
    ProfileScreen(),
  ];

  void onDestinationSelected(int index) {
    _handleDestinationSelection(index);
  }

  Future<void> _handleDestinationSelection(int index) async {
    await _loadToken();
    if ((index == 1 || index == 2) && !isLoggedIn) {
      navigateTo(AppRoutes.login);
    } else {
      _switchTab(index);
      _notifyPageVisible(index);
    }
  }

  void _switchTab(int index) {
    selectedIndex.value = index;
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    } else {
      _pendingPageIndex = index;
    }
  }

  void _notifyPageVisible(int index) {
    if (!pageController.hasClients) {
      _pendingVisibleIndex = index;
      return;
    }
    if (index == 0 && Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().onPageVisible();
    } else if (index == 1 && Get.isRegistered<ProjectsController>()) {
      Get.find<ProjectsController>().onPageVisible();
    } else if (index == 2 && Get.isRegistered<ProfileController>()) {
      Get.find<ProfileController>().onPageVisible();
    }
  }

  void _applyPendingNavigation() {
    if (pageController.hasClients) {
      if (_pendingPageIndex != null) {
        final idx = _pendingPageIndex!;
        _pendingPageIndex = null;
        pageController.jumpToPage(idx);
      }
      if (_pendingVisibleIndex != null) {
        final idx = _pendingVisibleIndex!;
        _pendingVisibleIndex = null;
        _notifyPageVisible(idx);
      }
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void applyNavigationArgs(dynamic args) {
    if (args is! MainNavigationArgs) return;

    final targetIndex = args.selectedIndex;
    if (targetIndex != null) {
      _switchTab(targetIndex);
      _notifyPageVisible(targetIndex);
    }

    if (args.consultationStatus != null &&
        Get.isRegistered<ProjectsController>()) {
      final projectsController = Get.find<ProjectsController>();
      projectsController.updateCategory(consultation);
      projectsController.updateConsultationStatusFilter(
        args.consultationStatus,
      );
    }
  }
}

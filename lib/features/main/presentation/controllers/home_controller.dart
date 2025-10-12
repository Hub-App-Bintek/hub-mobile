import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/widgets/pkp_modal_bottom_sheet_content.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';

class HomeController extends BaseController {
  final AuthSession _authSession;
  final RxDouble balance = 0.0.obs;
  final int projectCount = 4; // Dummy project count

  final PageController carouselController = PageController();
  final RxInt currentCarouselIndex = 0.obs;
  Timer? _carouselTimer;

  final List<String> carouselImages = [
    'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=800&h=400&fit=crop',
  ];

  HomeController(this._authSession);

  bool get isLoggedIn => _authSession.token?.isNotEmpty == true;

  @override
  void onInit() {
    super.onInit();
    loadBalance();
    // _startCarouselTimer moved to onReady to ensure PageView is attached
  }

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

  void onMenuItemTapped(BuildContext context, String menu) {
    if (!isLoggedIn) {
      navigateTo(AppRoutes.login);
      return;
    }

    final route = _getRouteForMenu(menu);
    if (route == null) return;

    if (projectCount > 0) {
      // 1. Prepare the data (the list of widgets)
      final List<Widget> projectItems = List.generate(
        projectCount,
        (index) => ListTile(
          title: Text('Project ${index + 1}'),
          onTap: () {
            Get.back(); // Close bottom sheet
            navigateTo(route);
          },
        ),
      );

      projectItems.add(
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('Buat project baru'),
          onTap: () {
            Get.back();
            navigateTo(route);
          },
        ),
      );

      // 2. Delegate UI rendering to the View layer
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext sheetContext) {
          return PkpModalBottomSheetContent(
            type: PkpBottomSheetContentType.itemList,
            items: projectItems,
          );
        },
      );
    } else {
      // Fallback for users with no projects
      navigateTo(route);
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
    // Cancel any existing timer to avoid duplicates
    _carouselTimer?.cancel();

    _carouselTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      // Ensure the PageController is attached before animating to a page
      if (!carouselController.hasClients) {
        return; // Not attached yet (e.g., before first frame) – skip this tick
      }

      if (carouselImages.isEmpty) return;

      if (currentCarouselIndex.value < carouselImages.length - 1) {
        currentCarouselIndex.value++;
      } else {
        currentCarouselIndex.value = 0;
      }

      // Animate safely now that we confirmed attachment
      carouselController.animateToPage(
        currentCarouselIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}

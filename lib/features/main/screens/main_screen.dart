import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/main/controllers/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: controller.pages,
      ),
      bottomNavigationBar: Obx(() {
        final currentIndex = controller.selectedIndex.value;
        Color iconColor(bool isActive) => isActive
            ? AppColors.primaryDarkest
            : AppColors.neutralMedium.withValues(alpha: 0.5);

        Widget navIcon(String asset, bool isActive) => SvgPicture.asset(
          asset,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(iconColor(isActive), BlendMode.srcIn),
        );

        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              top: BorderSide(
                color: AppColors.inputBorder.withValues(alpha: 0.6),
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            currentIndex: currentIndex,
            onTap: controller.onDestinationSelected,
            selectedItemColor: AppColors.primaryDark,
            unselectedItemColor: AppColors.neutralMedium.withValues(alpha: 0.5),
            selectedLabelStyle: AppTextStyles.bodyM.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutralMedium.withValues(alpha: 0.5),
              fontWeight: FontWeight.w500,
            ),
            items: [
              BottomNavigationBarItem(
                icon: navIcon(AppIcons.navHome, false),
                activeIcon: navIcon(AppIcons.navHome, true),
                label: AppStrings.bottomNavHome,
              ),
              BottomNavigationBarItem(
                icon: navIcon(AppIcons.navProjects, false),
                activeIcon: navIcon(AppIcons.navProjects, true),
                label: AppStrings.bottomNavProject,
              ),
              BottomNavigationBarItem(
                icon: navIcon(AppIcons.navProfile, false),
                activeIcon: navIcon(AppIcons.navProfile, true),
                label: AppStrings.bottomNavProfile,
              ),
            ],
          ),
        );
      }),
    );
  }
}

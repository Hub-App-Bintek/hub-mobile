import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/main/presentation/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PkpAppBar(
        showNavigation: false,
        actions: Icons.mail_rounded,
        onActionPressed: controller.onNotificationTapped,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCarouselBanner(),
              const SizedBox(height: 16),
              _buildBalanceCard(),
              const SizedBox(height: 16),
              _buildMenuGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselBanner() {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller.carouselController,
            onPageChanged: (index) {
              controller.currentCarouselIndex.value = index;
            },
            itemCount: controller.carouselImages.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.carouselImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: _buildCarouselIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselIndicator() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.carouselImages.length,
          (index) => Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.currentCarouselIndex.value == index
                  ? AppColors.primaryDarkest
                  : AppColors.primaryLight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryLightest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutralDarkest.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.account_balance_wallet_outlined,
            color: AppColors.primaryDarkest,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Obx(
              () => Text(
                Formatters.currency(controller.balance.value),
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: AppColors.primaryDarkest,
              size: 24,
            ),
            onPressed: () {
              // TODO: Implement top-up functionality
            },
          ),
        ],
      ),
    );
  }

  // TODO: Replace placeholder images with actual assets or network images
  Widget _buildMenuGrid() {
    final menuItems = [
      (
        AppStrings.menuConsultation,
        'https://images.unsplash.com/photo-1556157382-97eda2d62296?w=400&h=300&fit=crop',
      ),
      (
        AppStrings.menuLicensing,
        'https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=400&h=300&fit=crop',
      ),
      (
        AppStrings.menuMaterial,
        'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=400&h=300&fit=crop',
      ),
      (
        AppStrings.menuConstruction,
        'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=400&h=300&fit=crop',
      ),
      (
        AppStrings.menuMonitoring,
        'https://images.unsplash.com/photo-1464983953574-0892a716854b?w=400&h=300&fit=crop',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return _buildMenuItem(
            title: menuItems[index].$1,
            imageUrl: menuItems[index].$2,
            onTap: () => controller.onMenuItemTapped(context, menuItems[index].$1),
          );
        },
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.neutralDarkest.withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Center(
                  child: Text(
                    title,
                    style: AppTextStyles.bodyXL.copyWith(
                      color: AppColors.neutralDarkest,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

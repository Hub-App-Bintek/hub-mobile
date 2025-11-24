import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/main/controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(
        title: AppStrings.profileScreenTitle,
        showNavigation: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProfileHeader(controller: controller),
              _Section(
                title: AppStrings.accountInformation,
                children: [
                  Obx(
                    () => _ActionTile(
                      icon: Icons.verified_user_outlined,
                      iconBackground: AppColors.inputSurface,
                      title: AppStrings.verifyProfile,
                      subtitle: controller.isVerified.value
                          ? AppStrings.verificationCompleted
                          : AppStrings.verificationPending,
                      subtitleColor: AppColors.neutralMedium,
                      onTap: controller.onVerifyProfilePressed,
                    ),
                  ),
                  Obx(
                    () => _ActionTile(
                      icon: Icons.mail_outline,
                      iconBackground: AppColors.primaryLightest,
                      title: AppStrings.emailLabel,
                      subtitle: controller.userEmail.value,
                      subtitleColor: AppColors.neutralMediumLight,
                    ),
                  ),
                ],
              ),
              _Section(
                title: AppStrings.otherActions,
                children: [
                  _ActionTile(
                    icon: Icons.logout,
                    iconBackground: AppColors.khaki,
                    backgroundColor: AppColors.krem,
                    title: AppStrings.logout,
                    subtitle: '',
                    subtitleColor: AppColors.neutralMediumLight,
                    iconColor: AppColors.neutralDarkest,
                    onTap: controller.onLogoutPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.inputSurface,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(90),
            ),
            child: const Icon(
              Icons.person_outline,
              color: AppColors.white,
              size: 48,
            ),
          ),
          const SizedBox(height: 12),
          Obx(
            () => Text(
              controller.userName.value,
              style: AppTextStyles.h1.copyWith(color: AppColors.neutralDarkest),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.h3.copyWith(color: AppColors.neutralDarkest),
          ),
          const SizedBox(height: 16),
          ...children.map(
            (child) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.subtitleColor,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
  });

  final IconData icon;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final Color subtitleColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 72,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.inputSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor ?? AppColors.neutralMediumLight,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralDarkest,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle.toUpperCase(),
                    style: AppTextStyles.caption.copyWith(
                      color: subtitleColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.neutralMediumLight),
        ],
      ),
    );

    if (onTap == null) return content;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: content,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/project/controllers/design_type_controller.dart';

class DesignTypeScreen extends GetView<DesignTypeController> {
  const DesignTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(
        showNavigation: true,
        leadingColor: AppColors.white,
        backgroundColor: AppColors.primaryDark,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryDark,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.designType,
                  width: 48,
                  height: 48,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.designTypeTitle,
              style: AppTextStyles.h2.copyWith(color: AppColors.neutralDarkest),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _DesignTypeCard(
              iconAsset: AppIcons.designNonPrototype,
              title: AppStrings.designTypeNonPrototypeTitle,
              subtitle: AppStrings.designTypeNonPrototypeSubtitle,
              onTap: controller.onSelectNonPrototype,
            ),
            const SizedBox(height: 16),
            _DesignTypeCard(
              iconAsset: AppIcons.designPrototype,
              title: AppStrings.designTypePrototypeTitle,
              subtitle: AppStrings.designTypePrototypeSubtitle,
              onTap: controller.onSelectPrototype,
            ),
          ],
        ),
      ),
    );
  }
}

class _DesignTypeCard extends StatelessWidget {
  const _DesignTypeCard({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String iconAsset;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryDark,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryDarkest,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconAsset,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.h3.copyWith(
                        fontSize: 16,
                        color: AppColors.white,
                        letterSpacing: 0.08,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.white,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/project/controllers/prototype_designs_controller.dart';
import 'package:pkp_hub/features/project/models/prototype_design.dart';

class PrototypeDesignsScreen extends GetView<PrototypeDesignsController> {
  const PrototypeDesignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(
        title: AppStrings.prototypeDesignsTitle,
        showNavigation: true,
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        leadingColor: AppColors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemCount: controller.designs.length,
          itemBuilder: (context, index) {
            final design = controller.designs[index];
            return _DesignCard(
              design: design,
              onTap: () => controller.onOpenDetails(design),
              onDownload: () => controller.onDownload(design),
            );
          },
        ),
      ),
    );
  }
}

class _DesignCard extends StatelessWidget {
  const _DesignCard({
    required this.design,
    required this.onTap,
    required this.onDownload,
  });

  final PrototypeDesign design;
  final VoidCallback onTap;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder, width: 0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  design.title,
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.neutralDarkest,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Luas Bangunan / Luas Tanah: ${design.buildingArea} / ${design.landArea}',
                  style: AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralMedium.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  design.subtitle.toUpperCase(),
                  style: AppTextStyles.bodyXS.copyWith(
                    color: AppColors.neutralMedium.withValues(alpha: 0.8),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: PkpElevatedButton(
              text: AppStrings.prototypeDesignsCta,
              size: PkpButtonSize.medium,
              onPressed: onDownload,
            ),
          ),
        ],
      ),
    );
  }
}

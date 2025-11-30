import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';
import 'package:pkp_hub/features/project/controllers/prototype_designs_controller.dart';

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
        child: Obx(() {
          final designs = controller.designs;
          if (controller.isLoading.value && designs.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (designs.isEmpty) {
            return const Center(
              child: Text('Belum ada desain prototype tersedia.'),
            );
          }
          return RefreshIndicator(
            onRefresh: controller.fetchDesigns,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: designs.length,
              itemBuilder: (context, index) {
                final design = designs[index];
                return _DesignCard(
                  design: design,
                  onTap: () => controller.onOpenDetails(design),
                  onDownload: () => controller.onDownload(design),
                  isDownloading:
                      controller.downloadingDesignId.value == design.id,
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

class _DesignCard extends StatelessWidget {
  const _DesignCard({
    required this.design,
    required this.onTap,
    required this.onDownload,
    required this.isDownloading,
  });

  final PrototypeDesign design;
  final VoidCallback onTap;
  final VoidCallback onDownload;
  final bool isDownloading;

  @override
  Widget build(BuildContext context) {
    final buildingArea = _formatArea(design.buildingArea);
    final landArea = _formatArea(design.landArea);
    final subtitle = design.description?.isNotEmpty == true
        ? design.description!
        : (design.type ?? '-');

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder, width: 1),
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
                  design.name ?? '-',
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.neutralDarkest,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Luas Bangunan / Luas Tanah: $buildingArea / $landArea',
                  style: AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralMedium,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.bodyXS.copyWith(
                    color: AppColors.neutralMedium,
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
              isLoading: isDownloading,
              onPressed: onDownload,
            ),
          ),
        ],
      ),
    );
  }

  String _formatArea(num? value) {
    if (value == null) return '-';
    // Display without trailing .0 for whole numbers
    final text = value % 1 == 0 ? value.toInt().toString() : value.toString();
    return '${text}m²';
  }
}

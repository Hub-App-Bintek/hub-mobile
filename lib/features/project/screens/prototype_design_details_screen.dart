import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_confirmation_dialog.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';
import 'package:pkp_hub/features/project/controllers/prototype_design_details_controller.dart';
import 'package:pkp_hub/features/project/models/prototype_design.dart';

class PrototypeDesignDetailsScreen
    extends GetView<PrototypeDesignDetailsController> {
  const PrototypeDesignDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final design = controller.design;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(
        title: 'Detail Desain',
        backgroundColor: AppColors.primaryDark,
        leadingColor: AppColors.white,
        titleTextColor: AppColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderImage(imageUrl: controller.imageUrl),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          design.title,
                          style: AppTextStyles.h1.copyWith(
                            color: AppColors.neutralDarkest,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 18),
                        _StatRow(design: design),
                        const SizedBox(height: 18),
                        const Divider(color: AppColors.inputBorder, height: 1),
                        const SizedBox(height: 18),
                        const _SectionTitle('Deskripsi'),
                        const SizedBox(height: 8),
                        Text(
                          'Desain rumah minimalis untuk lahan terbatas. '
                          'Cocok untuk pasangan muda atau single yang '
                          'menginginkan hunian efisien dengan budget terjangkau. '
                          'Layout yang kompak namun tetap fungsional.',
                          style: AppTextStyles.bodyM.copyWith(
                            color: AppColors.neutralMedium,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const _SectionTitle('Fitur Utama'),
                        const SizedBox(height: 12),
                        ...controller.features.map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle_outline,
                                  color: AppColors.successDark,
                                  size: 18,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: AppTextStyles.bodyM.copyWith(
                                      color: AppColors.neutralMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const _SectionTitle('Spesifikasi'),
                        const SizedBox(height: 12),
                        _SpecsCard(specs: controller.specs),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(top: BorderSide(color: AppColors.inputBorder)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: PkpOutlinedButton(
                      text: 'Unduh Dokumen',
                      onPressed: controller.onDownloadPressed,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PkpElevatedButton(
                      text: 'Pilih Desain',
                      onPressed: () => _showSelectConfirmation(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showSelectConfirmation(BuildContext context) {
    return PkpConfirmationDialog.show(
      title: 'Konfirmasi',
      message: 'Apakah Anda yakin ingin memilih desain ini?',
      onConfirm: controller.onSelectDesign,
      barrierDismissible: false,
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 393 / 256,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: AppColors.inputSurface,
          child: const Icon(
            Icons.image_not_supported_outlined,
            color: AppColors.neutralMedium,
            size: 36,
          ),
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.design});

  final PrototypeDesign design;

  @override
  Widget build(BuildContext context) {
    final stats = [
      (value: design.buildingArea, label: 'Luas Bangunan'),
      (value: design.landArea, label: 'Luas Tanah'),
      (value: '1', label: 'Kamar Tidur'),
      (value: '1', label: 'Kamar Mandi'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: stats
          .map(
            (item) => Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.value,
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.neutralDarkest,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: AppTextStyles.bodyS.copyWith(
                      color: AppColors.neutralMedium,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.h4.copyWith(color: AppColors.neutralDarkest),
    );
  }
}

class _SpecsCard extends StatelessWidget {
  const _SpecsCard({required this.specs});

  final Map<String, String> specs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        children: specs.entries
            .map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.neutralMedium,
                      ),
                    ),
                    Text(
                      entry.value,
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.neutralDarkest,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';
import 'package:pkp_hub/features/project/controllers/prototype_design_details_controller.dart';

class PrototypeDesignDetailsScreen
    extends GetView<PrototypeDesignDetailsController> {
  const PrototypeDesignDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(title: 'Detail Desain'),
      body: Obx(() {
        final design = controller.design.value;
        final features = controller.features;
        final specs = controller.specs;

        if (controller.isLoading.value && design == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (design == null) {
          return const Center(child: Text('Desain tidak ditemukan.'));
        }

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeaderImage(imageUrls: controller.imageUrls),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            design.name ?? '-',
                            style: AppTextStyles.h1.copyWith(
                              color: AppColors.neutralDarkest,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _StatRow(design: design),
                          const SizedBox(height: 16),
                          const Divider(
                            color: AppColors.inputBorder,
                            height: 1,
                          ),
                          const SizedBox(height: 16),
                          const _SectionTitle('Deskripsi'),
                          const SizedBox(height: 8),
                          Text(
                            design.description ??
                                'Deskripsi desain belum tersedia.',
                            style: AppTextStyles.bodyM.copyWith(
                              color: AppColors.neutralMedium,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const _SectionTitle('Fitur Utama'),
                          const SizedBox(height: 8),
                          if (features.isEmpty)
                            Text(
                              'Fitur belum tersedia.',
                              style: AppTextStyles.bodyM.copyWith(
                                color: AppColors.neutralMedium,
                              ),
                            )
                          else
                            ...features.map(
                              (item) => Row(
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
                          const SizedBox(height: 24),
                          const _SectionTitle('Spesifikasi'),
                          const SizedBox(height: 12),
                          specs.isEmpty
                              ? Text(
                                  'Spesifikasi belum tersedia.',
                                  style: AppTextStyles.bodyM.copyWith(
                                    color: AppColors.neutralMedium,
                                  ),
                                )
                              : _SpecsCard(specs: specs),
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
                      child: PkpElevatedButton(
                        text: 'Unduh Dokumen',
                        isLoading: controller.downloadLoading.value,
                        onPressed: controller.onDownloadPressed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _HeaderImage extends StatefulWidget {
  const _HeaderImage({required this.imageUrls});

  final List<String> imageUrls;

  @override
  State<_HeaderImage> createState() => _HeaderImageState();
}

class _HeaderImageState extends State<_HeaderImage> {
  late final PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final urls = widget.imageUrls;
    if (urls.isEmpty) {
      return AspectRatio(
        aspectRatio: 393 / 256,
        child: Container(
          color: AppColors.inputSurface,
          child: const Icon(
            Icons.image_not_supported_outlined,
            color: AppColors.neutralMedium,
            size: 36,
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 393 / 256,
          child: PageView.builder(
            controller: _pageController,
            itemCount: urls.length,
            onPageChanged: (idx) => setState(() => _page = idx),
            itemBuilder: (context, index) {
              final url = urls[index];
              return Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.inputSurface,
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColors.neutralMedium,
                    size: 36,
                  ),
                ),
              );
            },
          ),
        ),
        if (urls.length > 1)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(urls.length, (index) {
                final active = index == _page;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 10 : 6,
                  height: active ? 10 : 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active
                        ? AppColors.primaryDark
                        : AppColors.neutralMedium.withValues(alpha: 0.4),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.design});

  final PrototypeDesign design;

  @override
  Widget build(BuildContext context) {
    final stats = [
      (value: _formatArea(design.buildingArea), label: 'Luas Bangunan'),
      (value: _formatArea(design.landArea), label: 'Luas Tanah'),
      (value: _formatCount(design.bedrooms), label: 'Kamar Tidur'),
      (value: _formatCount(design.bathrooms), label: 'Kamar Mandi'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: stats
          .map(
            (item) => Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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

  String _formatArea(num? value) {
    if (value == null) return '-';
    final text = value % 1 == 0 ? value.toInt().toString() : value.toString();
    return '${text}m²';
  }

  String _formatCount(int? value) {
    if (value == null) return '-';
    return value.toString();
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

  final List<MapEntry<String, String>> specs;

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
        children: specs
            .map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        entry.key,
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.neutralMedium,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
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

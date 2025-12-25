import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_confirmation_dialog.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/consultation/controllers/consultant_details_controller.dart';

class ConsultantDetailsScreen extends GetView<ConsultantDetailsController> {
  const ConsultantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: 'Detail Konsultan'),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Obx(
          () => PkpBottomActions(
            primaryText: AppStrings.askForConsultation,
            onPrimaryPressed: () => _showConsultConfirmation(context),
            primaryEnabled: !controller.isCreatingConsultation.value,
            primaryLoading: controller.isCreatingConsultation.value,
            secondaryText: AppStrings.chatConsultant,
            onSecondaryPressed: controller.isCreatingConsultation.value
                ? null
                : controller.onChatPressed,
            secondaryEnabled: !controller.isCreatingConsultation.value,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          final portfolios = controller.portfolios.toList();
          final isLoading = controller.isLoading.value && portfolios.isEmpty;

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            color: AppColors.primaryDarkest,
            onRefresh: controller.refreshList,
            child: CustomScrollView(
              controller: controller.scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ConsultantHeader(controller: controller),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Portfolio',
                          style: AppTextStyles.h3.copyWith(
                            color: AppColors.neutralDarkest,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (portfolios.isEmpty && !controller.isLoading.value)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _EmptyPortfolio(onRetry: controller.refreshList),
                    ),
                  ),
                if (portfolios.isNotEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index >= portfolios.length) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          final item = portfolios[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: (index == (portfolios.length - 1))
                                  ? 0
                                  : 16,
                            ),
                            child: _PortfolioCard(
                              title: item.projectName,
                              location: item.detailDescription,
                              year: item.createdAt.year.toString(),
                              imageUrl: item.imageUrls.isNotEmpty
                                  ? item.imageUrls[0]
                                  : '',
                              priceLabel: item.price > 0
                                  ? Formatters.currency(item.price.toDouble())
                                  : "Gratis",
                            ),
                          );
                        },
                        childCount:
                            portfolios.length +
                            (controller.isLoading.value ? 1 : 0),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Future<void> _showConsultConfirmation(BuildContext context) async {
    final loggedIn = await controller.ensureLoggedIn();
    if (!loggedIn) return;

    final consultantName = controller.consultantName.value ?? 'konsultan ini';

    return PkpConfirmationDialog.show(
      title: 'Konfirmasi Konsultasi',
      message: 'Mulai konsultasi dengan $consultantName?',
      onConfirm: controller.onConsultPressed,
      barrierDismissible: false,
    );
  }
}

class _ConsultantHeader extends StatelessWidget {
  const _ConsultantHeader({required this.controller});

  final ConsultantDetailsController controller;

  @override
  Widget build(BuildContext context) {
    final name = controller.consultantName.value?.trim();
    final speciality = controller.consultantSpeciality.value?.trim();
    final rating = controller.consultantRating.value;
    final price = controller.consultantPrice.value;
    final reviewCount = controller.completedProjectsCount;
    final reviewLabel = reviewCount > 0
        ? '($reviewCount ulasan)'
        : '(Belum ada ulasan)';
    final aboutText = controller.consultantAbout.value.trim();

    return Container(
      decoration: const BoxDecoration(color: AppColors.inputSurface),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    color: AppColors.primaryLightest,
                    width: 82,
                    height: 82,
                    child: _NetworkAvatar(
                      imageUrl: controller.consultantAvatarUrl.value ?? '',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name?.isNotEmpty == true ? name! : 'Nama Konsultan',
                        style: AppTextStyles.h2.copyWith(
                          color: AppColors.neutralDarkest,
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (speciality?.isNotEmpty == true)
                        Text(
                          speciality!.toUpperCase(),
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.neutralMedium,
                          ),
                        ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            rating != null ? rating.toStringAsFixed(1) : '-',
                            style: AppTextStyles.bodyM.copyWith(
                              color: AppColors.neutralMedium,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              reviewLabel,
                              style: AppTextStyles.bodyM.copyWith(
                                color: AppColors.neutralMedium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        (price != null || price?.isGreaterThan(0) == true)
                            ? Formatters.currency(price ?? 0)
                            : 'Gratis',
                        style: AppTextStyles.h3.copyWith(
                          color: AppColors.neutralDarkest,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: AppColors.inputBorder, height: 1),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _MetricTile(
                    value: controller.experienceText,
                    label: 'Pengalaman',
                  ),
                ),
                Container(width: 1, height: 38, color: AppColors.inputBorder),
                Expanded(
                  child: _MetricTile(
                    value: controller.completedProjectsCount.toString(),
                    label: 'Proyek Selesai',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.inputBorder, height: 1),
            const SizedBox(height: 16),
            Text(
              'Tentang',
              style: AppTextStyles.h4.copyWith(color: AppColors.neutralDarkest),
            ),
            const SizedBox(height: 8),
            Text(
              aboutText.isNotEmpty
                  ? aboutText
                  : 'Spesialis desain rumah modern minimalis dengan pengalaman lebih dari 10 tahun. Fokus pada efisiensi ruang dan estetika kontemporer.',
              style: AppTextStyles.bodyM.copyWith(
                color: AppColors.neutralMedium,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value.isNotEmpty ? value : '-',
          style: AppTextStyles.h3.copyWith(color: AppColors.neutralDarkest),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppTextStyles.bodyM.copyWith(color: AppColors.neutralMedium),
        ),
      ],
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  const _PortfolioCard({
    required this.title,
    required this.location,
    required this.year,
    required this.imageUrl,
    this.priceLabel,
  });

  final String title;
  final String location;
  final String year;
  final String imageUrl;
  final String? priceLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: _NetworkImage(imageUrl: imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyles.bodyS.copyWith(
                          color: AppColors.neutralDarkest,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      year,
                      style: AppTextStyles.bodyXS.copyWith(
                        color: AppColors.neutralMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  location.isNotEmpty ? location : 'Deskripsi belum tersedia',
                  style: AppTextStyles.bodyXS.copyWith(
                    color: AppColors.neutralMedium,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                if (priceLabel != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      priceLabel!,
                      style: AppTextStyles.bodyXS.copyWith(
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NetworkImage extends StatelessWidget {
  const _NetworkImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Container(
        color: AppColors.primaryLightest,
        child: const Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: AppColors.neutralMedium,
            size: 32,
          ),
        ),
      );
    }

    return Image.network(
      imageUrl,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        color: AppColors.primaryLightest,
        child: const Icon(
          Icons.image_not_supported_outlined,
          color: AppColors.neutralMedium,
          size: 32,
        ),
      ),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: AppColors.primaryLightest,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primaryDarkest,
            ),
          ),
        );
      },
    );
  }
}

class _NetworkAvatar extends StatelessWidget {
  const _NetworkAvatar({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return const Icon(Icons.person, color: AppColors.primaryDark, size: 36);
    }

    return _NetworkImage(imageUrl: imageUrl);
  }
}

class _EmptyPortfolio extends StatelessWidget {
  const _EmptyPortfolio({required this.onRetry});

  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          'Belum ada portfolio.',
          style: AppTextStyles.bodyM.copyWith(color: AppColors.neutralDarkest),
        ),
        const SizedBox(height: 8),
        Text(
          'Tarik ke bawah untuk memuat ulang atau coba beberapa saat lagi.',
          style: AppTextStyles.bodyS.copyWith(color: AppColors.neutralMedium),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: onRetry,
          child: const Text(AppStrings.retryButton),
        ),
      ],
    );
  }
}

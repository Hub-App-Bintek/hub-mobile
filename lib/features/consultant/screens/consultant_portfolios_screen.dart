import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/consultant/controllers/consultant_portfolios_controller.dart';

class ConsultantPortfoliosScreen
    extends GetView<ConsultantPortfoliosController> {
  const ConsultantPortfoliosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(title: AppStrings.menuConsultation),
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        final items = controller.portfolios; // RxList
        final isLoading = controller.isLoading.value; // RxBool
        final hasMore = controller.hasMore.value; // RxBool

        // Initial loading spinner (first page)
        final initialLoading = isLoading && items.isEmpty;
        if (initialLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Empty state (after load)
        if (!isLoading && items.isEmpty) {
          return const _EmptyState();
        }

        final showLoaderRow = hasMore || isLoading;

        return RefreshIndicator(
          onRefresh: controller.refreshList,
          child: ListView.separated(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(16),
            cacheExtent: 800,
            itemCount: items.length + (showLoaderRow ? 1 : 0),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              if (index >= items.length) {
                return const _TailLoader();
              }

              final item = items[index];
              final String imageUrl = _firstOrEmpty(item.imageUrls);
              return _PortfolioCard(
                key: ValueKey(item.id),
                title: item.projectName,
                price: (item.price).toDouble(),
                description: item.detailDescription,
                imageUrl: imageUrl,
              );
            },
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        debugPrint('Show action button: ${controller.showActionButton.value}');
        return controller.showActionButton.value
            ? SafeArea(
                minimum: const EdgeInsets.all(16),
                child: PkpElevatedButton(
                  text: AppStrings.menuConsultation,
                  enabled: true,
                  onPressed: () {
                    controller.createConsultation(channel: "CHAT");
                  },
                ),
              )
            : const SizedBox.shrink();
      }),
    );
  }
}

String _firstOrEmpty(List<String>? list) {
  if (list == null || list.isEmpty) return '';
  return list.first;
}

class _TailLoader extends StatelessWidget {
  const _TailLoader();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 120),
        Icon(
          Icons.image_outlined,
          size: 56,
          color: AppColors.neutralDarkest.withOpacity(0.35),
        ),
        const SizedBox(height: 12),
        Text(
          'No portfolios yet',
          textAlign: TextAlign.center,
          style: AppTextStyles.h4.copyWith(color: AppColors.neutralDarkest),
        ),
        const SizedBox(height: 6),
        Text(
          'Pull to refresh.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyS.copyWith(color: AppColors.neutralMedium),
        ),
      ],
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  const _PortfolioCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  final String title;
  final double price;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // Constrain text; avoid bottom overflow with long strings / large text scale
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header image area
          SizedBox(
            height: 140,
            child: Container(
              color: AppColors.primaryLightest,
              alignment: Alignment.center,
              child: _ImageThumb(url: imageUrl),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.neutralDarkest,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  Formatters.currency(price),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralMedium,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  softWrap: true,
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                  style: AppTextStyles.bodyS.copyWith(
                    color: AppColors.neutralMedium,
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

class _ImageThumb extends StatelessWidget {
  const _ImageThumb({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return const Icon(
        Icons.image_outlined,
        color: AppColors.primary,
        size: 48,
      );
    }

    // Use small decode size; memCacheWidth multiplies devicePixelRatio internally
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: url,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        memCacheWidth: 160 * 3,
        fadeInDuration: const Duration(milliseconds: 120),
        placeholder: (_, __) => const SizedBox(
          width: 80,
          height: 80,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        errorWidget: (_, __, ___) => const Icon(
          Icons.broken_image_outlined,
          size: 40,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

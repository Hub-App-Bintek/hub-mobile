import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/features/consultant/controllers/consultants_controller.dart';

class ConsultantsScreen extends GetView<ConsultantsController> {
  const ConsultantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(title: 'Consultants'),
      body: RefreshIndicator(
        onRefresh: controller.refreshList,
        color: AppColors.primaryDarkest,
        child: Obx(() {
          final items = controller.consultants;
          final isLoading = controller.isLoading.value;
          final hasMore = controller.hasMore.value;

          // Show a big spinner only for the very first load
          final initialLoading = isLoading && items.isEmpty;
          if (initialLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Empty state
          if (!isLoading && items.isEmpty) {
            return _EmptyState(onRetry: controller.refreshList);
          }

          final showLoaderTile = hasMore || isLoading;

          return GridView.builder(
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            cacheExtent: 1200,
            // small look-ahead for smoother scrolling
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.92,
            ),
            itemCount: items.length + (showLoaderTile ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= items.length) {
                return const _LoaderTile();
              }

              final item = items[index];
              return ConsultantCard(
                key: ValueKey(item.id ?? index),
                consultant: item,
                onTap: () => controller.goToPortfolio(
                  item.id.toString(),
                  item.hourlyRate ?? 0.0,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class _LoaderTile extends StatelessWidget {
  const _LoaderTile();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onRetry});

  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 120),
        Icon(
          Icons.group_outlined,
          size: 56,
          color: AppColors.neutralDarkest.withOpacity(0.35),
        ),
        const SizedBox(height: 12),
        Text(
          'No consultants found',
          textAlign: TextAlign.center,
          style: AppTextStyles.h4.copyWith(color: AppColors.neutralDarkest),
        ),
        const SizedBox(height: 6),
        Text(
          'Pull to refresh or try again.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyS.copyWith(
            color: AppColors.neutralDarkest.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: OutlinedButton(onPressed: onRetry, child: const Text('Retry')),
        ),
      ],
    );
  }
}

class ConsultantCard extends StatelessWidget {
  const ConsultantCard({
    super.key,
    required this.consultant,
    required this.onTap,
  });

  final Consultant consultant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryLightest,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  _Avatar(avatarUrl: consultant.avatarUrl),
                  const Spacer(),
                  Text(
                    consultant.fullName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyM.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.neutralDarkest,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Formatters.currency(consultant.packageCost ?? 0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyS.copyWith(
                      color: AppColors.neutralDarkest.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            if (consultant.rating != null)
              Positioned(
                top: 10,
                right: 10,
                child: _RatingBadge(rating: consultant.rating!),
              ),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({this.avatarUrl});

  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final hasImage = avatarUrl != null && avatarUrl!.trim().isNotEmpty;
    return CircleAvatar(
      radius: 48,
      backgroundColor: AppColors.primaryLight,
      backgroundImage: hasImage ? NetworkImage(avatarUrl!) : null,
      child: hasImage
          ? null
          : const Icon(Icons.person, color: AppColors.primaryDarkest),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryDarkest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, size: 14, color: AppColors.white),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: AppTextStyles.actionS.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

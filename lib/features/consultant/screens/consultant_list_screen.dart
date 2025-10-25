import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/consultant.dart';
import 'package:pkp_hub/features/consultant/controllers/consultant_list_controller.dart';

class ConsultantListScreen extends GetView<ConsultantListController> {
  const ConsultantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(title: 'Consultants'),
      body: RefreshIndicator(
        onRefresh: controller.refreshList,
        color: AppColors.primaryDarkest,
        child: Obx(
          () => CustomScrollView(
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.92,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ConsultantCard(
                      consultant: controller.consultants[index],
                      onTap: () {
                        controller.goToPortfolio(
                          controller.consultants[index].id ?? '',
                        );
                      },
                    );
                  }, childCount: controller.consultants.length),
                ),
              ),
              SliverToBoxAdapter(
                child: controller.isLoading.value
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : const SizedBox.shrink(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
          ),
        ),
      ),
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
                      color: AppColors.neutralDarkest.withValues(alpha: 0.6),
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

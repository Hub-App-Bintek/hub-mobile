import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/features/consultant/controllers/consultant_list_controller.dart';
import 'package:pkp_hub/data/models/consultant.dart' as dto;

class ConsultantListScreen extends GetView<ConsultantListController> {
  const ConsultantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    final c = controller.items[index];
                    return ConsultantCard(consultant: c);
                  }, childCount: controller.items.length),
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
  const ConsultantCard({super.key, required this.consultant});

  final dto.Consultant consultant;

  @override
  Widget build(BuildContext context) {
    final subtitle = consultant.specialization?.trim().isNotEmpty == true
        ? consultant.specialization!
        : (consultant.email?.trim().isNotEmpty == true
              ? consultant.email!
              : (consultant.phone?.trim().isNotEmpty == true
                    ? consultant.phone!
                    : '-'));

    return Stack(
      children: [
        Container(
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
                consultant.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyM.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutralDarkest,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
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
      radius: 24,
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
    final bool strong = rating >= 4.5;
    final Color bg = strong
        ? AppColors.primaryDarkest
        : AppColors.primaryLightest;
    final Color fg = strong ? AppColors.white : AppColors.primaryDarkest;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 14, color: fg),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: AppTextStyles.actionS.copyWith(color: fg),
          ),
        ],
      ),
    );
  }
}

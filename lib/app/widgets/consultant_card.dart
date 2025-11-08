import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/consultant.dart';

class ConsultantCard extends StatelessWidget {
  const ConsultantCard({super.key, required this.consultant, this.onTap});

  final Consultant consultant;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
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
            style: AppTextStyles.bodyS.copyWith(
              color: AppColors.neutralDarkest,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            consultant.location ?? '-',
            style: AppTextStyles.bodyS.copyWith(
              color: AppColors.neutralDarkest,
            ),
          ),
        ],
      ),
    );

    final badge = consultant.rating != null
        ? Positioned(
            top: 10,
            right: 10,
            child: _RatingBadge(rating: consultant.rating!),
          )
        : null;

    Widget content = SizedBox(
      width: double.infinity,
      child: Stack(children: [card, if (badge != null) badge]),
    );

    if (onTap != null) {
      content = GestureDetector(onTap: onTap, child: content);
    }
    return content;
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({this.avatarUrl});

  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final hasImage = avatarUrl?.trim().isNotEmpty == true;
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

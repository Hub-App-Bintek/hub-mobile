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
    final price = consultant.packageCost ?? consultant.hourlyRate;
    final hasRating = consultant.rating != null;
    final hasPrice = price != null;

    Widget content = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 4),
          _Avatar(avatarUrl: consultant.avatarUrl, name: consultant.fullName),
          const SizedBox(height: 12),
          Text(
            consultant.fullName ?? '-',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyL.copyWith(
              color: AppColors.neutralDarkest,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            consultant.specialty ?? '-',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyL.copyWith(color: AppColors.neutralMedium),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: AppColors.neutralMedium,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  consultant.location ?? consultant.address ?? '-',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralMedium,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: hasRating && hasPrice
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (hasRating) _Rating(value: consultant.rating!),
              if (hasRating && hasPrice) const Spacer(),
              if (hasPrice)
                Text(
                  price > 0 ? Formatters.currency(price) : 'Gratis',
                  style: AppTextStyles.bodyL.copyWith(
                    color: AppColors.neutralDarkest,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        ],
      ),
    );

    if (onTap != null) {
      content = InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: content,
      );
    }
    return content;
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({this.avatarUrl, this.name});

  final String? avatarUrl;
  final String? name;

  @override
  Widget build(BuildContext context) {
    final hasImage = avatarUrl?.trim().isNotEmpty == true;
    final initials = (name ?? '').trim().isNotEmpty ? name!.trim()[0] : '';

    return CircleAvatar(
      radius: 32,
      backgroundColor: AppColors.primaryLightest,
      backgroundImage: hasImage ? NetworkImage(avatarUrl!) : null,
      child: hasImage
          ? null
          : Text(
              initials,
              style: AppTextStyles.h4.copyWith(
                color: AppColors.primaryDarkest,
                fontWeight: FontWeight.w700,
              ),
            ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star_rounded,
            size: 16,
            color: AppColors.warningDark,
          ),
          const SizedBox(width: 4),
          Text(
            value.toStringAsFixed(1),
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutralDarkest,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

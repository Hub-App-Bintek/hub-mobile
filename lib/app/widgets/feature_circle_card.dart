import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';

/// Circle menu button with FAB scaffold, label, and optional badge.
class FeatureCircleCard extends StatelessWidget {
  const FeatureCircleCard({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
    this.showBadge = false,
    this.badgeValue,
    this.badgeColor = AppColors.errorDark,
    this.backgroundColor = AppColors.primaryLightest,
    this.iconColor = AppColors.primaryDarkest,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final bool showBadge;
  final String? badgeValue;
  final Color badgeColor;
  final Color backgroundColor;
  final Color iconColor;

  bool get _isBadgeVisible =>
      showBadge && (badgeValue?.trim().isNotEmpty ?? false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        FloatingActionButton.large(
          heroTag: null,
          onPressed: onTap,
          backgroundColor: backgroundColor,
          elevation: 0,
          disabledElevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          shape: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 24, color: iconColor),
                const SizedBox(height: 6),
                Text(
                  label,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.neutralDarkest,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        if (_isBadgeVisible)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                badgeValue!,
                style: AppTextStyles.bodyXS.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

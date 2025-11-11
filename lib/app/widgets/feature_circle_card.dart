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
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.center,
          child: FloatingActionButton.large(
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
        ),
        if (_isBadgeVisible)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                badgeValue!,
                style: AppTextStyles.bodyXS.copyWith(color: AppColors.white),
              ),
            ),
          ),
      ],
    );
  }
}

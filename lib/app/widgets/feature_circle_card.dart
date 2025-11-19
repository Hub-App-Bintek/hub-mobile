import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';

/// Circle menu button with FAB scaffold, label, and optional badge.
class FeatureCircleCard extends StatelessWidget {
  const FeatureCircleCard({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
    this.showBadge = false,
    this.badgeValue,
    this.badgeColor = AppColors.errorDark,
    this.backgroundColor = AppColors.primaryLightest,
    this.iconColor = AppColors.primaryDarkest,
    this.labelOutside = false,
    this.labelStyle,
    this.iconSize = 24,
    this.iconWidget,
  }) : assert(
         icon != null || iconWidget != null,
         'Provide either icon or iconWidget',
       );

  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBadge;
  final String? badgeValue;
  final Color badgeColor;
  final Color backgroundColor;
  final Color iconColor;
  final bool labelOutside;
  final TextStyle? labelStyle;
  final double iconSize;
  final Widget? iconWidget;

  bool get _isBadgeVisible =>
      showBadge && (badgeValue?.trim().isNotEmpty ?? false);

  @override
  Widget build(BuildContext context) {
    final iconView = iconWidget ?? Icon(icon, size: iconSize, color: iconColor);

    if (labelOutside) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _CircleButton(
            backgroundColor: backgroundColor,
            iconChild: iconView,
            onTap: onTap,
            badgeColor: badgeColor,
            badgeValue: badgeValue,
            isBadgeVisible: _isBadgeVisible,
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style:
                labelStyle ??
                AppTextStyles.bodyL.copyWith(color: AppColors.neutralDarkest),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

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
                iconView,
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

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.backgroundColor,
    required this.iconChild,
    required this.onTap,
    required this.badgeColor,
    required this.badgeValue,
    required this.isBadgeVisible,
  });

  final Color backgroundColor;
  final Widget iconChild;
  final VoidCallback? onTap;
  final Color badgeColor;
  final String? badgeValue;
  final bool isBadgeVisible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: backgroundColor,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: 64,
              height: 64,
              child: Center(child: iconChild),
            ),
          ),
        ),
        if (isBadgeVisible)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              width: 20,
              height: 20,
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

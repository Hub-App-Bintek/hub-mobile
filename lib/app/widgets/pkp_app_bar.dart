import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';

class PkpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PkpAppBar({
    super.key,
    this.title = '',
    this.showNavigation = true,
    this.leading,
    this.leadingColor,
    this.onLeadingPressed,
    this.actions,
    this.backgroundColor,
    this.elevation,
    this.centerTitle = true,
    this.titleTextColor,
    this.height,
    this.leadingSize = 24,
  });

  final String title;
  final bool showNavigation;
  final bool centerTitle;
  final IconData? leading;
  final Color? leadingColor;
  final VoidCallback? onLeadingPressed;
  final List<PkpAppBarAction>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final Color? titleTextColor;
  final double? height;
  final double leadingSize;

  @override
  Widget build(BuildContext context) {
    final Widget effectiveLeading = IconButton(
      icon: Icon(
        leading ?? Icons.chevron_left_rounded,
        size: leadingSize,
        color: leadingColor ?? AppColors.white,
      ),
      onPressed: onLeadingPressed ?? () => Get.back(),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
    );

    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.h3.copyWith(
          color: titleTextColor ?? AppColors.white,
        ),
      ),
      leading: showNavigation ? effectiveLeading : null,
      actions: actions?.map((action) {
        final badgeCount = action.badgeCount ?? 0;
        final badgeText = badgeCount > 99 ? '99+' : badgeCount.toString();
        final baseIcon =
            action.iconWidget ??
            Icon(
              action.icon,
              size: 24,
              color: action.color ?? AppColors.primaryDarkest,
            );

        final iconChild = badgeCount > 0
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  baseIcon,
                  Positioned(
                    top: -4,
                    right: -6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.errorDark,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        badgeText,
                        style: AppTextStyles.bodyXS.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : baseIcon;

        return IconButton(
          icon: iconChild,
          onPressed: action.onPressed,
          tooltip:
              action.tooltip ??
              MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      }).toList(),
      backgroundColor: backgroundColor ?? AppColors.primaryDark,
      elevation: elevation ?? 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: centerTitle,
      iconTheme: const IconThemeData().copyWith(
        color: leadingColor ?? AppColors.white,
      ),
      actionsIconTheme: const IconThemeData().copyWith(
        color: AppColors.primaryDarkest,
      ),
      toolbarHeight: height,
    );
  }

  /// The preferred height of the AppBar.
  /// Defaults to [kToolbarHeight].
  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}

class PkpAppBarAction {
  const PkpAppBarAction({
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.color,
    this.badgeCount,
    this.iconWidget,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? color;
  final int? badgeCount;
  final Widget? iconWidget;
}

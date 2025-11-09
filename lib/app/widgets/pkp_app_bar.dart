import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';

class PkpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PkpAppBar({
    super.key,
    this.title = '',
    this.showNavigation = true,
    this.leading,
    this.onLeadingPressed,
    this.actions,
    this.backgroundColor,
    this.elevation,
  });

  final String title;
  final bool showNavigation;
  final IconData? leading;
  final VoidCallback? onLeadingPressed;
  final List<PkpAppBarAction>? actions;
  final Color? backgroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;
    final Widget effectiveLeading = IconButton(
      icon: Icon(
        leading ?? Icons.chevron_left_rounded,
        size: 24,
        color: AppColors.primaryDarkest,
      ),
      onPressed: onLeadingPressed ?? () => Navigator.of(context).maybePop(),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
    );

    return AppBar(
      title: Text(title, style: appBarTheme.titleTextStyle ?? AppTextStyles.h4),
      leading: showNavigation ? effectiveLeading : null,
      actions: actions
          ?.map(
            (action) => IconButton(
              icon: Icon(
                action.icon,
                size: 24,
                color: action.color ?? AppColors.primaryDarkest,
              ),
              onPressed: action.onPressed,
              tooltip:
                  action.tooltip ??
                  MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          )
          .toList(),
      backgroundColor:
          backgroundColor ?? appBarTheme.backgroundColor ?? AppColors.white,
      elevation: elevation ?? appBarTheme.elevation ?? 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      iconTheme: (appBarTheme.iconTheme ?? const IconThemeData()).copyWith(
        color: AppColors.primaryDarkest,
      ),
      actionsIconTheme: (appBarTheme.actionsIconTheme ?? const IconThemeData())
          .copyWith(color: AppColors.primaryDarkest),
    );
  }

  /// The preferred height of the AppBar.
  /// Defaults to [kToolbarHeight].
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PkpAppBarAction {
  const PkpAppBarAction({
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.color,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? color;
}

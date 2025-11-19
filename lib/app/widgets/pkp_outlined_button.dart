import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';

/// A reusable outlined button aligned with the app's theme and API.
/// Mirrors PkpElevatedButton's interface for consistency.
class PkpOutlinedButton extends StatelessWidget {
  const PkpOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.enabled = true,
    this.size = PkpButtonSize.normal,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool enabled;
  final PkpButtonSize size;

  double get _effectiveHeight => size == PkpButtonSize.small
      ? 24
      : size == PkpButtonSize.medium
      ? 32
      : 52;

  double get _spinnerSize => size == PkpButtonSize.small
      ? 12
      : size == PkpButtonSize.medium
      ? 16
      : 26;

  EdgeInsetsGeometry get _padding => size == PkpButtonSize.small
      ? const EdgeInsets.symmetric(horizontal: 8)
      : const EdgeInsets.symmetric(horizontal: 12);

  @override
  Widget build(BuildContext context) {
    // const primary = AppColors.primaryDarkest;

    return SizedBox(
      height: _effectiveHeight,
      child: OutlinedButton(
        onPressed: (!enabled || isLoading) ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primaryDark),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.primaryDark,
          padding: _padding,
          minimumSize: Size(0, _effectiveHeight),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          disabledBackgroundColor: AppColors.white,
          disabledForegroundColor: AppColors.neutralMedium,
        ),
        child: isLoading
            ? SizedBox(
                height: _spinnerSize,
                width: _spinnerSize,
                child: const CircularProgressIndicator(
                  color: AppColors.primaryDark,
                  strokeWidth: 2.5,
                ),
              )
            : Text(text, style: AppTextStyles.actionM),
      ),
    );
  }
}

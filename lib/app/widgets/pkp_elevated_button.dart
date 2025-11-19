import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';

/// A reusable primary elevated button that automatically uses the app's theme.
/// It handles its own styling and loading state.
class PkpElevatedButton extends StatelessWidget {
  const PkpElevatedButton({
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
    return SizedBox(
      height: _effectiveHeight,
      child: ElevatedButton(
        onPressed: (!enabled || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: _padding,
          minimumSize: Size(0, _effectiveHeight),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          backgroundColor: AppColors.primaryDark,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.inputBorder,
          disabledForegroundColor: AppColors.neutralMedium,
        ),
        child: isLoading
            ? SizedBox(
                height: _spinnerSize,
                width: _spinnerSize,
                child: const CircularProgressIndicator(
                  color: AppColors.krem,
                  strokeWidth: 2.5,
                ),
              )
            : Text(text, style: AppTextStyles.actionM),
      ),
    );
  }
}

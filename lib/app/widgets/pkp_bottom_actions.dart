import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';

class PkpBottomActions extends StatelessWidget {
  const PkpBottomActions({
    super.key,
    required this.primaryText,
    required this.onPrimaryPressed,
    this.secondaryText,
    this.onSecondaryPressed,
    this.primaryEnabled = true,
    this.secondaryEnabled = true,
    this.primaryLoading = false,
    this.secondaryLoading = false,
  });

  final String primaryText;
  final VoidCallback onPrimaryPressed;
  final String? secondaryText;
  final VoidCallback? onSecondaryPressed;
  final bool primaryEnabled;
  final bool secondaryEnabled;
  final bool primaryLoading;
  final bool secondaryLoading;

  bool get _hasSecondary =>
      secondaryText != null &&
      secondaryText!.isNotEmpty &&
      onSecondaryPressed != null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: AppColors.white),
        child: _hasSecondary ? _buildDualButtons() : _buildSingleButton(),
      ),
    );
  }

  Widget _buildDualButtons() {
    return Row(
      children: [
        Expanded(
          child: PkpOutlinedButton(
            text: secondaryText!,
            isLoading: secondaryLoading,
            onPressed: secondaryEnabled ? onSecondaryPressed! : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: PkpElevatedButton(
            text: primaryText,
            onPressed: primaryEnabled ? onPrimaryPressed : null,
            isLoading: primaryLoading,
          ),
        ),
      ],
    );
  }

  Widget _buildSingleButton() {
    return PkpElevatedButton(
      text: primaryText,
      onPressed: primaryEnabled ? onPrimaryPressed : null,
      isLoading: primaryLoading,
    );
  }
}

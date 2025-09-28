import 'package:flutter/material.dart';

// This file will contain common reusable UI widgets used across multiple features.
// Example: A standardized button widget for consistent look and feel.

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final ButtonStyle? style;
  final Widget? icon;

  const CommonButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // Adhering to Material Design 3, consider using ElevatedButton, TextButton, etc.
    // Or create a custom styled button that can be configured.
    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? ElevatedButton.styleFrom(
        // Define default common styles here based on AppTheme
        // e.g., padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 8),
          ],
          Text(text),
        ],
      ),
    );
  }
}

// Other common widgets could be:
// - CommonAppBar
// - CommonTextField
// - LoadingIndicator
// - EmptyStateWidget

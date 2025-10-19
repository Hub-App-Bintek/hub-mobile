import 'package:flutter/material.dart';

/// A reusable primary elevated button that automatically uses the app's theme.
/// It handles its own styling and loading state.
class PkpElevatedButton extends StatelessWidget {
  const PkpElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.enabled = false,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: (!enabled || isLoading) ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimary, // Use onPrimary for contrast
                  strokeWidth: 2.5,
                ),
              )
            : Text(text),
      ),
    );
  }
}

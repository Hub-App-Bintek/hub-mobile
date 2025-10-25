import 'package:flutter/material.dart';

/// A customizable card widget that displays a title, subtitle, and an optional
/// trailing widget which can be an icon or a button.
class PkpCard extends StatelessWidget {
  const PkpCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.suffixIcon,
    this.actionButton,
  })  : assert(
          suffixIcon == null || actionButton == null,
          'Cannot provide both a suffixIcon and an actionButton.',
        ),
        super(key: key);

  /// The primary text to display in the card.
  final String title;

  /// The secondary text to display below the title.
  final String subtitle;

  /// An optional callback that is triggered when the card is tapped.
  final VoidCallback? onTap;

  /// An optional widget to display at the end of the card, typically an icon.
  final Widget? suffixIcon;

  /// An optional button or widget to display at the end of the card as a primary action.
  /// If provided, this will be used instead of [suffixIcon].
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // A light blueish-grey color like in the reference images.
    // This could be part of the app's theme data.
    final cardColor = Theme.of(context).brightness == Brightness.dark
        ? colorScheme.surface
        : const Color(0xFFF0F4F8);

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: cardColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.7),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (actionButton != null || suffixIcon != null)
                const SizedBox(width: 16),
              if (actionButton != null)
                actionButton!
              else if (suffixIcon != null)
                suffixIcon!,
            ],
          ),
        ),
      ),
    );
  }
}

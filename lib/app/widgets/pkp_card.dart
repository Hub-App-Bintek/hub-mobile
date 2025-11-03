import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';

/// A customizable card widget that displays a title, subtitle, and an optional
/// trailing widget which can be an icon or a button. If [fileId] is provided
/// (and both [actionButton] and [suffixIcon] are null), a download button will
/// be shown that calls [onDownload] with the URL or opens it using
/// `url_launcher`.
class PkpCard extends StatelessWidget {
  const PkpCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.suffixIcon,
    this.actionButton,
    this.fileId,
    this.onDownload,
    this.shouldShowDownloadButton = false,
  }) : assert(
         suffixIcon == null || actionButton == null,
         'Cannot provide both a suffixIcon and an actionButton.',
       );

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

  /// Optional file URL. When provided and neither [actionButton] nor [suffixIcon]
  /// are supplied, a download button will be shown.
  final String? fileId;

  /// Optional download callback. If provided, it will be called with [fileId]
  /// when the user taps the download button. If not provided, the card will
  /// attempt to open the URL using `url_launcher`.
  final ValueChanged<String>? onDownload;

  final bool shouldShowDownloadButton;

  @override
  Widget build(BuildContext context) {
    final hasSubtitle = subtitle.trim().isNotEmpty;

    // Determine trailing widget: actionButton > suffixIcon > download button (if fileUrl present)
    Widget? trailing;
    if (actionButton != null) {
      trailing = actionButton;
    } else if (suffixIcon != null) {
      trailing = suffixIcon;
    } else if (fileId != null &&
        fileId?.trim().isNotEmpty == true &&
        shouldShowDownloadButton) {
      trailing = IconButton(
        tooltip: 'Download',
        icon: const Icon(Icons.download_rounded),
        onPressed: () async {
          if (onDownload != null) {
            onDownload!(fileId?.trim() ?? '');
          }
        },
      );
    }

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: AppColors.primaryLightest,
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
                      style: AppTextStyles.bodyL.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (hasSubtitle) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: AppTextStyles.bodyXS.copyWith(
                          color: AppColors.neutralMediumDark,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) const SizedBox(width: 16),
              if (trailing != null) trailing,
            ],
          ),
        ),
      ),
    );
  }
}

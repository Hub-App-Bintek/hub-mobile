import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';

/// Defines the content type for the PkpModalBottomSheetContent.
enum PkpBottomSheetContentType {
  general,
  upload,
  itemList,
}

/// A reusable widget that defines the content for a modal bottom sheet.
/// This widget is intended to be used within `showModalBottomSheet`.
class PkpModalBottomSheetContent extends StatelessWidget {
  final PkpBottomSheetContentType type;

  // Parameters for different types
  final String? message; // For .general
  final List<Widget>? items; // For .itemList

  // Button parameters
  final bool showButton;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const PkpModalBottomSheetContent({
    super.key,
    required this.type,
    this.message,
    this.items,
    this.showButton = false,
    this.buttonText,
    this.onButtonPressed,
  })  : assert(type != PkpBottomSheetContentType.general || message != null,
            'A `message` must be provided when type is `general`.'),
        assert(type != PkpBottomSheetContentType.itemList || items != null,
            'A list of `items` must be provided when type is `itemList`.');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            Flexible(child: _buildBody(context)),
            if (showButton) ...[
              const SizedBox(height: 24),
              PkpElevatedButton(
                text: buttonText ?? '',
                onPressed: onButtonPressed,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.close, color: AppColors.primaryDarkest),
        onPressed: () => Get.back(),
        tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    // Per user request, horizontal padding is removed from all content types.
    switch (type) {
      case PkpBottomSheetContentType.general:
        return _GeneralContent(message: message!);
      case PkpBottomSheetContentType.upload:
        return const _UploadContent();
      case PkpBottomSheetContentType.itemList:
        return _ItemListContent(items: items!);
    }
  }
}

/// Content for the 'general' type.
class _GeneralContent extends StatelessWidget {
  final String message;
  const _GeneralContent({required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }
}

/// Content for the 'upload' type.
class _UploadContent extends StatelessWidget {
  const _UploadContent();

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.neutralLight,
      strokeWidth: 1,
      dashPattern: const [6, 6],
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      child: Container(
        height: 150,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_upload_outlined, color: AppColors.neutralLight, size: 48),
            const SizedBox(height: 8),
            Text(
              'Drag & drop files here or click to browse',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.neutralMedium),
              textAlign: TextAlign.center, // Center the text
            ),
          ],
        ),
      ),
    );
  }
}

/// Content for the 'itemList' type.
class _ItemListContent extends StatelessWidget {
  final List<Widget> items;
  const _ItemListContent({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
      separatorBuilder: (context, index) => const Divider(height: 1, thickness: 1, color: AppColors.neutralLightAlt),
    );
  }
}

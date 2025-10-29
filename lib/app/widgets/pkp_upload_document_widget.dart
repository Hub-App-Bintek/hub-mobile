import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';

/// A reusable upload document section with a title, a "Pilih File" button,
/// an optional selected file name preview, and an optional upload status
/// indicator (success, failed, uploading).
/// It internally invokes file_picker and returns the picked [File] via [onFileSelected].
class PkpUploadDocumentWidget extends StatelessWidget {
  const PkpUploadDocumentWidget({
    super.key,
    required this.title,
    required this.onFileSelected,
    this.selectedFileName,
    this.enabled = true,
    this.isLoading = false,
    this.allowedExtensions = const ['pdf'],
    this.buttonText = 'Pilih File',
    this.uploadStatus = PkpUploadStatus.none,
  });

  final String title;
  final ValueChanged<File> onFileSelected;
  final String? selectedFileName;
  final bool enabled;
  final bool isLoading;
  final List<String> allowedExtensions;
  final String buttonText;
  final PkpUploadStatus uploadStatus;

  Future<void> _pickFile(BuildContext context) async {
    final picked = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (picked != null && picked.files.isNotEmpty) {
      final path = picked.files.single.path;
      if (path != null) {
        onFileSelected(File(path));
      }
    }
  }

  Widget _buildStatusIndicator() {
    switch (uploadStatus) {
      case PkpUploadStatus.success:
        return const Icon(
          Icons.check_circle,
          color: AppColors.successDark,
          size: 24,
        );
      case PkpUploadStatus.failed:
        return const Icon(Icons.cancel, color: AppColors.errorDark, size: 24);
      case PkpUploadStatus.uploading:
        return const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: AppColors.primaryDarkest,
          ),
        );
      case PkpUploadStatus.none:
        return const Icon(
          Icons.radio_button_unchecked,
          color: AppColors.primaryDarkest,
          size: 24,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            // Always show the leading status indicator
            _buildStatusIndicator(),
            const SizedBox(width: 8),
            Expanded(child: Text(title, style: AppTextStyles.bodyM)),
            PkpOutlinedButton(
              text: buttonText,
              enabled: enabled && !isLoading,
              isLoading: isLoading,
              size: PkpButtonSize.small,
              onPressed: () => _pickFile(context),
            ),
          ],
        ),
        if (selectedFileName != null && selectedFileName!.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            selectedFileName!,
            style: AppTextStyles.bodyS.copyWith(color: AppColors.neutralDark),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}

/// Upload status to control the trailing indicator next to the action button.
enum PkpUploadStatus { none, uploading, success, failed }

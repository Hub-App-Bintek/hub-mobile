import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';

class PkpConfirmationDialog extends StatelessWidget {
  const PkpConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.onCancel,
    this.confirmLabel = 'Lanjutkan',
    this.cancelLabel = 'Batal',
  });

  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  static Future<void> show({
    required String title,
    required String message,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    String confirmLabel = 'Lanjutkan',
    String cancelLabel = 'Batal',
    bool barrierDismissible = false,
  }) {
    return Get.dialog(
      PkpConfirmationDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title, style: AppTextStyles.h2),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(message, style: AppTextStyles.bodyM),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: PkpOutlinedButton(
                  text: cancelLabel,
                  size: PkpButtonSize.medium,
                  onPressed: () {
                    Get.back();
                    onCancel?.call();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PkpElevatedButton(
                  text: confirmLabel,
                  size: PkpButtonSize.medium,
                  onPressed: () {
                    Get.back();
                    onConfirm();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

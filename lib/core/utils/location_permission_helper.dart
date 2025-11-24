import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';

class LocationPermissionHelper {
  const LocationPermissionHelper._();

  static Future<bool> ensureLocationPermission() async {
    final status = await Permission.location.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isPermanentlyDenied) {
      await _showSettingsDialog();
      return false;
    }

    final shouldRequest = await _showRequestDialog();
    if (shouldRequest != true) {
      return false;
    }

    final result = await Permission.location.request();
    if (result.isGranted) {
      return true;
    }

    if (result.isPermanentlyDenied) {
      await _showSettingsDialog();
    }

    return false;
  }

  static Future<bool?> _showRequestDialog() {
    return Get.dialog<bool>(
      _PermissionDialog(
        title: AppStrings.locationPermissionTitle,
        message: AppStrings.locationPermissionDescription,
        confirmLabel: AppStrings.allowPermission,
        onConfirm: () => Get.back(result: true),
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> _showSettingsDialog() {
    return Get.dialog<void>(
      _PermissionDialog(
        title: AppStrings.locationPermissionSettingsTitle,
        message: AppStrings.locationPermissionSettingsDescription,
        confirmLabel: AppStrings.openSettings,
        onConfirm: () {
          openAppSettings();
          Get.back();
        },
      ),
      barrierDismissible: false,
    );
  }
}

class _PermissionDialog extends StatelessWidget {
  const _PermissionDialog({
    required this.title,
    required this.message,
    required this.confirmLabel,
    required this.onConfirm,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final VoidCallback onConfirm;

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
                  text: AppStrings.cancel,
                  size: PkpButtonSize.medium,
                  onPressed: () => Get.back(result: false),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PkpElevatedButton(
                  text: confirmLabel,
                  size: PkpButtonSize.medium,
                  onPressed: onConfirm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

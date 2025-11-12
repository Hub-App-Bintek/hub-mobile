import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/kyc/controllers/kyc_controller.dart';

// Convert to GetView to get easy access to the controller
class KycScreen extends GetView<KycController> {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Scaffold(
      appBar: PkpAppBar(
        title: AppStrings.kycScreenTitle,
        onLeadingPressed: () {
          Get.offAllNamed(AppRoutes.main);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PkpTextFormField(
              labelText: AppStrings.kycFullNameLabel,
              hintText: AppStrings.kycFullNameHint,
            ),
            const SizedBox(height: 16),
            const PkpTextFormField(
              labelText: AppStrings.kycPhoneNumberLabel,
              hintText: AppStrings.kycPhoneNumberHint,
              type: PkpTextFormFieldType.text,
            ),
            const SizedBox(height: 16),
            const PkpTextFormField(
              labelText: AppStrings.kycAddressLabel,
              hintText: AppStrings.kycAddressHint,
              type: PkpTextFormFieldType.multiline,
            ),
            const SizedBox(height: 16),
            const PkpTextFormField(
              labelText: AppStrings.kycKtpNumberLabel,
              hintText: AppStrings.kycKtpNumberHint,
              type: PkpTextFormFieldType.text,
            ),
            const SizedBox(height: 24),
            Text(
              AppStrings.kycUploadKtpLabel,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Use Obx to listen for changes to the ktpImage
            Obx(() =>
                _buildUploadWidget(
                  file: controller.ktpImage.value,
                  onTap: () => controller.pickKtpImage(),
                )),
            const SizedBox(height: 24),
            Text(
              AppStrings.kycUploadSelfieKtpLabel,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Use Obx to listen for changes to the selfieKtpImage
            Obx(() =>
                _buildUploadWidget(
                  file: controller.selfieKtpImage.value,
                  onTap: () => controller.pickSelfieKtpImage(),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Call the controller method
              controller.submitKyc();
            },
            child: const Text(AppStrings.continueButton),
          ),
        ),
      ),
    );
  }

  // Refactored upload widget to be reusable
  Widget _buildUploadWidget(
      {required File? file, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        // Display the selected image or a placeholder icon
        child: file != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Image.file(
            file,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        )
            : Icon(Icons.camera_alt, size: 48, color: Colors.grey[400]),
      ),
    );
  }
}
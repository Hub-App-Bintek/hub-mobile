import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_upload_document_widget.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/kyc/controllers/kyc_controller.dart';

// Convert to GetView to get easy access to the controller
class KycScreen extends GetView<KycController> {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PkpUploadDocumentWidget(
                    title: AppStrings.kycUploadKtpLabel,
                    buttonText: 'Pilih Foto',
                    allowedExtensions: const ['jpg', 'jpeg', 'png'],
                    uploadStatus: controller.ktpImage.value != null
                        ? PkpUploadStatus.success
                        : PkpUploadStatus.none,
                    selectedFileName: controller.ktpImage.value?.path
                        .split('/')
                        .last,
                    customPickFile: controller.pickKtpImage,
                    onFileSelected: (file) {
                      controller.ktpImage.value = file;
                    },
                  ),
                  if (controller.ktpImage.value != null) ...[
                    const SizedBox(height: 12),
                    _buildImagePreview(controller.ktpImage.value!),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PkpUploadDocumentWidget(
                    title: AppStrings.kycUploadSelfieKtpLabel,
                    buttonText: 'Pilih Foto',
                    allowedExtensions: const ['jpg', 'jpeg', 'png'],
                    uploadStatus: controller.selfieKtpImage.value != null
                        ? PkpUploadStatus.success
                        : PkpUploadStatus.none,
                    selectedFileName: controller.selfieKtpImage.value?.path
                        .split('/')
                        .last,
                    customPickFile: controller.pickSelfieKtpImage,
                    onFileSelected: (file) {
                      controller.selfieKtpImage.value = file;
                    },
                  ),
                  if (controller.selfieKtpImage.value != null) ...[
                    const SizedBox(height: 12),
                    _buildImagePreview(controller.selfieKtpImage.value!),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: PkpBottomActions(
          primaryText: AppStrings.continueButton,
          onPrimaryPressed: controller.submitKyc,
        ),
      ),
    );
  }

  Widget _buildImagePreview(File file) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Image.file(
          file,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

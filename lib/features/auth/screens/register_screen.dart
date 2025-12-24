import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/auth/controllers/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  Widget _buildImagePreview(String? path) {
    final isImage = path != null && _isImagePath(path);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.inputSurface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.inputBorder, width: 0.8),
          ),
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          child: isImage
              ? Image.file(
                  File(path),
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.insert_photo_outlined,
                      color: AppColors.neutralMediumLight,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Belum ada foto',
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.neutralMediumLight,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  bool _isImagePath(String path) {
    final lower = path.toLowerCase();
    return lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.png') ||
        lower.endsWith('.webp');
  }

  Future<String?> _capturePhoto() async {
    final picker = ImagePicker();
    final photo = await picker.pickImage(source: ImageSource.camera);
    if (photo == null) return null;

    final compressedPath = await _compressImage(photo.path);
    return compressedPath ?? photo.path;
  }

  Future<String?> _compressImage(String sourcePath) async {
    try {
      final directory = await getTemporaryDirectory();
      final targetPath =
          '${directory.path}/register_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final result = await FlutterImageCompress.compressAndGetFile(
        sourcePath,
        targetPath,
        quality: 80,
        minWidth: 1600,
        minHeight: 1600,
        format: CompressFormat.jpeg,
        keepExif: true,
      );
      return result?.path;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: AppStrings.registerPageTitle),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => PkpTextFormField(
                    controller: controller.emailController,
                    labelText: AppStrings.emailAddressLabel,
                    hintText: AppStrings.emailAddressHint,
                    type: PkpTextFormFieldType.email,
                    errorText: controller.emailError.value,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => PkpTextFormField(
                    controller: controller.passwordController,
                    labelText: AppStrings.passwordLabel,
                    hintText: AppStrings.passwordHint,
                    type: PkpTextFormFieldType.password,
                    errorText: controller.passwordError.value,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => PkpTextFormField(
                    controller: controller.confirmPasswordController,
                    labelText: AppStrings.confirmPasswordLabel,
                    hintText: AppStrings.passwordHint,
                    type: PkpTextFormFieldType.password,
                    errorText: controller.confirmPasswordError.value,
                  ),
                ),
                const SizedBox(height: 8),
                PkpTextFormField(
                  controller: controller.institutionTitleController,
                  labelText: 'Title',
                  hintText: 'Pilih Title',
                  type: PkpTextFormFieldType.dropdown,
                  options: const ['BPK', 'IBU'],
                ),
                const SizedBox(height: 8),
                PkpTextFormField(
                  controller: controller.fullNameController,
                  labelText: AppStrings.kycFullNameLabel,
                  hintText: AppStrings.kycFullNameHint,
                ),
                const SizedBox(height: 8),
                PkpTextFormField(
                  controller: controller.phoneNumberController,
                  labelText: AppStrings.kycPhoneNumberLabel,
                  hintText: AppStrings.kycPhoneNumberHint,
                  type: PkpTextFormFieldType.phone,
                  countryCodePrefix: '+62',
                ),
                const SizedBox(height: 8),
                PkpTextFormField(
                  controller: controller.idTypeController,
                  labelText: 'Jenis Tanda Pengenal',
                  hintText: 'Pilih jenis identitas',
                  type: PkpTextFormFieldType.dropdown,
                  options: const ['KTP', 'KITAS'],
                ),
                const SizedBox(height: 8),
                PkpTextFormField(
                  labelText: 'Nomor Identitas',
                  controller: controller.idNumberController,
                  hintText: 'Masukkan nomor identitas',
                ),
                const SizedBox(height: 8),
                PkpTextFormField(
                  controller: controller.idDocumentController,
                  labelText: 'Upload Dokumen Identitas',
                  hintText: 'Ambil foto KTP/KITAS',
                  type: PkpTextFormFieldType.filePicker,
                  filePickerType: PkpFilePickerType.image,
                  allowedFileLabel: '',
                  customPickFile: _capturePhoto,
                  onFilePicked: (path) {
                    controller.idDocumentPath.value = path;
                  },
                ),
                Obx(() => _buildImagePreview(controller.idDocumentPath.value)),
                const SizedBox(height: 8),
                PkpTextFormField(
                  controller: controller.selfieDocumentController,
                  labelText: 'Selfie Dokumen Identitas',
                  hintText: 'Ambil selfie dengan identitas',
                  type: PkpTextFormFieldType.filePicker,
                  filePickerType: PkpFilePickerType.image,
                  allowedFileLabel: '',
                  customPickFile: _capturePhoto,
                  onFilePicked: (path) {
                    controller.selfieDocumentPath.value = path;
                  },
                ),
                Obx(
                  () => _buildImagePreview(controller.selfieDocumentPath.value),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => PkpTextFormField(
                    controller: controller.provinceController,
                    labelText: AppStrings.provinceLabel.replaceAll('*', ''),
                    hintText: AppStrings.provinceHint,
                    type: PkpTextFormFieldType.dropdown,
                    options: controller.provinceOptions,
                    onChanged: controller.onProvinceSelected,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => PkpTextFormField(
                    controller: controller.cityController,
                    labelText: AppStrings.cityLabel.replaceAll('*', ''),
                    hintText: AppStrings.cityHint,
                    type: PkpTextFormFieldType.dropdown,
                    options: controller.cityOptions,
                    onChanged: controller.onCitySelected,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => PkpTextFormField(
                    controller: controller.districtController,
                    labelText: AppStrings.subdistrictLabel.replaceAll('*', ''),
                    hintText: AppStrings.subdistrictHint,
                    type: PkpTextFormFieldType.dropdown,
                    options: controller.districtOptions,
                    onChanged: controller.onDistrictSelected,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => PkpTextFormField(
                    controller: controller.subdistrictController,
                    labelText: AppStrings.villageLabel.replaceAll('*', ''),
                    hintText: AppStrings.villageHint,
                    type: PkpTextFormFieldType.dropdown,
                    options: controller.subdistrictOptions,
                    onChanged: controller.onSubdistrictSelected,
                  ),
                ),
                const SizedBox(height: 8),
                PkpTextFormField(
                  controller: controller.addressController,
                  labelText: AppStrings.kycAddressLabel,
                  hintText: AppStrings.kycAddressHint,
                  type: PkpTextFormFieldType.multiline,
                ),
                const SizedBox(height: 24),
                Obx(
                  () => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: controller.acceptTerms.value,
                          onChanged: controller.toggleTermsAcceptance,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: AppTextStyles.bodyS.copyWith(
                              color: AppColors.neutralDarkest,
                            ),
                            children: <TextSpan>[
                              const TextSpan(text: AppStrings.termsPrefix),
                              TextSpan(
                                text: AppStrings.termsConditions,
                                style: AppTextStyles.bodyS.copyWith(
                                  color: AppColors.primaryDark,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Navigate to Terms and Conditions page
                                  },
                              ),
                              const TextSpan(text: AppStrings.termsAnd),
                              TextSpan(
                                text: AppStrings.privacyPolicy,
                                style: AppTextStyles.bodyS.copyWith(
                                  color: AppColors.primaryDark,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Navigate to Privacy Policy page
                                  },
                              ),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Obx(() {
          final isEnabled =
              controller.isFormValid && !controller.isRequesting.value;
          return PkpBottomActions(
            primaryText: AppStrings.continueButton,
            onPrimaryPressed: () {
              FocusScope.of(context).unfocus();
              controller.register();
            },
            primaryEnabled: isEnabled,
            primaryLoading: controller.isRequesting.value,
          );
        }),
      ),
    );
  }
}

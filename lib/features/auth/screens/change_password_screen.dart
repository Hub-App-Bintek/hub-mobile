import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/auth/controllers/change_password_controller.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(
        title: AppStrings.changePasswordTitle,
        backgroundColor: AppColors.white,
        leadingColor: AppColors.primaryDark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppStrings.changePasswordTitle,
                style: AppTextStyles.h1.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pastikan kata sandi baru berbeda dengan sebelumnya.',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.neutralMedium,
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => PkpTextFormField(
                  controller: controller.currentPasswordController,
                  labelText: AppStrings.currentPasswordLabel,
                  hintText: AppStrings.passwordHint,
                  type: PkpTextFormFieldType.password,
                  errorText: controller.currentPasswordError.value,
                  filled: true,
                  fillColor: AppColors.inputSurface,
                  borderColor: AppColors.inputBorder,
                  borderWidth: 0.8,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => PkpTextFormField(
                  controller: controller.newPasswordController,
                  labelText: AppStrings.newPasswordLabelShort,
                  hintText: AppStrings.newPasswordHint,
                  type: PkpTextFormFieldType.password,
                  errorText: controller.newPasswordError.value,
                  filled: true,
                  fillColor: AppColors.inputSurface,
                  borderColor: AppColors.inputBorder,
                  borderWidth: 0.8,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => PkpTextFormField(
                  controller: controller.confirmPasswordController,
                  labelText: AppStrings.confirmNewPasswordLabelShort,
                  hintText: AppStrings.confirmPasswordLabel,
                  type: PkpTextFormFieldType.password,
                  errorText: controller.confirmPasswordError.value,
                  filled: true,
                  fillColor: AppColors.inputSurface,
                  borderColor: AppColors.inputBorder,
                  borderWidth: 0.8,
                ),
              ),
              const SizedBox(height: 24),
              Obx(() {
                final isEnabled = controller.canSubmit.value;
                return PkpElevatedButton(
                  onPressed: isEnabled ? controller.submit : null,
                  text: AppStrings.changePasswordButton,
                  isLoading: controller.isRequesting.value,
                  enabled: isEnabled,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

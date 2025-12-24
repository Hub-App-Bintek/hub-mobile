import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/auth/controllers/reset_password_controller.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final maskedEmail = controller.email.isNotEmpty
        ? Formatters.maskEmail(controller.email)
        : '';

    return Scaffold(
      appBar: const PkpAppBar(
        title: AppStrings.resetPasswordTitle,
        backgroundColor: AppColors.white,
        leadingColor: AppColors.primaryDark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Text(
                AppStrings.resetPasswordTitle,
                style: AppTextStyles.h1.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
              if (maskedEmail.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  'Email: $maskedEmail',
                  style: AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralMedium.withValues(alpha: 0.8),
                  ),
                ),
              ],
              const SizedBox(height: 32),
              Obx(
                () => PkpTextFormField(
                  controller: controller.newPasswordController,
                  labelText: AppStrings.newPasswordLabel,
                  hintText: AppStrings.newPasswordHint,
                  type: PkpTextFormFieldType.password,
                  errorText: controller.newPasswordError.value,
                  filled: true,
                  fillColor: AppColors.inputSurface,
                  borderColor: AppColors.inputBorder,
                  borderWidth: 0.8,
                  hintStyle: AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralMedium.withValues(alpha: 0.6),
                  ),
                  labelStyle: AppTextStyles.bodyS.copyWith(
                    color: AppColors.neutralDarkest,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => PkpTextFormField(
                  controller: controller.confirmPasswordController,
                  labelText: AppStrings.confirmNewPasswordLabel,
                  hintText: AppStrings.confirmPasswordLabel,
                  type: PkpTextFormFieldType.password,
                  errorText: controller.confirmPasswordError.value,
                  filled: true,
                  fillColor: AppColors.inputSurface,
                  borderColor: AppColors.inputBorder,
                  borderWidth: 0.8,
                  hintStyle: AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralMedium.withValues(alpha: 0.6),
                  ),
                  labelStyle: AppTextStyles.bodyS.copyWith(
                    color: AppColors.neutralDarkest,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Obx(() {
                final isEnabled =
                    controller.isFormValid && !controller.isRequesting.value;
                return PkpElevatedButton(
                  onPressed: isEnabled ? controller.resetPassword : null,
                  text: AppStrings.resetPasswordButton,
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

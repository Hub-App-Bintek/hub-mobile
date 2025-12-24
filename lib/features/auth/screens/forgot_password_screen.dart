import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/auth/controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(
        title: AppStrings.forgotPasswordTitle,
        backgroundColor: AppColors.white,
        leadingColor: AppColors.primaryDark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              Text(
                AppStrings.forgotPasswordTitle,
                textAlign: TextAlign.left,
                style: AppTextStyles.h1.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppStrings.forgotPasswordSubtitle,
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.neutralMedium.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 32),
              Obx(
                () => PkpTextFormField(
                  controller: controller.emailController,
                  labelText: AppStrings.emailAddressLabel,
                  hintText: AppStrings.emailAddressHint,
                  type: PkpTextFormFieldType.email,
                  errorText: controller.emailError.value,
                  filled: true,
                  // fillColor: AppColors.inputSurface,
                  // borderColor: AppColors.inputBorder,
                  // hintStyle: AppTextStyles.bodyM.copyWith(
                  //   color: AppColors.neutralMedium.withValues(alpha: 0.6),
                  // ),
                  // labelStyle: AppTextStyles.bodyS.copyWith(
                  //   color: AppColors.neutralDarkest,
                  //   fontWeight: FontWeight.w400,
                  // ),
                ),
              ),
              const SizedBox(height: 32),
              Obx(() {
                final isEnabled =
                    controller.isFormValid && !controller.isRequesting.value;
                return PkpElevatedButton(
                  onPressed: isEnabled ? controller.sendResetCode : null,
                  text: AppStrings.sendOtpButton,
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

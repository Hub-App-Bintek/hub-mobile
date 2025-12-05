import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/auth/controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(
        leading: Icons.close_rounded,
        backgroundColor: AppColors.white,
        leadingColor: AppColors.primaryDark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 72),
              Text(
                AppStrings.loginPageTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.h1.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
              const SizedBox(height: 40),
              Obx(
                () => PkpTextFormField(
                  controller: controller.emailController,
                  labelText: AppStrings.emailAddressLabel,
                  hintText: AppStrings.emailAddressHint,
                  type: PkpTextFormFieldType.email,
                  errorText: controller.emailError.value,
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
                  controller: controller.passwordController,
                  labelText: AppStrings.passwordLabel,
                  hintText: AppStrings.passwordHint,
                  type: PkpTextFormFieldType.password,
                  errorText: controller.passwordError.value,
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Redirect to forgot password screen
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 32),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    AppStrings.forgotPasswordButton,
                    style: AppTextStyles.bodyS.copyWith(
                      color: AppColors.midnightGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Obx(() {
                final isEnabled =
                    controller.isFormValid && !controller.isRequesting.value;
                return PkpElevatedButton(
                  onPressed: isEnabled ? controller.login : null,
                  text: AppStrings.loginButton,
                  isLoading: controller.isRequesting.value,
                  enabled: controller.isFormValid,
                );
              }),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(color: AppColors.inputBorder, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'atau',
                      style: AppTextStyles.bodyXS.copyWith(
                        color: AppColors.neutralMedium.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: AppColors.inputBorder, thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.notAMemberPrompt,
                    style: AppTextStyles.bodyM.copyWith(
                      color: AppColors.neutralMedium.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      controller.navigateTo(AppRoutes.register);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      minimumSize: const Size(0, 32),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      AppStrings.registerNowButton,
                      style: AppTextStyles.bodyL.copyWith(
                        color: AppColors.midnightGreen,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

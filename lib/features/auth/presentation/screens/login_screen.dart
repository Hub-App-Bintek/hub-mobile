import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/auth/presentation/controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(leading: Icons.close_rounded),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        // Use a LayoutBuilder and SingleChildScrollView to create a scrollable
        // view that also keeps content centered vertically. This robustly
        // prevents pixel overflows when the keyboard appears.
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // The invalid 'spacing' property is removed. Spacing is now
                    // handled by explicit SizedBox widgets for clarity and correctness.
                    children: <Widget>[
                      const Spacer(),
                      Text(
                        AppStrings.loginPageTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h2,
                      ),
                      const SizedBox(height: 48),
                      Obx(
                        () => PkpTextFormField(
                          controller: controller.emailController,
                          labelText: AppStrings.emailAddressLabel,
                          hintText: AppStrings.emailAddressHint,
                          type: PkpTextFormFieldType.email,
                          errorText: controller.emailError.value,
                        ),
                      ),
                      const SizedBox(height: 16), // Explicit spacing
                      Obx(
                        () => PkpTextFormField(
                          controller: controller.passwordController,
                          labelText: AppStrings.passwordLabel,
                          hintText: AppStrings.passwordHint,
                          type: PkpTextFormFieldType.password,
                          errorText: controller.passwordError.value,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            // TODO: Redirect to forgot password screen
                          },
                          child: const Text(AppStrings.forgotPasswordButton),
                        ),
                      ),
                      const SizedBox(height: 16), // Explicit spacing
                      Obx(() {
                        final isEnabled =
                            controller.isFormValid.value &&
                            !controller.isRequesting.value;
                        return PkpElevatedButton(
                          onPressed: isEnabled
                              ? () {
                                  controller.login();
                                }
                              : null,
                          text: AppStrings.loginButton,
                          isLoading: controller.isRequesting.value,
                          enabled: controller.isFormValid.value,
                        );
                      }),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppStrings.notAMemberPrompt),
                          TextButton(
                            onPressed: () {
                              controller.navigateTo(AppRoutes.register);
                            },
                            child: const Text(AppStrings.registerNowButton),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/auth/controllers/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: AppStrings.registerPageTitle),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // FIX: Apply the same scrollable and responsive layout from LoginScreen
          // to prevent keyboard overflow issues.
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        // FIX: The invalid 'spacing' property is removed. Spacing is now
                        // handled by explicit SizedBox widgets for clarity and correctness.
                        children: [
                          // TODO: This screen is missing fullName, phone, and KTP fields.
                          // They should be added here.
                          Obx(
                            () => PkpTextFormField(
                              controller: controller.emailController,
                              labelText: AppStrings.emailAddressLabel,
                              hintText: AppStrings.emailAddressHint,
                              type: PkpTextFormFieldType.email,
                              errorText: controller.emailError.value,
                            ),
                          ),
                          const SizedBox(height: 16), // FIX: Use SizedBox for spacing
                          Obx(
                            () => PkpTextFormField(
                              controller: controller.passwordController,
                              labelText: AppStrings.passwordLabel,
                              hintText: AppStrings.passwordHint,
                              type: PkpTextFormFieldType.password,
                              errorText: controller.passwordError.value,
                            ),
                          ),
                          const SizedBox(height: 16), // FIX: Use SizedBox for spacing
                          Obx(
                            () => PkpTextFormField(
                              controller: controller.confirmPasswordController,
                              labelText: AppStrings.confirmPasswordLabel,
                              hintText: AppStrings.passwordHint,
                              type: PkpTextFormFieldType.password,
                              errorText: controller.confirmPasswordError.value,
                            ),
                          ),
                          const SizedBox(height: 24), // Use a slightly larger gap before terms
                          Obx(
                            () => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // The Checkbox needs to be sized to avoid layout issues
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
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      // Add gesture recognizers to make the links tappable
                                      children: <TextSpan>[
                                        const TextSpan(text: AppStrings.termsPrefix),
                                        TextSpan(
                                          text: AppStrings.termsConditions,
                                          style: const TextStyle(
                                            color: Colors.blue,
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
                                          style: const TextStyle(
                                            color: Colors.blue,
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
                          const Spacer(),
                          Obx(
                            () => PkpElevatedButton(
                              onPressed: () {
                                // Hide the keyboard before starting the API call for better UX.
                                FocusScope.of(context).unfocus();
                                controller.register();
                              },
                              text: AppStrings.continueButton,
                              isLoading: controller.isRequesting.value,
                              enabled: controller.isFormValid,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/auth/controllers/verify_otp_controller.dart';

class VerifyOtpScreen extends GetView<VerifyOtpController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: AppStrings.otpConfirmPageTitle),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
              Column(
                children: [
                  Text(
                    AppStrings.enterConfirmationCode,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.codeSentTo.replaceFirst(
                      '{email}',
                      Formatters.maskEmail(controller.email),
                    ),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.otpLength, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: TextField(
                            controller: controller.otpControllers[index],
                            focusNode: controller.otpFocusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1),
                            ],
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onChanged: (value) => controller.onOtpFieldChanged(
                              value,
                              index,
                              context,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  Obx(
                    () => TextButton(
                      onPressed:
                          controller.isResendEnabled.value &&
                              !controller.isResending.value
                          ? controller.resendOtp
                          : null,
                      child: Text(
                        controller.isResending.value
                            ? 'Resending...'
                            : controller.isResendEnabled.value
                            ? AppStrings.resendCode
                            : '${AppStrings.resendCode} (${Formatters.formatTimer(controller.secondsRemaining.value)})',
                        style: TextStyle(
                          color:
                              controller.isResendEnabled.value &&
                                  !controller.isResending.value
                              ? AppColors.primaryDarkest
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Obx(() {
                final bool isEnabled =
                    controller.isCodeComplete.value &&
                    !controller.isRequesting.value &&
                    !controller.isResending.value;
                return PkpElevatedButton(
                  onPressed: isEnabled ? controller.verifyOtp : null,
                  text: AppStrings.continueButton,
                  enabled: isEnabled,
                  isLoading: controller.isRequesting.value,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

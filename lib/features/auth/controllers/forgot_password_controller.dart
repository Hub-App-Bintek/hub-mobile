import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/utils/form_validators.dart';
import 'package:pkp_hub/data/models/request/forgot_password_request.dart';
import 'package:pkp_hub/domain/usecases/auth/forgot_password_use_case.dart';

class ForgotPasswordController extends BaseController {
  ForgotPasswordController(this._forgotPasswordUseCase);

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  final emailController = TextEditingController();
  final emailError = RxnString();
  final emailText = ''.obs;
  final isRequesting = false.obs;

  bool get isFormValid =>
      emailError.value == null && emailText.value.trim().isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(_onEmailChanged);
  }

  void _onEmailChanged() {
    emailText.value = emailController.text;
    emailError.value = null;
  }

  Future<void> sendResetCode() async {
    final email = emailController.text.trim();
    emailError.value = FormValidators.email(email);
    if (emailError.value != null || isRequesting.value) return;

    isRequesting.value = true;
    try {
      await handleAsync(
        () => _forgotPasswordUseCase(ForgotPasswordRequest(email: email)),
        onSuccess: (_) {
          navigateTo(
            AppRoutes.verifyOtp,
            arguments: VerifyOtpArgs(
              email: email,
              flow: VerifyOtpFlow.forgotPassword,
              otpLength: 4,
            ),
          );
        },
        onFailure: showError,
      );
    } finally {
      isRequesting.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}

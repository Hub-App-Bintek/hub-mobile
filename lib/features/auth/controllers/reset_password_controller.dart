import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/utils/form_validators.dart';
import 'package:pkp_hub/data/models/request/reset_password_request.dart';
import 'package:pkp_hub/domain/usecases/auth/reset_password_use_case.dart';

class ResetPasswordController extends BaseController {
  ResetPasswordController(this._resetPasswordUseCase);

  final ResetPasswordUseCase _resetPasswordUseCase;

  late final String resetToken;
  late final String email;

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final newPasswordError = RxnString();
  final confirmPasswordError = RxnString();
  final newPasswordText = ''.obs;
  final confirmPasswordText = ''.obs;
  final isRequesting = false.obs;

  bool get isFormValid =>
      newPasswordError.value == null &&
      confirmPasswordError.value == null &&
      newPasswordText.value.isNotEmpty &&
      confirmPasswordText.value.isNotEmpty &&
      newPasswordText.value == confirmPasswordText.value;

  @override
  void onInit() {
    super.onInit();
    _resolveArgs();
    newPasswordController.addListener(_clearErrors);
    confirmPasswordController.addListener(_clearErrors);
  }

  void _resolveArgs() {
    final args = Get.arguments;
    if (args is ResetPasswordArgs) {
      resetToken = args.resetToken;
      email = args.email;
      return;
    }
    resetToken = '';
    email = '';
  }

  void _clearErrors() {
    newPasswordText.value = newPasswordController.text;
    confirmPasswordText.value = confirmPasswordController.text;
    newPasswordError.value = null;
    confirmPasswordError.value = null;

    if (newPasswordText.value.isNotEmpty &&
        confirmPasswordText.value.isNotEmpty &&
        newPasswordText.value != confirmPasswordText.value) {
      confirmPasswordError.value = AppStrings.passwordsDoNotMatch;
    }
  }

  Future<void> resetPassword() async {
    if (isRequesting.value) return;

    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    newPasswordError.value = FormValidators.password(newPassword);
    confirmPasswordError.value = FormValidators.confirmPassword(
      confirmPassword,
      newPassword,
    );

    if (newPasswordError.value != null || confirmPasswordError.value != null) {
      return;
    }
    if (newPassword != confirmPassword) {
      confirmPasswordError.value = AppStrings.passwordsDoNotMatch;
      return;
    }
    if (resetToken.isEmpty) {
      showError(const ServerFailure(message: 'Token reset tidak tersedia.'));
      return;
    }

    isRequesting.value = true;
    try {
      await handleAsync(
        () => _resetPasswordUseCase(
          ResetPasswordRequest(
            resetToken: resetToken,
            newPassword: newPassword,
            confirmPassword: confirmPassword,
          ),
        ),
        onSuccess: (_) {
          Get.snackbar(
            AppStrings.resetPasswordTitle,
            AppStrings.resetPasswordSuccess,
          );
          navigateOffAll(AppRoutes.login);
        },
        onFailure: showError,
      );
    } finally {
      isRequesting.value = false;
    }
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

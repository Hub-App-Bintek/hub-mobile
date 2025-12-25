import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/utils/form_validators.dart';
import 'package:pkp_hub/data/models/request/change_password_request.dart';
import 'package:pkp_hub/domain/usecases/auth/change_password_use_case.dart';

class ChangePasswordController extends BaseController {
  ChangePasswordController(this._changePasswordUseCase);

  final ChangePasswordUseCase _changePasswordUseCase;

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final currentPasswordError = RxnString();
  final newPasswordError = RxnString();
  final confirmPasswordError = RxnString();
  final isRequesting = false.obs;
  final canSubmit = false.obs;
  bool _isDisposing = false;

  bool get isFormValid =>
      currentPasswordError.value == null &&
      newPasswordError.value == null &&
      confirmPasswordError.value == null &&
      currentPasswordController.text.isNotEmpty &&
      newPasswordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty &&
      newPasswordController.text == confirmPasswordController.text;

  @override
  void onInit() {
    super.onInit();
    currentPasswordController.addListener(_clearErrors);
    newPasswordController.addListener(_clearErrors);
    confirmPasswordController.addListener(_clearErrors);
    _updateCanSubmit();
  }

  void _clearErrors() {
    if (_isDisposing || isClosed) return;
    currentPasswordError.value = null;
    newPasswordError.value = null;
    confirmPasswordError.value = null;

    if (newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        newPasswordController.text != confirmPasswordController.text) {
      confirmPasswordError.value = AppStrings.passwordsDoNotMatch;
    }

    _updateCanSubmit();
  }

  void _updateCanSubmit() {
    canSubmit.value = isFormValid && !isRequesting.value;
  }

  Future<void> submit() async {
    if (isRequesting.value) return;

    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    currentPasswordError.value = FormValidators.password(currentPassword);
    newPasswordError.value = FormValidators.password(newPassword);
    confirmPasswordError.value = FormValidators.confirmPassword(
      confirmPassword,
      newPassword,
    );
    _updateCanSubmit();

    if (currentPasswordError.value != null ||
        newPasswordError.value != null ||
        confirmPasswordError.value != null) {
      return;
    }
    if (newPassword != confirmPassword) {
      confirmPasswordError.value = AppStrings.passwordsDoNotMatch;
      return;
    }

    isRequesting.value = true;
    _updateCanSubmit();
    try {
      await handleAsync(
        () => _changePasswordUseCase(
          ChangePasswordRequest(
            currentPassword: currentPassword,
            newPassword: newPassword,
            confirmNewPassword: confirmPassword,
          ),
        ),
        onSuccess: (_) {
          goBack();
          Get.snackbar(
            AppStrings.changePasswordTitle,
            AppStrings.changePasswordSuccess,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
        },
        onFailure: showError,
      );
    } finally {
      isRequesting.value = false;
      _updateCanSubmit();
    }
  }

  @override
  void onClose() {
    _isDisposing = true;
    currentPasswordController.removeListener(_clearErrors);
    newPasswordController.removeListener(_clearErrors);
    confirmPasswordController.removeListener(_clearErrors);
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

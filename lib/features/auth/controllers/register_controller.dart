import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/utils/form_validators.dart';
import 'package:pkp_hub/data/models/request/register_request.dart';
import 'package:pkp_hub/domain/usecases/auth/register_use_case.dart';

class RegisterController extends BaseController {
  final RegisterUseCase _registerUseCase;

  RegisterController(this._registerUseCase);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool isRequesting = false.obs;
  final RxBool isEmailValid = false.obs;
  final RxBool isPasswordValid = false.obs;
  final RxBool isConfirmPasswordValid = false.obs;
  final RxBool acceptTerms = false.obs;

  final RxnString emailError = RxnString();
  final RxnString passwordError = RxnString();
  final RxnString confirmPasswordError = RxnString();

  final RxBool _isFormValid = false.obs;

  bool get isFormValid => _isFormValid.value;

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(_validateEmail);
    passwordController.addListener(_validatePassword);
    confirmPasswordController.addListener(_validateConfirmPassword);
    acceptTerms.listen((_) => _updateFormValidity());
  }

  void _validateEmail() {
    final email = emailController.text.trim();
    final err = FormValidators.email(email);
    emailError.value = err;
    isEmailValid.value = err == null;
    _updateFormValidity();
  }

  void _validatePassword() {
    final password = passwordController.text;
    final err = FormValidators.password(password);
    passwordError.value = err;
    isPasswordValid.value = err == null;

    if (confirmPasswordController.text.isNotEmpty) {
      _validateConfirmPassword();
    }
    _updateFormValidity();
  }

  void _validateConfirmPassword() {
    final confirmPassword = confirmPasswordController.text;
    final password = passwordController.text;
    final err = FormValidators.confirmPassword(confirmPassword, password);
    confirmPasswordError.value = err;
    isConfirmPasswordValid.value = err == null;
    _updateFormValidity();
  }

  void _updateFormValidity() {
    _isFormValid.value = isEmailValid.value &&
        isPasswordValid.value &&
        isConfirmPasswordValid.value &&
        acceptTerms.value;
  }

  void toggleTermsAcceptance(bool? value) {
    acceptTerms.value = value ?? false;
  }

  Future<void> register() async {
    if (!isFormValid) {
      _validateEmail();
      _validatePassword();
      _validateConfirmPassword();
      return;
    }

    isRequesting.value = true;
    try {
      await handleAsync(
        () => _registerUseCase(
          RegisterRequest(
            email: emailController.text.trim(),
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text,
          ),
        ),
        onSuccess: (registerResponse) async {
          navigateTo(
            AppRoutes.verifyOtp,
            arguments: registerResponse.email,
          );
        },
        onFailure: (Failure failure) {
          // For registration, we currently show all errors.
          // If a specific error code (e.g., EMAIL_ALREADY_EXISTS) needs custom 
          // handling, a switch statement can be added here, just like in LoginController.
          showError(failure);
        },
      );
    } finally {
      isRequesting.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

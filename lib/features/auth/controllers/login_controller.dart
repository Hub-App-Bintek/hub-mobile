import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/storage/auth_local_storage.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/utils/form_validators.dart';
import 'package:pkp_hub/data/models/request/login_request.dart';
import 'package:pkp_hub/domain/usecases/auth/login_use_case.dart';

class LoginController extends BaseController {
  // Dependencies
  final LoginUseCase _loginUseCase;
  final AuthStorage _authLocalStorage;

  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable form state
  final isFormValid = false.obs;
  final emailError = RxnString();
  final passwordError = RxnString();

  // Observable request state
  final isRequesting = false.obs;

  // Constructor
  LoginController({
    required LoginUseCase loginUseCase,
    required AuthStorage authLocalStorage,
  }) : _loginUseCase = loginUseCase,
       _authLocalStorage = authLocalStorage;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
    _validateForm(runValidators: false);
  }

  void _onEmailChanged() {
    emailError.value = FormValidators.email(emailController.text.trim());
    _validateForm(runValidators: false);
  }

  void _onPasswordChanged() {
    passwordError.value = FormValidators.password(passwordController.text);
    _validateForm(runValidators: false);
  }

  void _validateForm({bool runValidators = true}) {
    if (runValidators) {
      emailError.value = FormValidators.email(emailController.text.trim());
      passwordError.value = FormValidators.password(passwordController.text);
    }
    isFormValid.value =
        emailError.value == null &&
        passwordError.value == null &&
        emailController.text.trim().isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  /// Executes the login flow using the new callback-based handleAsync pattern.
  Future<void> login() async {
    _validateForm();
    if (!isFormValid.value || isRequesting.value) return;

    isRequesting.value = true;
    try {
      await handleAsync(
        () => _loginUseCase(
          LoginRequest(
            email: emailController.text.trim(),
            password: passwordController.text,
          ),
        ),
        onSuccess: (loginResponse) async {
          await _authLocalStorage.saveToken(loginResponse.token);
          navigateOffAll(AppRoutes.main);
        },
        onFailure: (failure) {
          // You now have full control over the failure logic.
          switch (failure) {
            case ApiFailure(error: final apiError):
              if (apiError.errorCode == 'USER_UNVERIFIED') {
                // Specific case: Navigate and do NOT show a snackbar.
                navigateTo(
                  AppRoutes.verifyOtp,
                  arguments: emailController.text.trim(),
                );
              } else {
                // Any other API error: Show the default snackbar.
                showError(failure);
              }
              break;
            default:
              // For NetworkFailure, ServerFailure, etc.
              // Show the default snackbar.
              showError(failure);
              break;
          }
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
    super.onClose();
  }
}

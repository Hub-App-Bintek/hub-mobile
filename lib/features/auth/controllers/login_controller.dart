import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/services/notification_service.dart';
import 'package:pkp_hub/data/models/request/login_request.dart';
import 'package:pkp_hub/domain/usecases/auth/login_use_case.dart';

class LoginController extends BaseController {
  // Constructor
  LoginController(this._loginUseCase, this._notificationService);

  // Dependencies
  final LoginUseCase _loginUseCase;
  final NotificationService _notificationService;

  Map<String, dynamic>? _navigationArgs;

  bool get _shouldReturnToCaller {
    final route = _navigationArgs?['fromRoute'];
    return route is String && route.isNotEmpty;
  }

  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxString emailText = ''.obs;
  final RxString passwordText = ''.obs;

  // Observable form state
  bool get isFormValid =>
      emailText.value.isNotEmpty && passwordText.value.isNotEmpty;

  final emailError = RxnString();
  final passwordError = RxnString();

  // Observable request state
  final isRequesting = false.obs;

  @override
  void onInit() {
    super.onInit();
    _navigationArgs = _resolveNavigationArgs();
    emailController.addListener(() {
      emailText.value = emailController.text;
    });
    passwordController.addListener(() {
      passwordText.value = passwordController.text;
    });
    // _validateForm(runValidators: false);
  }

  Map<String, dynamic>? _resolveNavigationArgs() {
    final args = Get.arguments;
    if (args is LoginArgs) {
      return {
        'fromRoute': args.fromRoute,
        'returnArguments': args.returnArguments,
      };
    }
    if (args is Map<String, dynamic>) {
      return args;
    }
    return null;
  }

  // void _onEmailChanged() {
  //   emailError.value = FormValidators.email(emailController.text.trim());
  //   _validateForm(runValidators: false);
  // }
  //
  // void _onPasswordChanged() {
  //   passwordError.value = FormValidators.password(passwordController.text);
  //   _validateForm(runValidators: false);
  // }
  //
  // void _validateForm({bool runValidators = true}) {
  //   if (runValidators) {
  //     emailError.value = FormValidators.email(emailController.text.trim());
  //     passwordError.value = FormValidators.password(passwordController.text);
  //   }
  //   isFormValid.value =
  //       emailError.value == null &&
  //       passwordError.value == null &&
  //       emailController.text.trim().isNotEmpty &&
  //       passwordController.text.isNotEmpty;
  // }

  /// Executes the login flow using the new callback-based handleAsync pattern.
  Future<void> login() async {
    // _validateForm();
    if (!isFormValid || isRequesting.value) return;

    isRequesting.value = true;
    final fcmToken = await _notificationService.getFcmToken();
    try {
      await handleAsync(
        () => _loginUseCase(
          LoginRequest(
            email: emailController.text.trim(),
            password: passwordController.text,
            deviceToken: fcmToken ?? '',
          ),
        ),
        onSuccess: (loginResponse) async {
          _handlePostLoginNavigation();
        },
        onFailure: (failure) {
          // You now have full control over the failure logic.
          switch (failure) {
            case ApiFailure(error: final apiError):
              if (apiError.errorCode == 'ACCOUNT_INACTIVE') {
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

  void _handlePostLoginNavigation() {
    if (_shouldReturnToCaller) {
      goBack(result: true);
      return;
    }

    // final notificationService = Get.find<NotificationService>();
    // notificationService.getFcmToken().then((token) {
    //   _logger.d('FCM Token: $token');
    // });

    navigateOffAll(AppRoutes.main);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

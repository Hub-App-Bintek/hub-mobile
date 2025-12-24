import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/request/forgot_password_request.dart';
import 'package:pkp_hub/data/models/request/register_device_token_request.dart';
import 'package:pkp_hub/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/data/models/request/verify_forgot_password_otp_request.dart';
import 'package:pkp_hub/domain/usecases/auth/register_device_token_use_case.dart';
import 'package:pkp_hub/domain/usecases/auth/resend_otp_use_case.dart';
import 'package:pkp_hub/domain/usecases/auth/forgot_password_use_case.dart';
import 'package:pkp_hub/domain/usecases/auth/verify_otp_use_case.dart';
import 'package:pkp_hub/domain/usecases/auth/verify_forgot_password_otp_use_case.dart';
import 'package:pkp_hub/core/services/notification_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VerifyOtpController extends BaseController {
  final VerifyOtpUseCase _verifyOtpUseCase;
  final VerifyForgotPasswordOtpUseCase _verifyForgotPasswordOtpUseCase;
  final ResendOtpUseCase _resendOtpUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final RegisterDeviceTokenUseCase _registerDeviceTokenUseCase;
  final NotificationService _notificationService;

  late final String email;
  late final VerifyOtpFlow flow;
  late final int otpLength;

  // --- UI State ---
  final isRequesting = false.obs;
  final isResending = false.obs;
  final secondsRemaining = 120.obs;
  final isResendEnabled = false.obs;
  final isCodeComplete = false.obs; // Observable for form validity

  // --- OTP Field UI Management ---
  final List<TextEditingController> otpControllers = [];
  final List<FocusNode> otpFocusNodes = [];

  // --- Private State ---
  Timer? _timer;

  VerifyOtpController({
    required VerifyOtpUseCase verifyOtpUseCase,
    required VerifyForgotPasswordOtpUseCase verifyForgotPasswordOtpUseCase,
    required ResendOtpUseCase resendOtpUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required RegisterDeviceTokenUseCase registerDeviceTokenUseCase,
    required NotificationService notificationService,
  }) : _verifyOtpUseCase = verifyOtpUseCase,
       _verifyForgotPasswordOtpUseCase = verifyForgotPasswordOtpUseCase,
       _resendOtpUseCase = resendOtpUseCase,
       _forgotPasswordUseCase = forgotPasswordUseCase,
       _registerDeviceTokenUseCase = registerDeviceTokenUseCase,
       _notificationService = notificationService;

  bool get isForgotFlow => flow == VerifyOtpFlow.forgotPassword;

  @override
  void onInit() {
    super.onInit();
    flow = _resolveFlowFromArgs();
    otpLength = _resolveOtpLengthFromArgs();
    email = _resolveEmailFromArgs();
    for (var i = 0; i < otpLength; i++) {
      otpControllers.add(TextEditingController());
      otpFocusNodes.add(FocusNode());
    }
    _startTimer();
  }

  String _resolveEmailFromArgs() {
    final args = Get.arguments;
    if (args is VerifyOtpArgs) {
      return args.email;
    }
    if (args is String) {
      return args;
    }
    return '';
  }

  VerifyOtpFlow _resolveFlowFromArgs() {
    final args = Get.arguments;
    if (args is VerifyOtpArgs) {
      return args.flow;
    }
    return VerifyOtpFlow.accountVerification;
  }

  int _resolveOtpLengthFromArgs() {
    final args = Get.arguments;
    if (args is VerifyOtpArgs && args.otpLength != null) {
      return args.otpLength!;
    }
    return 4;
  }

  /// Returns the completed OTP string.
  String get otpString => otpControllers.map((c) => c.text).join();

  /// Handles logic for text changes and focus management in the OTP fields.
  void onOtpFieldChanged(String value, int index, BuildContext context) {
    final filtered = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (filtered != value) {
      otpControllers[index].text = filtered;
      otpControllers[index].selection = TextSelection.collapsed(
        offset: otpControllers[index].text.length,
      );
    }

    if (filtered.isNotEmpty) {
      if (index + 1 < otpLength) {
        FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
      } else {
        otpFocusNodes[index].unfocus();
      }
    }

    // Update the observable state
    isCodeComplete.value = otpString.length == otpLength;
  }

  void _startTimer() {
    isResendEnabled.value = false;
    secondsRemaining.value = 120;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value <= 0) {
        _timer?.cancel();
        isResendEnabled.value = true;
      } else {
        secondsRemaining.value--;
      }
    });
  }

  Future<void> verifyOtp() async {
    if (!isCodeComplete.value) return;
    isRequesting.value = true;
    try {
      if (isForgotFlow) {
        await handleAsync(
          () => _verifyForgotPasswordOtpUseCase(
            VerifyForgotPasswordOtpRequest(email: email, otpCode: otpString),
          ),
          onSuccess: (response) {
            navigateAndClearUntil(
              AppRoutes.resetPassword,
              untilRoute: AppRoutes.login,
              arguments: ResetPasswordArgs(
                resetToken: response.resetToken ?? '',
                email: email,
              ),
            );
          },
          onFailure: showError,
        );
        return;
      }
      await handleAsync(
        () => _verifyOtpUseCase(
          VerifyOtpRequest(email: email, otpCode: otpString),
        ),
        onSuccess: (loginResponse) async {
          await _registerDeviceToken();
          navigateOffAll(AppRoutes.main);
        },
        onFailure: (Failure failure) {
          showError(failure);
        },
      );
    } finally {
      isRequesting.value = false;
    }
  }

  Future<void> resendOtp() async {
    isResending.value = true;
    try {
      if (isForgotFlow) {
        await handleAsync(
          () => _forgotPasswordUseCase(ForgotPasswordRequest(email: email)),
          onSuccess: (_) {
            Get.snackbar(
              'Kode terkirim',
              'OTP baru telah dikirim ke email Anda.',
            );
            _startTimer();
          },
          onFailure: showError,
        );
        return;
      }
      await handleAsync(
        () => _resendOtpUseCase(email),
        onSuccess: (_) {
          Get.snackbar(
            'Kode terkirim',
            'OTP baru telah dikirim ke email Anda.',
          );
          _startTimer();
        },
        onFailure: showError,
      );
    } finally {
      isResending.value = false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in otpFocusNodes) {
      f.dispose();
    }
    super.onClose();
  }

  Future<void> _registerDeviceToken() async {
    final token = await _notificationService.getFcmToken();
    if (token == null || token.isEmpty) return;
    final packageInfo = await PackageInfo.fromPlatform();
    final request = RegisterDeviceTokenRequest(
      deviceToken: token,
      deviceType: Platform.isIOS ? 'IOS' : 'ANDROID',
      deviceModel: Platform.operatingSystemVersion,
      appVersion: '${packageInfo.version}+${packageInfo.buildNumber}',
    );
    await handleAsync(
      () => _registerDeviceTokenUseCase(request),
      onSuccess: (_) {},
      onFailure: (_) {},
    );
  }
}

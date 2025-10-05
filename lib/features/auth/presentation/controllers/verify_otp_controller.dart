import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/core/auth/auth_session.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/features/auth/data/models/request/verify_otp_request.dart';
import 'package:pkp_hub/features/auth/domain/usecases/resend_otp_use_case.dart';
import 'package:pkp_hub/features/auth/domain/usecases/verify_otp_use_case.dart';

class VerifyOtpController extends BaseController {
  final VerifyOtpUseCase _verifyOtpUseCase;
  final ResendOtpUseCase _resendOtpUseCase;
  final AuthSession _authSession;

  final String email;

  // --- UI State ---
  final isRequesting = false.obs;
  final isResending = false.obs;
  final secondsRemaining = 120.obs;
  final isResendEnabled = false.obs;
  final isCodeComplete = false.obs; // Observable for form validity

  // --- OTP Field UI Management ---
  final int otpLength = 4;
  final List<TextEditingController> otpControllers = [];
  final List<FocusNode> otpFocusNodes = [];

  // --- Private State ---
  Timer? _timer;

  VerifyOtpController({
    required this.email,
    required VerifyOtpUseCase verifyOtpUseCase,
    required ResendOtpUseCase resendOtpUseCase,
    required AuthSession authSession,
  }) : _verifyOtpUseCase = verifyOtpUseCase,
       _resendOtpUseCase = resendOtpUseCase,
       _authSession = authSession;

  @override
  void onInit() {
    super.onInit();
    for (var i = 0; i < otpLength; i++) {
      otpControllers.add(TextEditingController());
      otpFocusNodes.add(FocusNode());
    }
    _startTimer();
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
      await handleAsync(
        () => _verifyOtpUseCase(VerifyOtpRequest(email: email, otp: otpString)),
        onSuccess: (loginResponse) async {
          await _authSession.saveToken(loginResponse.token ?? '');
          // TODO: Redirect to update profile screen and remove the stack except for the main screen
          // navigateOffAll(AppRoutes.main);
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
      // TODO: Activate if already deployed
      // await handleAsync(
      //   () => _resendOtpUseCase(email),
      //   onSuccess: (_) {
      //     Get.snackbar('Code Resent', 'A new OTP has been sent to your email.');
      //     _startTimer();
      //   },
      //   onFailure: (Failure failure) {
      //     showError(failure);
      //   },
      // );
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
}

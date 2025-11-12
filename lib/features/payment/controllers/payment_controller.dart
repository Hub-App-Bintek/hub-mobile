import 'dart:async';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

// Enum to manage payment methods
enum PaymentMethod { qris, debit, credit, va }

class PaymentController extends BaseController {
  // State for the payment amount, injected from arguments
  final amount = 0.0.obs;

  // State for the selected payment method, defaults to QRIS
  final selectedMethod = PaymentMethod.qris.obs;

  // State for the countdown timer on the QR page
  final remainingTime = 180.obs; // 3 minutes in seconds
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the amount from the page arguments
    amount.value = Get.arguments['amount'] ?? 0.0;
  }

  @override
  void onClose() {
    _timer
        ?.cancel(); // Ensure the timer is cancelled when the controller is disposed
    super.onClose();
  }

  /// Updates the selected payment method
  void selectPaymentMethod(PaymentMethod method) {
    selectedMethod.value = method;
  }

  /// Navigates to the QR payment screen and starts the countdown
  void proceedToQrPayment() {
    // For now, we only handle QRIS as requested
    if (selectedMethod.value == PaymentMethod.qris) {
      Get.toNamed(AppRoutes.paymentQr);
      startTimer();
    } else {
      // Show a snackbar for unimplemented methods
      Get.snackbar(
        'Not Implemented',
        'This payment method is not available yet.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Starts the 3-minute countdown timer
  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    remainingTime.value = 180; // Reset to 3 minutes
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer.cancel();
        // Optionally handle timeout (e.g., show a dialog or navigate back)
        Get.back();
        Get.snackbar('Time Out', 'Payment time has expired.');
      }
    });
  }

  void completePayment() {
    _timer?.cancel();

    Get.toNamed(AppRoutes.paymentReceipt);
  }

  /// Formats remaining time into MM:SS format
  String get formattedTime {
    final minutes = (remainingTime.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingTime.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

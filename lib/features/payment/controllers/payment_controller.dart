import 'dart:async';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

// Enum to manage payment methods
enum PaymentMethod { qris, debit, credit, va, none }

class PaymentController extends BaseController {
  // State for the payment amount, injected from arguments
  final amount = 0.0.obs;
  final paymentMethod = ''.obs;

  // State for the selected payment method, defaults to QRIS
  final selectedMethod = PaymentMethod.qris.obs;
  final selectedBank = RxnString();

  // State for the countdown timer on the QR page
  final remainingTime = 180.obs; // 3 minutes in seconds
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the amount from the page arguments
    final args = Get.arguments;
    if (args is PaymentArgs) {
      amount.value = args.amount;
      paymentMethod.value = args.method ?? 'QRIS';
    } else if (args is Map<String, dynamic>) {
      amount.value = (args['amount'] as num?)?.toDouble() ?? 0.0;
      paymentMethod.value = args['method'] as String? ?? 'QRIS';
    }
  }

  @override
  void onClose() {
    _timer
        ?.cancel(); // Ensure the timer is cancelled when the controller is disposed
    super.onClose();
  }

  /// Updates the selected payment method
  void selectPaymentMethod(PaymentMethod method) {
    if (selectedMethod.value == method) {
      selectedMethod.value = PaymentMethod.none;
    } else {
      selectedMethod.value = method;
      if (method != PaymentMethod.debit && method != PaymentMethod.va) {
        selectedBank.value = null;
      }
    }
  }

  /// Navigates to the selected payment flow and starts the countdown
  void proceedToPayment() {
    final destination = selectedMethod.value == PaymentMethod.va
        ? AppRoutes.paymentVa
        : AppRoutes.paymentQr;

    Get.toNamed(destination);
    startTimer();
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

  void downloadReceipt() {
    Get.snackbar(
      'Unduh',
      'Kwitansi sedang disiapkan untuk diunduh.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void shareReceipt() {
    Get.snackbar(
      'Bagikan',
      'Tautan kwitansi siap dibagikan.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// Formats remaining time into MM:SS format
  String get formattedTime {
    final minutes = (remainingTime.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingTime.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void selectBank(String bank) {
    selectedBank.value = bank;
  }
}

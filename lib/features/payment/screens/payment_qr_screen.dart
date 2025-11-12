import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/payment/controllers/payment_controller.dart';

class PaymentQrScreen extends GetView<PaymentController> {
  const PaymentQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: 'QRIS Payment'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Scan QR to Pay', style: AppTextStyles.h2),
            const SizedBox(height: 16),
            // Mock QR Code
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.neutralLight),
              ),
              child: const Icon(Icons.qr_code_scanner,
                  size: 250, color: AppColors.neutralDarkest),
            ),
            const SizedBox(height: 24),
            _buildTimerCard(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.completePayment,
                child: const Text('Simulate Complete Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.warningLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Time Limit', style: AppTextStyles.bodyM),
          Obx(
                () =>
                Text(
                  controller.formattedTime,
                  style: AppTextStyles.h3.copyWith(
                      color: AppColors.warningDark),
                ),
          ),
        ],
      ),
    );
  }
}
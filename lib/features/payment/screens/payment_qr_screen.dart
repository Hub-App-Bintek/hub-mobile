import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/payment/controllers/payment_controller.dart';

class PaymentQrScreen extends GetView<PaymentController> {
  const PaymentQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: 'Pembayaran'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Pembayaran Termin 3',
                    style: AppTextStyles.bodyM.copyWith(
                      color: AppColors.neutralMediumLight,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Obx(
                    () => Text(
                      Formatters.currency(controller.amount.value),
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.neutralDarkest,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildQrBox(),
            const SizedBox(height: 16),
            Text(
              'Scan QR code dengan aplikasi pembayaran Anda',
              style: AppTextStyles.bodyM.copyWith(
                color: AppColors.neutralMediumLight,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              'Waktu tersisa',
              style: AppTextStyles.bodyM.copyWith(
                color: AppColors.neutralMediumLight,
              ),
            ),
            const SizedBox(height: 4),
            Obx(
              () => Text(
                controller.formattedTime,
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.primaryDarkest,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildInstructionCard(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PkpElevatedButton(
              text: 'Unduh QR Code',
              onPressed: controller.downloadReceipt,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQrBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: const Icon(
        Icons.qr_code,
        size: 180,
        color: AppColors.neutralDarkest,
      ),
    );
  }

  Widget _buildInstructionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cara Pembayaran',
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutralDarkest,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '1. Buka aplikasi pembayaran digital Anda (GoPay, OVO, DANA, dll)\n'
            '2. Pilih menu Scan atau QRIS\n'
            '3. Scan QR code yang tersedia di halaman ini\n'
            '4. Pastikan nominal sesuai sebelum menyelesaikan pembayaran',
            style: AppTextStyles.bodyS.copyWith(
              color: AppColors.neutralDarkest,
            ),
          ),
        ],
      ),
    );
  }
}

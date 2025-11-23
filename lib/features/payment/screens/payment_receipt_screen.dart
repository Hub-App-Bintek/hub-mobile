import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/payment/controllers/payment_controller.dart';

class PaymentReceiptScreen extends GetView<PaymentController> {
  const PaymentReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final amountText = Formatters.currency(controller.amount.value);
    return Scaffold(
      appBar: const PkpAppBar(title: 'Bukti Pembayaran'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildCheckmarkBadge(),
              const SizedBox(height: 16),
              Text(
                'Pembayaran Berhasil',
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.primaryDarkest,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'Transaksi Anda telah berhasil diproses',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.neutralMediumLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              _buildReceiptDetails(amountText),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: PkpOutlinedButton(
                      text: 'Unduh',
                      onPressed: controller.downloadReceipt,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PkpOutlinedButton(
                      text: 'Bagikan',
                      onPressed: controller.shareReceipt,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckmarkBadge() {
    return Container(
      width: 88,
      height: 88,
      decoration: const BoxDecoration(
        color: AppColors.khaki,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(Icons.check, color: AppColors.primaryDark, size: 48),
      ),
    );
  }

  Widget _buildReceiptDetails(String amountText) {
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
          Center(
            child: Column(
              children: [
                Text(
                  'Total Pembayaran',
                  style: AppTextStyles.bodyS.copyWith(
                    color: AppColors.neutralMediumLight,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  amountText,
                  style: AppTextStyles.h2.copyWith(
                    color: const Color(0xFF0D63FF),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildDetailRow('Invoice', 'Pembayaran Termin 1'),
          const SizedBox(height: 12),
          _buildDetailRow('Tanggal', '20 Nov 2025'),
          const SizedBox(height: 12),
          _buildDetailRow('Metode Pembayaran', '<Payment Method>'),
          const SizedBox(height: 12),
          _buildDetailRow('ID Transaksi', 'TRX1763910308484'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    final valueStyle = isTotal
        ? AppTextStyles.h3
        : AppTextStyles.bodyM.copyWith(
            color: AppColors.neutralDarkest,
            fontWeight: FontWeight.w700,
          );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyM.copyWith(
            color: AppColors.neutralMediumLight,
          ),
        ),
        Text(value, style: valueStyle, textAlign: TextAlign.right),
      ],
    );
  }
}

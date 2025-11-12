import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/payment/controllers/payment_controller.dart';

import '../../../app/navigation/app_pages.dart';

class PaymentReceiptScreen extends GetView<PaymentController> {
  const PaymentReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        // Remove back button
        title: Text('Pembayaran Sukses', style: AppTextStyles.h3),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: AppColors.success, size: 80),
            const SizedBox(height: 16),
            Text('Transaksi Berhasil', style: AppTextStyles.h2),
            const SizedBox(height: 8),
            Text(
              'Pembayaran telah berhasil diproses',
              style: AppTextStyles.bodyM.copyWith(
                color: AppColors.neutralMedium,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildReceiptDetails(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            Get.until(
              (route) => route.settings.name == AppRoutes.projectDetails,
            );
          },
          child: const Text('Done'),
        ),
      ),
    );
  }

  Widget _buildReceiptDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutralLight),
      ),
      child: Column(
        children: [
          _buildDetailRow('Payment Method', 'QRIS'),
          const Divider(height: 24),
          _buildDetailRow('Item', 'Pembayaran Termin 1'),
          const Divider(height: 24),
          _buildDetailRow(
            'Total',
            Formatters.currency(controller.amount.value),
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    final valueStyle = isTotal
        ? AppTextStyles.h3
        : AppTextStyles.bodyL.copyWith(fontWeight: FontWeight.bold);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.bodyM),
        Text(value, style: valueStyle),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/payment/controllers/payment_controller.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: 'Payment'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPaymentSummary(),
            const SizedBox(height: 24),
            Text('Select Payment Method', style: AppTextStyles.h3),
            const SizedBox(height: 16),
            _buildPaymentMethodList(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: controller.proceedToQrPayment,
          child: const Text('Proceed to Payment'),
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.neutralLightest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutralLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pembayaran Termin 1', // The item being paid for
            style: AppTextStyles.bodyL.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Amount', style: AppTextStyles.bodyM),
              Obx(
                    () =>
                    Text(
                      Formatters.currency(controller.amount.value),
                      style: AppTextStyles.h3,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodList() {
    return Obx(() =>
        Column(
          children: [
            _buildPaymentMethodTile(
              title: 'QRIS',
              icon: Icons.qr_code_2,
              method: PaymentMethod.qris,
            ),
            _buildPaymentMethodTile(
              title: 'Debit Card',
              icon: Icons.credit_card,
              method: PaymentMethod.debit,
            ),
            _buildPaymentMethodTile(
              title: 'Credit Card',
              icon: Icons.credit_card_outlined,
              method: PaymentMethod.credit,
            ),
            _buildPaymentMethodTile(
              title: 'Virtual Account',
              icon: Icons.account_balance_wallet,
              method: PaymentMethod.va,
            ),
          ],
        ));
  }

  Widget _buildPaymentMethodTile({
    required String title,
    required IconData icon,
    required PaymentMethod method,
  }) {
    final isSelected = controller.selectedMethod.value == method;
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? AppColors.primary : AppColors.neutralLight,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryDarkest),
        title: Text(title, style: AppTextStyles.bodyL),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: AppColors.primary)
            : const Icon(Icons.circle_outlined, color: AppColors.neutralMedium),
        onTap: () => controller.selectPaymentMethod(method),
      ),
    );
  }
}
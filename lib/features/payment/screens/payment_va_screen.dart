import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/features/payment/controllers/payment_controller.dart';
import 'package:pkp_hub/core/utils/formatters.dart';

class PaymentVAScreen extends GetView<PaymentController> {
  const PaymentVAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bankName = 'BCA';
    const vaNumber = '7001200000000003';
    return Scaffold(
      appBar: const PkpAppBar(
        title: 'Pembayaran',
        backgroundColor: AppColors.primaryDark,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 24),
              _buildVaCard(bankName: bankName, vaNumber: vaNumber),
              const SizedBox(height: 16),
              _buildCountdownCard(),
              const SizedBox(height: 16),
              _buildInstructions(bankName: bankName, vaNumber: vaNumber),
              const Spacer(),
              PkpElevatedButton(
                text: 'Salin Nomor',
                onPressed: () {
                  Clipboard.setData(const ClipboardData(text: vaNumber));
                  Get.snackbar(
                    'Tersalin',
                    'Nomor VA berhasil disalin.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVaCard({required String bankName, required String vaNumber}) {
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
            'Bank',
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutralMediumLight,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            bankName,
            style: AppTextStyles.h4.copyWith(
              color: AppColors.neutralDarkest,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Virtual Account',
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.neutralMediumLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      vaNumber,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.neutralDarkest,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              PkpElevatedButton(
                text: 'Salin',
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: vaNumber));
                  Get.snackbar(
                    'Tersalin',
                    'Nomor VA berhasil disalin.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        children: [
          Text(
            'Bayar sebelum',
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutralMediumLight,
            ),
          ),
          const SizedBox(height: 6),
          Obx(
            () => Text(
              controller.formattedTime,
              style: AppTextStyles.h3.copyWith(
                color: AppColors.primaryDarkest,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions({
    required String bankName,
    required String vaNumber,
  }) {
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
          const SizedBox(height: 12),
          Text(
            'Melalui ATM $bankName',
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutralDarkest,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '1. Masukkan kartu ATM dan PIN\n'
            '2. Pilih menu Transaksi Lainnya\n'
            '3. Pilih Transfer\n'
            '4. Pilih Ke Rekening $bankName\n'
            '5. Masukkan nomor Virtual Account:\n   $vaNumber\n'
            '6. Masukkan nominal: ${Formatters.currency(controller.amount.value)}\n'
            '7. Konfirmasi dan selesaikan transaksi',
            style: AppTextStyles.bodyS.copyWith(
              color: AppColors.neutralDarkest,
            ),
          ),
        ],
      ),
    );
  }
}

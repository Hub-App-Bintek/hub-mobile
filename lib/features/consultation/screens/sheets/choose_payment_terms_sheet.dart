import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';

class ChoosePaymentTermsSheet extends StatelessWidget {
  const ChoosePaymentTermsSheet({
    super.key,
    required this.contractValueController,
    required this.termAmountControllers,
    required this.termDueDateControllers,
    required this.isPaymentTermsValid,
    required this.loadingFlag,
    required this.onPickDate,
    required this.onSubmit,
  });

  final TextEditingController contractValueController;
  final List<TextEditingController> termAmountControllers;
  final List<TextEditingController> termDueDateControllers;
  final RxBool isPaymentTermsValid;
  final RxBool loadingFlag;
  final void Function(int index) onPickDate;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PkpAppBar(
              title: 'Termin Pembayaran',
              leading: Icons.close_rounded,
              backgroundColor: AppColors.white,
              titleTextColor: AppColors.neutralDarkest,
              leadingColor: AppColors.neutralDarkest,
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    PkpTextFormField(
                      controller: contractValueController,
                      labelText: 'Nilai Kontrak',
                      hintText: 'Masukkan nilai kontrak',
                      type: PkpTextFormFieldType.currency,
                      borderRadius: 12,
                    ),
                    const SizedBox(height: 16),
                    _buildPaymentTermSection(
                      title: 'Termin 1',
                      amountController: termAmountControllers[0],
                      dueDateController: termDueDateControllers[0],
                      onPickDate: () => onPickDate(0),
                    ),
                    const SizedBox(height: 16),
                    _buildPaymentTermSection(
                      title: 'Termin 2',
                      amountController: termAmountControllers[1],
                      dueDateController: termDueDateControllers[1],
                      onPickDate: () => onPickDate(1),
                    ),
                    const SizedBox(height: 16),
                    _buildPaymentTermSection(
                      title: 'Termin 3',
                      amountController: termAmountControllers[2],
                      dueDateController: termDueDateControllers[2],
                      onPickDate: () => onPickDate(2),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Obx(
              () => PkpBottomActions(
                primaryText: 'Submit',
                primaryLoading: loadingFlag.value,
                primaryEnabled: !loadingFlag.value && isPaymentTermsValid.value,
                onPrimaryPressed: () {
                  if (loadingFlag.value) return;
                  onSubmit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentTermSection({
    required String title,
    required TextEditingController amountController,
    required TextEditingController dueDateController,
    required VoidCallback onPickDate,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h4.copyWith(color: AppColors.neutralDarkest),
        ),
        const SizedBox(height: 8),
        PkpTextFormField(
          controller: amountController,
          labelText: 'Nominal',
          hintText: '123.456.789',
          type: PkpTextFormFieldType.currency,
          borderRadius: 12,
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onPickDate,
          child: AbsorbPointer(
            child: PkpTextFormField(
              controller: dueDateController,
              labelText: 'Tanggal Jatuh Tempo',
              hintText: 'Pilih Tanggal',
              type: PkpTextFormFieldType.datetime,
              borderRadius: 12,
            ),
          ),
        ),
      ],
    );
  }
}

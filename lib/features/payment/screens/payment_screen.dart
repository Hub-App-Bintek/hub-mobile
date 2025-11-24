import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/payment/controllers/payment_controller.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 16),
              Text(
                'Pilih Metode Pembayaran',
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.neutralDarkest,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(
                  () => ListView(
                    children: [
                      _MethodTile(
                        label: 'QRIS',
                        icon: Icons.qr_code_2,
                        method: PaymentMethod.qris,
                        isExpanded: false,
                        selected:
                            controller.selectedMethod.value ==
                            PaymentMethod.qris,
                        onTap: () =>
                            controller.selectPaymentMethod(PaymentMethod.qris),
                      ),
                      const SizedBox(height: 12),
                      _ExpandableMethodTile(
                        label: 'Debit/Credit Card',
                        icon: Icons.credit_card,
                        isExpanded:
                            controller.selectedMethod.value ==
                            PaymentMethod.debit,
                        selected:
                            controller.selectedMethod.value ==
                            PaymentMethod.debit,
                        onTap: () =>
                            controller.selectPaymentMethod(PaymentMethod.debit),
                        banks: const [
                          'BCA',
                          'Mandiri',
                          'BNI',
                          'BRI',
                          'CIMB Niaga',
                          'Permata Bank',
                        ],
                        selectedBank: controller.selectedBank.value,
                        onBankSelected: controller.selectBank,
                      ),
                      const SizedBox(height: 12),
                      _ExpandableMethodTile(
                        label: 'Virtual Account',
                        icon: Icons.account_balance,
                        isExpanded:
                            controller.selectedMethod.value == PaymentMethod.va,
                        selected:
                            controller.selectedMethod.value == PaymentMethod.va,
                        onTap: () =>
                            controller.selectPaymentMethod(PaymentMethod.va),
                        banks: const [
                          'BCA',
                          'Mandiri',
                          'BNI',
                          'BRI',
                          'CIMB Niaga',
                          'Permata Bank',
                        ],
                        selectedBank: controller.selectedBank.value,
                        onBankSelected: controller.selectBank,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: PkpElevatedButton(
                  text: 'Bayar',
                  onPressed: controller.proceedToPayment,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MethodTile extends StatelessWidget {
  const _MethodTile({
    required this.label,
    required this.icon,
    required this.method,
    required this.onTap,
    required this.selected,
    required this.isExpanded,
  });

  final String label;
  final IconData icon;
  final PaymentMethod method;
  final VoidCallback onTap;
  final bool selected;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return _BaseTile(
      label: label,
      icon: icon,
      selected: selected,
      isExpanded: isExpanded,
      trailing: _RadioBadge(selected: selected),
      onTap: onTap,
    );
  }
}

class _ExpandableMethodTile extends StatelessWidget {
  const _ExpandableMethodTile({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.selected,
    required this.isExpanded,
    required this.banks,
    required this.selectedBank,
    required this.onBankSelected,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool selected;
  final bool isExpanded;
  final List<String> banks;
  final String? selectedBank;
  final ValueChanged<String> onBankSelected;

  @override
  Widget build(BuildContext context) {
    return _BaseTile(
      label: label,
      icon: icon,
      selected: selected,
      isExpanded: isExpanded,
      trailing: Icon(
        isExpanded ? Icons.expand_less : Icons.expand_more,
        color: AppColors.neutralMediumLight,
      ),
      onTap: onTap,
      child: isExpanded
          ? Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                children: banks
                    .map(
                      (bank) => _BankRow(
                        label: bank,
                        selected: selectedBank == bank,
                        onTap: () => onBankSelected(bank),
                      ),
                    )
                    .toList(),
              ),
            )
          : null,
    );
  }
}

class _BaseTile extends StatelessWidget {
  const _BaseTile({
    required this.label,
    required this.icon,
    required this.selected,
    required this.isExpanded,
    required this.trailing,
    required this.onTap,
    this.child,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final bool isExpanded;
  final Widget trailing;
  final VoidCallback onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.inputSurface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.inputBorder,
              width: selected ? 2 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: selected
                        ? AppColors.primaryDarkest
                        : AppColors.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      label,
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.neutralDarkest,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  trailing,
                ],
              ),
              if (child != null) child!,
            ],
          ),
        ),
      ),
    );
  }
}

class _BankRow extends StatelessWidget {
  const _BankRow({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
            ),
            _RadioBadge(selected: selected),
          ],
        ),
      ),
    );
  }
}

class _RadioBadge extends StatelessWidget {
  const _RadioBadge({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.neutralMediumLight,
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected ? AppColors.primary : Colors.transparent,
          ),
        ),
      ),
    );
  }
}

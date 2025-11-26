import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_card.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final invoices = [
      const _ProjectDocument(
        'Pembayaran Termin 1',
        'INV-123-098-576 Total: Rp 50.000.000',
        true,
      ),
      const _ProjectDocument(
        'Pembayaran Termin 2',
        'Total: Rp 12.000.000',
        false,
      ),
    ];

    return Scaffold(
      appBar: const PkpAppBar(title: 'Invoice Proyek'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: invoices.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = invoices[index];
          return PkpCard(
            title: item.title,
            subtitle: item.subtitle,
            suffixIcon: item.isPaid
                ? const Icon(Icons.check, color: AppColors.successDark)
                : const Icon(Icons.chevron_right),
            onTap: () {
              Get.toNamed(AppRoutes.paymentReceipt);
            },
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: PkpBottomActions(
          primaryText: 'Bayar Tagihan',
          onPrimaryPressed: () {
            Get.toNamed(AppRoutes.payment);
          },
        ),
      ),
    );
  }
}

class _ProjectDocument {
  const _ProjectDocument(this.title, this.subtitle, this.isPaid);

  final String title;
  final String subtitle;
  final bool isPaid;
}

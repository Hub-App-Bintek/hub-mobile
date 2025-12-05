import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/features/monitoring/controllers/monitoring_detail_controller.dart';

class MonitoringDetailScreen extends GetView<MonitoringDetailController> {
  const MonitoringDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(
        title: 'Pengawasan',
        backgroundColor: AppColors.primaryDark,
        leadingColor: AppColors.white,
        titleTextColor: AppColors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            _StageSelector(),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                switch (controller.selectedStage.value) {
                  case MonitoringStage.kontrak:
                    return _KontrakList();
                  case MonitoringStage.dokumen:
                    return _DokumenList();
                  case MonitoringStage.laporan:
                    return _LaporanList();
                  case MonitoringStage.temuan:
                    return _TemuanList();
                  case MonitoringStage.invoice:
                    return _InvoiceList();
                }
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        switch (controller.selectedStage.value) {
          case MonitoringStage.kontrak:
            return controller.hasApprovedContract.value
                ? const SizedBox.shrink()
                : _KontrakActions();
          case MonitoringStage.dokumen:
            return _UploadDokumenAction();
          default:
            return const SizedBox.shrink();
        }
      }),
    );
  }
}

// ------------------- Stage selector -------------------

class _StageSelector extends GetView<MonitoringDetailController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget buildStage(
      MonitoringStage stage,
      IconData icon,
      String label,
      int badgeCount,
    ) {
      final isActive = controller.selectedStage.value == stage;
      final circleColor = isActive
          ? theme.colorScheme.primary
          : theme.colorScheme.surfaceContainerHighest;
      final iconColor = isActive
          ? theme.colorScheme.onPrimary
          : theme.colorScheme.onSurface;

      return GestureDetector(
        onTap: () => controller.changeStage(stage),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: circleColor,
                  child: Icon(icon, color: iconColor),
                ),
                if (badgeCount > 0)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        badgeCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(label, style: theme.textTheme.bodySmall),
          ],
        ),
      );
    }

    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const SizedBox(width: 4),
            buildStage(
              MonitoringStage.kontrak,
              Icons.description_outlined,
              'Kontrak',
              controller.kontrakCount,
            ),
            const SizedBox(width: 16),
            buildStage(
              MonitoringStage.dokumen,
              Icons.description,
              'Dokumen',
              controller.dokumenCount,
            ),
            const SizedBox(width: 16),
            buildStage(
              MonitoringStage.laporan,
              Icons.note_alt_outlined,
              'Laporan',
              controller.laporanCount,
            ),
            const SizedBox(width: 16),
            buildStage(
              MonitoringStage.temuan,
              Icons.attach_money_outlined,
              'Temuan',
              controller.temuanCount,
            ),
            const SizedBox(width: 16),
            buildStage(
              MonitoringStage.invoice,
              Icons.request_quote_outlined,
              'Invoice',
              controller.invoiceCount,
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

// ------------------- Kontrak -------------------

class _KontrakList extends GetView<MonitoringDetailController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        itemCount: controller.contracts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final item = controller.contracts[index];
          final isApproved = item.status == ContractStatus.approved;
          final chipColor = isApproved
              ? Colors.green.shade100
              : Colors.orange.shade100;
          final chipTextColor = isApproved
              ? Colors.green.shade800
              : Colors.orange.shade800;

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.download_outlined),
                        onPressed: () => controller.downloadContract(item),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(item.company, style: theme.textTheme.bodySmall),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _formatDate(item.date),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.hintColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: chipColor,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          item.getStatusLabel(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: chipTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _KontrakActions extends GetView<MonitoringDetailController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Obx(
          () => controller.hasApprovedContract.value
              ? const SizedBox()
              : Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: controller.requestRevision,
                        icon: const Icon(Icons.close),
                        label: const Text('Minta Revisi'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: controller.approveContract,
                        icon: const Icon(Icons.check_circle_outline),
                        label: const Text('Setujui'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

// ------------------- Dokumen -------------------

class _DokumenList extends GetView<MonitoringDetailController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        itemCount: controller.documents.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final item = controller.documents[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              title: Text(item.title, style: theme.textTheme.titleMedium),
              trailing: IconButton(
                icon: const Icon(Icons.download_outlined),
                onPressed: () => controller.downloadDocument(item),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _UploadDokumenAction extends GetView<MonitoringDetailController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.uploadDocument,
            child: const Text('Upload Dokumen'),
          ),
        ),
      ),
    );
  }
}

// ------------------- Laporan -------------------

class _LaporanList extends GetView<MonitoringDetailController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        itemCount: controller.laporanItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final item = controller.laporanItems[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => controller.openReportDetail(item),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text('Pengawas', style: theme.textTheme.bodySmall),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(item.date),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ------------------- Temuan -------------------

class _TemuanList extends GetView<MonitoringDetailController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        itemCount: controller.temuanItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final item = controller.temuanItems[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => controller.openFindingDetail(item),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text('Pengawas', style: theme.textTheme.bodySmall),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(item.date),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ------------------- Invoice -------------------

class _InvoiceList extends GetView<MonitoringDetailController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        itemCount: controller.invoiceItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final item = controller.invoiceItems[index];
          final statusLabel = item.isPaid ? 'LUNAS' : 'BELUM LUNAS';
          final chipColor = item.isPaid
              ? Colors.green.shade100
              : Colors.red.shade100;
          final chipTextColor = item.isPaid
              ? Colors.green.shade800
              : Colors.red.shade800;

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => controller.openInvoiceDetail(item),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        Icon(
                          item.isPaid
                              ? Icons.check_circle_outline
                              : Icons.cancel_outlined,
                          color: item.isPaid ? Colors.green : Colors.red,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(item.date),
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Rp ${_formatCurrency(item.amount)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: chipColor,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        statusLabel,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: chipTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ------------------- Helpers -------------------

String _formatDate(DateTime date) {
  // Simple: 18 Nov 2025 etc.
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des',
  ];
  final day = date.day.toString().padLeft(2, '0');
  final month = months[date.month - 1];
  final year = date.year.toString();
  return '$day $month $year';
}

String _formatCurrency(int value) {
  final s = value.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    final reverseIndex = s.length - i - 1;
    buffer.write(s[reverseIndex]);
    if (i % 3 == 2 && i != s.length - 1) {
      buffer.write('.');
    }
  }
  return buffer.toString().split('').reversed.join();
}

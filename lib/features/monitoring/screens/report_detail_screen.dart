import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/features/monitoring/controllers/monitoring_detail_controller.dart';
import 'package:pkp_hub/features/monitoring/controllers/report_detail_controller.dart';

class MonitoringReportDetailScreen extends GetView<ReportDetailController> {
  const MonitoringReportDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final report = controller.report;
    final titleDate =
        '${report.date.day.toString().padLeft(2, '0')}-${report.date.month.toString().padLeft(2, '0')}-${report.date.year}';

    return Scaffold(
      appBar: PkpAppBar(
        title: 'Laporan $titleDate',
        backgroundColor: AppColors.primaryDark,
        leadingColor: AppColors.white,
        titleTextColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Laporan', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              initialValue: report.category,
              items: const [
                'Pondasi',
                'Sloof',
                'Kolom',
                'Ring Balok',
                'Rangka Atap',
                'Pencahayaan',
                'Penghawaan',
                'Temuan',
              ]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: null,
            ),
            const SizedBox(height: 16),
            Text('Lokasi', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 4),
            TextFormField(
              enabled: false,
              initialValue: 'Lokasi Rumah Bagian ${report.category} $titleDate',
            ),
            const SizedBox(height: 16),
            Text('Tenaga Ahli', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 4),
            TextFormField(
              enabled: false,
              initialValue: 'Galih Ramadan',
            ),
            const SizedBox(height: 16),
            Text('Notes', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 4),
            TextFormField(
              enabled: false,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Tambahan isi Laporan',
              ),
            ),
            const SizedBox(height: 16),
            Text('Gambar Bukti', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(
                3,
                    (index) => Container(
                  width: 110,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.colorScheme.surfaceVariant,
                  ),
                  child: const Icon(Icons.image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/features/monitoring/controllers/report_detail_controller.dart';

class MonitoringReportDetailScreen extends GetView<ReportDetailController> {
  const MonitoringReportDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const PkpAppBar(
        title: 'Laporan',
        backgroundColor: AppColors.primaryDark,
        leadingColor: AppColors.white,
        titleTextColor: AppColors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.reportDetail.value == null) {
          return const Center(child: Text('Gagal memuat detail laporan.'));
        }

        final report = controller.reportDetail.value;

        final titleDate =
            '${report?.createdAt.day.toString().padLeft(2, '0')}-${report?.createdAt.month.toString().padLeft(2, '0')}-${report?.createdAt.year}';

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                initialValue: controller.reportDetail.value.category,
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
              ),*/
              const SizedBox(height: 16),
              TextFormField(
                enabled: false,
                initialValue: 'Lokasi Rumah Bagian ${report?.title} $titleDate',
              ),
              const SizedBox(height: 16),
              Text('Tenaga Ahli', style: theme.textTheme.bodyMedium),
              const SizedBox(height: 4),
              TextFormField(
                enabled: false,
                initialValue: report?.supervisorName,
              ),
              const SizedBox(height: 16),
              Text('Notes', style: theme.textTheme.bodyMedium),
              const SizedBox(height: 4),
              TextFormField(
                enabled: false,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: report?.summary ?? "Tidak ada catatan",
                ),
              ),
              const SizedBox(height: 16),
              Text('Gambar Dokumentasi', style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(
                  report?.images.length ?? 0,
                  (index) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      report!.images[index].imageUrl,
                      width: 110,
                      height: 80,
                      fit: BoxFit.cover,
                      // Ensures the image fills the container without distortion

                      // --- BUILT-IN LOADING WIDGET ---
                      loadingBuilder:
                          (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            if (loadingProgress == null) {
                              return child; // The image is fully loaded, so we show it
                            }
                            return Container(
                              width: 110,
                              height: 80,
                              color: theme.colorScheme.surfaceContainerHighest,
                              child: Center(
                                child: CircularProgressIndicator(
                                  // Calculate the loading progress if available
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                  strokeWidth: 2.0,
                                ),
                              ),
                            );
                          },

                      // --- BUILT-IN ERROR WIDGET ---
                      errorBuilder:
                          (
                            BuildContext context,
                            Object error,
                            StackTrace? stackTrace,
                          ) {
                            return Container(
                              width: 110,
                              height: 80,
                              color: theme.colorScheme.surfaceContainerHighest,
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.red,
                              ),
                            );
                          },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

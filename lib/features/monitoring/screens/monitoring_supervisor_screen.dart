import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/features/monitoring/controllers/supervisor_screen_controller.dart';

class MonitoringSupervisorScreen extends GetView<SupervisorController> {
  const MonitoringSupervisorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const PkpAppBar(
        title: 'Pilih Tenaga Ahli Pengawasan Konstruksi',
        backgroundColor: AppColors.primaryDark,
        leadingColor: AppColors.white,
        titleTextColor: AppColors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchSupervisors(),
        child: Column(
          children: [
            Container(
              color: theme.scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Daftar Supervisi Pekerjaan',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _showSortBottomSheet(context),
                      icon: const Icon(Icons.sort),
                      label: const Text('Urutkan'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: controller.supervisors.length,
                  itemBuilder: (_, index) {
                    final supervisor = controller.supervisors[index];
                    return Obx(
                      () => _SupervisorCard(
                        supervisor: supervisor,
                        isSelected:
                            controller.selectedSupervisorId.value ==
                            supervisor.id,
                        onTap: () => controller.selectSupervisor(supervisor),
                      ),
                    );
                  },
                ),
              ),
            ),
            Obx(
              () => Card(
                margin: EdgeInsets.zero,
                // Remove default card margins
                elevation: 4,
                // Add a slight shadow to lift it from the content
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Make it a sharp rectangle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.selectedSupervisorId.value == null
                          ? null
                          : controller.submitMonitoringRequest,
                      child: const Text('Lanjutkan'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 12),
              const ListTile(
                title: Text(
                  'Urutkan berdasarkan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              RadioListTile<SupervisorSortOption>(
                title: const Text('Nama'),
                value: SupervisorSortOption.name,
                groupValue: controller.sortOption.value,
                onChanged: (v) {
                  if (v != null) {
                    controller.changeSort(v);
                    Get.back();
                  }
                },
              ),
              RadioListTile<SupervisorSortOption>(
                title: const Text('Harga'),
                value: SupervisorSortOption.price,
                groupValue: controller.sortOption.value,
                onChanged: (v) {
                  if (v != null) {
                    controller.changeSort(v);
                    Get.back();
                  }
                },
              ),
              RadioListTile<SupervisorSortOption>(
                title: const Text('Jarak'),
                value: SupervisorSortOption.distance,
                groupValue: controller.sortOption.value,
                onChanged: (v) {
                  if (v != null) {
                    controller.changeSort(v);
                    Get.back();
                  }
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}

class _SupervisorCard extends StatelessWidget {
  const _SupervisorCard({
    required this.supervisor,
    required this.isSelected,
    required this.onTap,
  });

  final ConstructionSupervisor supervisor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          // mainAxisAlignment is removed to allow content to align naturally at the top
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.05),
              child: Text(
                supervisor.initial,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // --- FIX STARTS HERE ---
            // 1. Wrap the scrolling content in Expanded to fill available space.
            Expanded(
              // 2. Use a SingleChildScrollView to prevent overflow.
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(), // A nice scroll effect
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center the text content vertically
                  children: [
                    Text(
                      supervisor.name,
                      textAlign: TextAlign.center,
                      // Make the name bold to stand out
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      supervisor.specialization,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      supervisor.priceLabel,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      supervisor.distanceLabel,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // --- FIX ENDS HERE ---
          ],
        ),
      ),
    );
  }
}

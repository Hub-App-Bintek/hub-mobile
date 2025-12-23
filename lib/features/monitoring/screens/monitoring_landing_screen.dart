import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/features/main/widgets/project_info_card.dart';
import 'package:pkp_hub/features/monitoring/controllers/monitoring_controller.dart';

class MonitoringScreen extends GetView<MonitoringController> {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const headerIcon = 'assets/icons/icon_supervision.svg';
    const newLicenseIcon = 'assets/icons/icon_licensing.svg';
    const fromConsultIcon = 'assets/icons/icon_projects.svg';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(
        title: 'Pengawasan',
        backgroundColor: AppColors.primaryDark,
        leadingColor: AppColors.white,
        titleTextColor: AppColors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _Header(iconAsset: headerIcon),
                const SizedBox(height: 24),
                _ActionCard(
                  title: 'Pengawasan Baru',
                  subtitle: 'Buat permohonan pengawasan dari awal',
                  iconAsset: newLicenseIcon,
                  onTap: () => Get.toNamed(AppRoutes.monitoringForm),
                ),
                const SizedBox(height: 12),
                _ActionCard(
                  title: 'Buat Pengawasan dari Project',
                  subtitle: 'Gunakan data dari project yang sudah ada',
                  iconAsset: fromConsultIcon,
                  onTap: () => _showConsultationPicker(context, controller),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.iconAsset});

  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: const BoxDecoration(
            color: AppColors.primaryDark,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              iconAsset,
              width: 48,
              height: 48,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Pengawasan',
          style: AppTextStyles.h3.copyWith(color: AppColors.neutralDarkest),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.iconAsset,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String iconAsset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryDark,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconAsset,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.h4.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.white.withOpacity(0.9),
                        height: 15 / 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PengawasanCardButton extends StatelessWidget {
  const _PengawasanCardButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: theme.colorScheme.onPrimary.withOpacity(0.1),
              child: Icon(icon, color: theme.colorScheme.onPrimary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showConsultationPicker(
  BuildContext context,
  MonitoringController controller,
) async {
  // 1. Ask the controller to fetch the data.
  //    The controller will show a loading indicator on the main screen.
  final bool isDataAvailable = await controller.fetchConsultations();

  // 2. Only show the bottom sheet if the data fetch was successful.
  if (!isDataAvailable) return;

  // 3. Show the bottom sheet, which is pure UI and reads state from the controller.
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const PkpAppBar(
              title: 'Pilih Proyek',
              backgroundColor: AppColors.white,
              leadingColor: AppColors.neutralDarkest,
              titleTextColor: AppColors.neutralDarkest,
            ),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                // Obx rebuilds the list when the controller's state changes.
                child: Obx(
                  () => Column(
                    children: List.generate(controller.consultations.length, (
                      index,
                    ) {
                      final item = controller.consultations[index];
                      final selected =
                          controller.selectedConsultationIndex.value == index;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index < controller.consultations.length - 1
                              ? 16.0
                              : 0,
                        ),
                        child: ProjectInfoCard(
                          title: item.projectName ?? 'No Name',
                          primaryLine: ProjectInfoLine(
                            icon: Icons.calendar_today_outlined,
                            // Use your actual data model fields
                            text:
                                item.consultationInfo?.consultationStatus ??
                                'No Status',
                          ),
                          secondaryLine: ProjectInfoLine(
                            icon: Icons.place_outlined,
                            text: item.city ?? 'No Location',
                          ),
                          onTap: () => controller.selectConsultation(index),
                          isSelected: selected,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Obx(
              () => PkpBottomActions(
                primaryText: 'Pilih',
                onPrimaryPressed: controller.confirmSelection,
                primaryEnabled: controller.selectedConsultationIndex.value >= 0,
              ),
            ),
          ],
        ),
      );
    },
  );
}

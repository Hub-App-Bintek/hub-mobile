import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/features/licensing/controllers/licensing_controller.dart';
import 'package:pkp_hub/features/main/widgets/project_info_card.dart';

class LicensingScreen extends GetView<LicensingController> {
  const LicensingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const headerIcon = 'assets/icons/icon_licensing.svg';
    const newLicenseIcon = 'assets/icons/icon_licensing.svg';
    const fromConsultIcon = 'assets/icons/icon_consultation.svg';

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(
        title: 'Perizinan',
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
                  title: 'Perizinan Baru',
                  subtitle: 'Buat permohonan perizinan dari awal',
                  iconAsset: newLicenseIcon,
                  onTap: () => _showBuildingTypeSheet(context),
                ),
                const SizedBox(height: 12),
                _ActionCard(
                  title: 'Buat Perizinan dari Konsultasi',
                  subtitle: 'Gunakan data dari konsultasi yang sudah ada',
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
          'Perizinan',
          style: AppTextStyles.h3.copyWith(color: AppColors.neutralDarkest),
        ),
        const SizedBox(height: 4),
        Text(
          'Pilih jenis perizinan yang ingin Anda buat',
          style: AppTextStyles.bodyM.copyWith(
            color: AppColors.neutralMediumLight,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

void _showBuildingTypeSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Tipe Bangunan',
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.neutralDarkest,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.neutralDarkest,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Pilih apakah bangunan Anda menggunakan desain prototype atau desain kustom',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.neutralMediumLight,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 16),
              _BuildingTypeTile(
                title: 'Prototype',
                subtitle: 'Bangunan menggunakan desain prototype standar',
                icon: Icons.house_siding_outlined,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.licensingLocation, arguments: true);
                },
              ),
              const SizedBox(height: 12),
              _BuildingTypeTile(
                title: 'Non Prototype',
                subtitle: 'Bangunan dengan desain kustom',
                icon: Icons.apartment_outlined,
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoutes.licensingLocation, arguments: false);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    },
  );
}

class _BuildingTypeTile extends StatelessWidget {
  const _BuildingTypeTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.inputSurface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLightest,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.primaryDark, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.neutralDarkest,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.neutralMediumLight,
                        height: 16 / 12,
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

void _showConsultationPicker(
  BuildContext context,
  LicensingController controller,
) {
  controller.showBottomSheet(
    SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const PkpAppBar(
              title: 'Pilih Konsultasi',
              backgroundColor: AppColors.white,
              leadingColor: AppColors.neutralDarkest,
              titleTextColor: AppColors.neutralDarkest,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ...List.generate(controller.consultations.length, (index) {
                    final item = controller.consultations[index];
                    return Obx(() {
                      final selected =
                          controller.selectedConsultationIndex.value == index;
                      return index < controller.consultations.length - 1
                          ? Column(
                              children: [
                                ProjectInfoCard(
                                  title: item.title,
                                  primaryLine: ProjectInfoLine(
                                    icon: Icons.calendar_today_outlined,
                                    text: item.dateLabel,
                                  ),
                                  secondaryLine: ProjectInfoLine(
                                    icon: Icons.place_outlined,
                                    text: item.location,
                                  ),
                                  onTap: () =>
                                      controller.selectConsultation(index),
                                  isSelected: selected,
                                ),
                                const SizedBox(height: 16),
                              ],
                            )
                          : ProjectInfoCard(
                              title: item.title,
                              primaryLine: ProjectInfoLine(
                                icon: Icons.calendar_today_outlined,
                                text: item.dateLabel,
                              ),
                              secondaryLine: ProjectInfoLine(
                                icon: Icons.place_outlined,
                                text: item.location,
                              ),
                              onTap: () => controller.selectConsultation(index),
                              isSelected: selected,
                            );
                    });
                  }),
                ],
              ),
            ),
            Obx(() {
              return PkpBottomActions(
                primaryText: 'Pilih',
                onPrimaryPressed: () {},
                primaryEnabled: controller.selectedConsultationIndex.value >= 0,
              );
            }),
          ],
        ),
      ),
    ),
  );
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

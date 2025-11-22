import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';

class ProjectsScreen extends GetView<ProjectsController> {
  const ProjectsScreen({super.key, this.controllerTag});

  final String? controllerTag;

  @override
  String? get tag => controllerTag;

  @override
  Widget build(BuildContext context) {
    const categories = ['Konsultasi', 'Perizinan', 'Konstruksi', 'Pengawasan'];
    final initialCategoryIndex = categories.indexOf(
      controller.selectedCategory,
    );
    final safeInitialIndex = initialCategoryIndex >= 0
        ? initialCategoryIndex
        : 0;

    Widget buildProjectCard(Project project) {
      final consultantName = project.consultantName?.trim().isNotEmpty == true
          ? project.consultantName!
          : 'Konsultan belum ditentukan';
      final location = project.location?.address?.trim().isNotEmpty == true
          ? project.location!.address!
          : 'Lokasi belum tersedia';

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.inputSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.inputBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text(
                project.name ?? '',
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 16,
                    color: AppColors.primaryDarkest,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      consultantName,
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.neutralDarkest,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: AppColors.neutralMediumLight,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      location,
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.neutralMediumLight,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: PkpElevatedButton(
                  text: 'Tanya Konsultan',
                  onPressed: () => controller.openProjectReview(project),
                  size: PkpButtonSize.medium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    String buildHeading(String? status) {
      switch (status) {
        case 'PENDING':
          return 'Menunggu Konfirmasi';
        case 'COMPLETED':
          return 'Selesai';
        case 'CANCELLED':
          return 'Dibatalkan';
        case 'CREATED':
          return 'Baru Dibuat';
        case 'ACTIVE':
        default:
          return 'Sedang Berjalan';
      }
    }

    return DefaultTabController(
      length: categories.length,
      initialIndex: safeInitialIndex,
      child: Scaffold(
        appBar: PkpAppBar(
          title: 'Proyek Saya',
          showNavigation: controller.status != null,
          backgroundColor: AppColors.primaryDark,
          onLeadingPressed: () {
            if (controller.status != null) {
              Get.back();
            }
          },
        ),
        body: SafeArea(
          child: Obx(() {
            if (controller.isLoading.value && controller.projects.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.error.value != null) {
              return Center(child: Text(controller.error.value?.message ?? ''));
            }
            final heading = buildHeading(controller.statusFilter);

            return Column(
              children: [
                _buildCategoryTabsSection(categories),
                if (controller.status == null) ...[
                  const SizedBox(height: 16),
                  _buildStatusMenu(context),
                ],
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: controller.refreshProjects,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            heading,
                            style: AppTextStyles.h2.copyWith(
                              color: AppColors.neutralDarkest,
                            ),
                          ),
                        ),
                        if (controller.projects.isEmpty &&
                            !controller.isLoading.value)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Belum ada proyek untuk status ini.',
                              style: AppTextStyles.bodyM.copyWith(
                                color: AppColors.neutralMediumLight,
                              ),
                            ),
                          ),
                        ...controller.projects.map(buildProjectCard),
                        if (controller.hasMore && controller.isLoading.value)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildStatusMenu(BuildContext context) {
    const options = [
      _ProjectStatusOption(
        'Sedang Berjalan',
        'ACTIVE',
        Icons.play_circle_outline,
      ),
      _ProjectStatusOption(
        'Menunggu Konfirmasi',
        'PENDING',
        Icons.hourglass_top,
      ),
      _ProjectStatusOption('Selesai', 'COMPLETED', Icons.check_circle_outline),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: options.map((option) {
            final isSelected = controller.statusFilter == option.status;
            final count = controller.projectCounts[option.status] ?? 0;

            return SizedBox(
              width: (MediaQuery.of(context).size.width - 32) / options.length,
              child: FeatureCircleCard(
                label: option.label,
                icon: option.icon,
                labelOutside: true,
                labelStyle: AppTextStyles.bodyM.copyWith(
                  color: AppColors.neutralDarkest,
                ),
                backgroundColor: isSelected
                    ? AppColors.primaryDark
                    : AppColors.primaryLightest,
                iconColor: isSelected
                    ? AppColors.white
                    : AppColors.primaryDarkest,
                badgeColor: AppColors.errorDark,
                badgeValue: count.toString(),
                showBadge: count > 0,
                onTap: () {
                  if (!isSelected) {
                    controller.updateStatusFilter(option.status);
                  }
                },
              ),
            );
          }).toList(),
        );
      }),
    );
  }

  Widget _buildCategoryTabsSection(List<String> categories) {
    return Material(
      color: AppColors.primaryDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TabBar(
          onTap: (index) => controller.updateCategory(categories[index]),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.white, width: 2),
          ),
          tabAlignment: TabAlignment.fill,
          indicatorSize: TabBarIndicatorSize.tab,
          // indicatorPadding: const EdgeInsets.symmetric(horizontal: 12),
          isScrollable: false,
          labelPadding: EdgeInsets.zero,
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.primaryLightest.withOpacity(0.6),
          labelStyle: AppTextStyles.h4,
          tabs: categories.map((label) => Tab(text: label)).toList(),
        ),
      ),
    );
  }
}

class _ProjectStatusOption {
  const _ProjectStatusOption(this.label, this.status, this.icon);

  final String label;
  final String status;
  final IconData icon;
}

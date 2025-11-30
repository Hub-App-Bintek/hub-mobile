import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';
import 'package:pkp_hub/features/main/widgets/project_info_card.dart';

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
    final isConsultant = controller.userRole.value == UserRole.consultant;

    Widget buildProjectCard(Project project) {
      final isConsultationCategory =
          controller.selectedCategory == 'Konsultasi';
      final consultantName =
          project.consultationInfo?.consultantName?.trim().isNotEmpty == true
          ? project.consultationInfo?.consultantName!
          : 'Konsultan belum ditentukan';
      final location = project.location?.address?.trim().isNotEmpty == true
          ? project.location!.address!
          : 'Lokasi belum tersedia';

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ProjectInfoCard(
          title: project.name ?? '',
          primaryLine: ProjectInfoLine(
            icon: Icons.person_outline,
            text: consultantName ?? '',
            color: AppColors.neutralDarkest,
          ),
          secondaryLine: ProjectInfoLine(
            icon: Icons.location_on_outlined,
            text: location,
            color: AppColors.neutralMediumLight,
          ),
          ctaLabel: isConsultationCategory ? 'Tanya Konsultan' : null,
          onCtaTap: isConsultationCategory
              ? () => controller.openChatWithConsultant(project)
              : null,
          onTap: () {
            final status = project.status ?? '';
            if (isConsultationCategory &&
                (status == 'ACTIVE' || status == 'COMPLETED')) {
              controller.openConsultationDetails(project);
            } else if (controller.selectedCategory == 'Perizinan') {
              controller.openLicensingDetails(project);
            } else {
              controller.openProjectReview(project);
            }
          },
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

    final tabChild = Scaffold(
      appBar: PkpAppBar(
        title: 'Proyek Saya',
        showNavigation: controller.projectStatus != null,
        backgroundColor: AppColors.primaryDark,
        onLeadingPressed: () {
          if (controller.projectStatus != null) {
            Get.back();
          }
        },
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value && controller.projects.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.error.value != null && controller.projects.isEmpty) {
            return Center(child: Text(controller.error.value?.message ?? ''));
          }

          final projects = controller.projects;
          final category = controller.selectedCategory;
          final statusOptions = _statusOptionsForCategory(category);

          final heading = buildHeading(controller.statusFilter);

          return Column(
            children: [
              if (!isConsultant) _buildCategoryTabsSection(categories),
              if (controller.projectStatus == null &&
                  statusOptions.isNotEmpty) ...[
                const SizedBox(height: 16),
                _buildStatusMenu(context, statusOptions),
              ],
              if (category == 'Konstruksi')
                Expanded(child: _buildFeatureUnavailable())
              else
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
                        if (projects.isEmpty && !controller.isLoading.value)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Belum ada proyek untuk status ini.',
                              style: AppTextStyles.bodyM.copyWith(
                                color: AppColors.neutralMediumLight,
                              ),
                            ),
                          ),
                        ...projects.map(buildProjectCard),
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
    );

    if (isConsultant) {
      return tabChild;
    }

    return DefaultTabController(
      length: categories.length,
      initialIndex: safeInitialIndex,
      child: tabChild,
    );
  }

  Widget _buildStatusMenu(
    BuildContext context,
    List<_ProjectStatusOption> options,
  ) {
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
            final labelColor = isSelected
                ? AppColors.neutralDarkest
                : AppColors.inputBorder;
            final iconColor = isSelected
                ? AppColors.white
                : AppColors.inputBorder;

            return SizedBox(
              width: (MediaQuery.of(context).size.width - 32) / options.length,
              child: FeatureCircleCard(
                label: option.label,
                icon: option.icon,
                labelOutside: true,
                labelStyle: AppTextStyles.bodyS.copyWith(color: labelColor),
                backgroundColor: isSelected
                    ? AppColors.primaryDark
                    : AppColors.primaryLightest,
                iconColor: iconColor,
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
    return Container(
      color: AppColors.primaryDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TabBar(
          onTap: (index) => controller.updateCategory(categories[index]),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.white, width: 2),
            insets: EdgeInsets.symmetric(horizontal: 8),
          ),
          tabAlignment: TabAlignment.fill,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: false,
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.white.withOpacity(0.6),
          labelStyle: AppTextStyles.actionM,
          tabs: categories.map((label) => Tab(text: label)).toList(),
        ),
      ),
    );
  }

  List<_ProjectStatusOption> _statusOptionsForCategory(String category) {
    switch (category) {
      case 'Konsultasi':
        return const [
          _ProjectStatusOption('Sedang Berjalan', 'ACTIVE', Icons.schedule),
          _ProjectStatusOption(
            'Menunggu Konfirmasi',
            'PENDING',
            Icons.hourglass_top_outlined,
          ),
          _ProjectStatusOption(
            'Selesai',
            'COMPLETED',
            Icons.check_circle_outline,
          ),
        ];
      case 'Perizinan':
      case 'Pengawasan':
        return const [
          _ProjectStatusOption('Sedang Berjalan', 'ACTIVE', Icons.schedule),
          _ProjectStatusOption(
            'Selesai',
            'COMPLETED',
            Icons.check_circle_outline,
          ),
        ];
      case 'Konstruksi':
      default:
        return const [];
    }
  }

  Widget _buildFeatureUnavailable() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.inputBorder),
            ),
            child: const Center(
              child: Icon(Icons.close, color: AppColors.inputBorder),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Fitur belum tersedia',
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutralMediumLight,
            ),
          ),
        ],
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

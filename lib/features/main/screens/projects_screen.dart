import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/core/enums/consultation_filter_status.dart';
import 'package:pkp_hub/core/enums/project_type.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';
import 'package:pkp_hub/features/main/widgets/project_info_card.dart';

class ProjectsScreen extends GetView<ProjectsController> {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = Scaffold(
      appBar: const PkpAppBar(title: 'Proyek Saya', showNavigation: false),
      body: SafeArea(
        child: Obx(() {
          final isConsultant = controller.userRole.value == UserRole.consultant;
          final selectedType = controller.selectedType;

          if (selectedType != consultation) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!isConsultant) _buildTabs(projectTypes),
                const SizedBox(height: 16),
                if (selectedType == construction)
                  Expanded(child: _buildFeatureUnavailable())
                else
                  const SizedBox.shrink(),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isConsultant) _buildTabs(projectTypes),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildStatusMenu(selectedType),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    _buildHeading(controller.consultationFilterStatus),
                    style: AppTextStyles.h3,
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: controller.refreshConsultations,
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      if (controller.projects.isEmpty)
                        SliverToBoxAdapter(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                'Belum ada konsultasi.',
                                style: AppTextStyles.bodyM.copyWith(
                                  color: AppColors.neutralMediumLight,
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          sliver: _buildConsultationSliverList(isConsultant),
                        ),
                      if (controller.hasMore && controller.projects.isNotEmpty)
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          ),
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

    return Obx(() {
      final isConsultant = controller.userRole.value == UserRole.consultant;
      if (isConsultant) {
        return content;
      }
      return DefaultTabController(
        length: projectTypes.length,
        initialIndex: 0,
        child: content,
      );
    });
  }

  String _buildHeading(ConsultationFilterStatus? status) {
    switch (status) {
      case consultationFilterWaitingConfirmation:
        return consultationFilterWaitingConfirmation.name;
      case consultationFilterDone:
        return 'Selesai';
      case consultationFilterInProgress:
      default:
        return 'Sedang Berjalan';
    }
  }

  Widget _buildProjectCard(Project? project, bool isConsultant) {
    if (project != null) {
      final homeOwnerName =
          project.consultationInfo?.homeOwnerName?.trim() ?? '-';
      final consultantName =
          project.consultationInfo?.consultantName?.trim() ?? '-';
      final primaryName = isConsultant ? homeOwnerName : consultantName;
      final location = project.city?.trim() ?? '-';
      final buttonText = isConsultant ? 'Tanya Pemilik' : 'Tanya Konsultan';
      final status = (project.consultationInfo?.consultationStatus ?? '')
          .toUpperCase();
      final state = (project.state ?? '').toUpperCase();
      final isWaitingConfirmation =
          controller.consultationFilterStatus ==
              consultationFilterWaitingConfirmation ||
          status == consultationFilterWaitingConfirmation.id ||
          state == 'WAITING_CONFIRMATION' ||
          status == 'MENUNGGU_KONFIRMASI_KONSULTAN';

      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ProjectInfoCard(
          title: project.projectName ?? '',
          primaryLine: ProjectInfoLine(
            icon: Icons.person_outline,
            text: primaryName,
            color: AppColors.neutralDarkest,
          ),
          secondaryLine: ProjectInfoLine(
            icon: Icons.location_on_outlined,
            text: location,
            color: AppColors.neutralMediumLight,
          ),
          buttonText: buttonText,
          onButtonTap: () {
            controller.openChat(project);
          },
          onTap: () {
            if (controller.selectedType == consultation &&
                isWaitingConfirmation &&
                controller.userRole.value == UserRole.consultant) {
              controller.openConsultationConfirmation(project);
            } else if (controller.selectedType == consultation &&
                controller.consultationFilterStatus !=
                    consultationFilterWaitingConfirmation) {
              controller.openConsultationDetails(project);
            }
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildStatusMenu(ProjectType projectType) {
    var statusOptions = [];
    switch (projectType) {
      case consultation:
        statusOptions = [
          _ConsultationStatusOption(
            status: consultationFilterInProgress,
            icon: AppIcons.clock,
            onTap: (status) {
              controller.updateConsultationStatusFilter(status);
            },
          ),
          _ConsultationStatusOption(
            status: consultationFilterWaitingConfirmation,
            icon: AppIcons.hourglass,
            onTap: (status) {
              controller.updateConsultationStatusFilter(status);
            },
          ),
          _ConsultationStatusOption(
            status: consultationFilterDone,
            icon: AppIcons.checkCircle,
            onTap: (status) {
              controller.updateConsultationStatusFilter(status);
            },
          ),
        ];

        break;
      case licensing:
        statusOptions = [
          _ConsultationStatusOption(
            status: consultationFilterInProgress,
            icon: AppIcons.clock,
            onTap: (status) {
              // TODO: Handle status tap
            },
          ),
          _ConsultationStatusOption(
            status: consultationFilterWaitingConfirmation,
            icon: AppIcons.hourglass,
            onTap: (status) {
              // TODO: Handle status tap
            },
          ),
          _ConsultationStatusOption(
            status: consultationFilterDone,
            icon: AppIcons.checkCircle,
            onTap: (status) {
              // TODO: Handle status tap
            },
          ),
        ];

        break;
      case construction:
        return const SizedBox.shrink();
      case monitoring:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: statusOptions.map((option) {
            final isSelected =
                controller.consultationFilterStatus == option.status;
            final count = controller.projectCounts[option.status.id] ?? 0;
            final labelColor = isSelected
                ? AppColors.neutralDarkest
                : AppColors.inputBorder;
            final iconColor = isSelected
                ? AppColors.white
                : AppColors.inputBorder;

            return SizedBox(
              width: 110,
              child: FeatureCircleCard(
                label: option.status.name,
                iconAsset: option.icon,
                labelOutside: true,
                labelStyle: AppTextStyles.bodyM.copyWith(color: labelColor),
                backgroundColor: isSelected
                    ? AppColors.primaryDark
                    : AppColors.primaryLightest,
                iconColor: iconColor,
                badgeColor: AppColors.errorDark,
                badgeValue: count.toString(),
                showBadge: count > 0,
                onTap: () {
                  option.onTap(option.status);
                },
              ),
            );
          }).toList(),
        );
      }),
    );
  }

  Widget _buildTabs(List<ProjectType> projectType) {
    return Container(
      color: AppColors.primaryDark,
      child: TabBar(
        onTap: (index) => controller.updateCategory(projectType[index]),
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
        tabs: projectType.map((category) => Tab(text: category.name)).toList(),
      ),
    );
  }

  Widget _buildFeatureUnavailable() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  SliverList _buildConsultationSliverList(bool isConsultant) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final projects = controller.projects;
        if (index >= projects.length) return null;
        if (index == projects.length - 1 &&
            controller.hasMore &&
            !controller.isLoading.value) {
          controller.loadMoreProjects();
        }
        return _buildProjectCard(projects[index], isConsultant);
      }, childCount: controller.projects.length),
    );
  }
}

class _ConsultationStatusOption {
  const _ConsultationStatusOption({
    required this.status,
    required this.icon,
    required this.onTap,
  });

  final ConsultationFilterStatus status;
  final String icon;
  final Function(ConsultationFilterStatus) onTap;
}

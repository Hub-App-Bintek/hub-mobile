import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_card.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';

class ProjectsScreen extends GetView<ProjectsController> {
  const ProjectsScreen({super.key, this.controllerTag});

  final String? controllerTag;

  @override
  String? get tag => controllerTag;

  @override
  Widget build(BuildContext context) {
    Map<String, List<Project>> groupProjects(List<Project> projects) {
      final Map<String, List<Project>> grouped = {};
      for (var project in projects) {
        grouped.putIfAbsent(project.status ?? '', () => []).add(project);
      }
      return grouped;
    }

    Widget buildProjectCard(Project project) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PkpCard(
          title: project.name ?? '',
          subtitle:
              'Consultant name - ${Formatters.formatTitle(project.status ?? '')}',
          suffixIcon: const Icon(Icons.chevron_right),
          onTap: () {
            controller.openProjectReview(project);
          },
        ),
      );
    }

    Widget buildGroup(String groupName, List<Project> projects) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(groupName, style: AppTextStyles.h1),
          ),
          ...projects.map(buildProjectCard),
        ],
      );
    }

    return Scaffold(
      appBar: PkpAppBar(
        title: "Proyek Anda",
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
          final grouped = groupProjects(controller.projects);
          return RefreshIndicator(
            onRefresh: controller.refreshProjects,
            child: ListView(
              // controller: scrollController,
              children: [
                if (controller.status == null) ...[
                  const SizedBox(height: 16),
                  _buildStatusMenu(context),
                  const SizedBox(height: 16),
                ],
                if (grouped['CREATED']?.isNotEmpty == true)
                  buildGroup('Baru Dibuat', grouped['CREATED']!),
                if (grouped['PENDING']?.isNotEmpty == true)
                  buildGroup('Menunggu Konfirmasi', grouped['PENDING']!),
                if (grouped['ACTIVE']?.isNotEmpty == true)
                  buildGroup('Sedang Berjalan', grouped['ACTIVE']!),
                if (grouped['COMPLETED']?.isNotEmpty == true)
                  buildGroup('Selesai', grouped['COMPLETED']!),
                if (grouped['CANCELLED']?.isNotEmpty == true)
                  buildGroup('Dibatalkan', grouped['CANCELLED']!),
                if (controller.hasMore && controller.isLoading.value)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            ),
          );
        }),
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

    final cardWidth = (MediaQuery.of(context).size.width - 64) / 3;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.spaceBetween,
          children: options.map((option) {
            final isSelected = controller.statusFilter == option.status;
            final backgroundColor = isSelected
                ? AppColors.primaryDarkest.withValues(alpha: 0.08)
                : AppColors.primaryLightest;

            final count = controller.projectCounts[option.status] ?? 0;

            return SizedBox(
              width: cardWidth,
              child: FeatureCircleCard(
                label: option.label,
                icon: option.icon,
                backgroundColor: backgroundColor,
                iconColor: AppColors.primaryDarkest,
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
}

class _ProjectStatusOption {
  const _ProjectStatusOption(this.label, this.status, this.icon);

  final String label;
  final String status;
  final IconData icon;
}

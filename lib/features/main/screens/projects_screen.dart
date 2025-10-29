import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_card.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/features/main/controllers/projects_controller.dart';

class ProjectsScreen extends GetView<ProjectsController> {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final ScrollController scrollController = ScrollController();
    //
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels >=
    //           scrollController.position.maxScrollExtent - 200 &&
    //       !controller.isLoading.value &&
    //       controller.hasMore) {
    //     controller.loadMoreProjects();
    //   }
    // });

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
            controller.checkProjectStatus(project);
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
                if (grouped['IN PROGRESS']?.isNotEmpty == true)
                  buildGroup('In Progress', grouped['IN PROGRESS']!),
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
}

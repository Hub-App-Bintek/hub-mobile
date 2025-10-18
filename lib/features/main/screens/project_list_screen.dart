import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/features/main/controllers/project_list_controller.dart';

class ProjectListScreen extends GetView<ProjectListController> {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !controller.isLoading.value &&
          controller.hasMore) {
        controller.loadMoreProjects();
      }
    });

    Map<String, List<Project>> groupProjects(List<Project> projects) {
      final Map<String, List<Project>> grouped = {};
      for (var project in projects) {
        grouped.putIfAbsent(project.status, () => []).add(project);
      }
      return grouped;
    }

    Widget buildProjectCard(Project project) {
      return Card(
        color: Colors.grey[100],
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: ListTile(
          title: Text(project.name, style: AppTextStyles.h2),
          subtitle: Text(
            Formatters.formatTitle(project.status),
            style: AppTextStyles.bodyM,
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Navigate to project detail
          },
        ),
      );
    }

    Widget buildGroup(String groupName, List<Project> projects) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(groupName, style: AppTextStyles.h1),
          ),
          ...projects.map(buildProjectCard),
        ],
      );
    }

    return Scaffold(
      body: Obx(() {
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
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              if (grouped['ACTIVE'] != null && grouped['ACTIVE']!.isNotEmpty)
                buildGroup('Active', grouped['ACTIVE']!),
              if (grouped['PENDING'] != null && grouped['PENDING']!.isNotEmpty)
                buildGroup('Pending', grouped['PENDING']!),
              if (grouped['COMPLETED'] != null &&
                  grouped['COMPLETED']!.isNotEmpty)
                buildGroup('Completed', grouped['COMPLETED']!),
              if (grouped['CANCELLED'] != null &&
                  grouped['CANCELLED']!.isNotEmpty)
                buildGroup('Canceled', grouped['CANCELLED']!),
              if (grouped['IN PROGRESS'] != null &&
                  grouped['IN PROGRESS']!.isNotEmpty)
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
    );
  }
}

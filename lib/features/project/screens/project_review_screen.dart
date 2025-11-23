import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/data/models/project.dart';

class ProjectReviewScreen extends StatefulWidget {
  const ProjectReviewScreen({super.key});

  @override
  State<ProjectReviewScreen> createState() => _ProjectReviewScreenState();
}

class _ProjectReviewScreenState extends State<ProjectReviewScreen> {
  late final Project? _project;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    if (args is ProjectReviewArgs) {
      _project = args.project;
    } else if (args is Map<String, dynamic>) {
      _project = args['project'] as Project?;
    } else {
      _project = null;
    }
  }

  void _navigateToProjectDetails() {
    final project = _project;
    if (project == null) return;
    Get.toNamed(
      AppRoutes.projectHistory,
      arguments: ProjectDetailsArgs(
        projectId: project.projectId ?? '',
        homeOwnerId: project.consultationInfo?.homeOwnerId,
        homeOwnerName: project.consultationInfo?.homeOwnerName,
        consultantId: project.consultationInfo?.consultantId,
        consultantName: project.consultationInfo?.consultantName,
      ),
    );
  }

  Map<String, dynamic> _projectArguments(Project project) {
    return {
      'projectId': project.projectId,
      'homeOwnerId': project.consultationInfo?.homeOwnerId,
      'homeOwnerName': project.consultationInfo?.homeOwnerName,
      'consultantId': project.consultationInfo?.consultantId,
      'consultantName': project.consultationInfo?.consultantName,
    };
  }

  void _navigateTo(String route) {
    final project = _project;
    if (project == null) return;
    Get.toNamed(route, arguments: _projectArguments(project));
  }

  @override
  Widget build(BuildContext context) {
    if (_project == null) {
      return Scaffold(
        appBar: const PkpAppBar(title: 'Tinjauan Proyek'),
        body: Center(
          child: Text('Proyek tidak ditemukan', style: AppTextStyles.bodyM),
        ),
      );
    }

    return Scaffold(
      appBar: PkpAppBar(
        title: 'Tinjauan Proyek',
        actions: [
          PkpAppBarAction(
            icon: Icons.pending_actions,
            onPressed: _navigateToProjectDetails,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Menu Tinjauan', style: AppTextStyles.h3),
              const SizedBox(height: 12),
              _ReviewMenuGrid(onItemTap: _navigateTo),
              const SizedBox(height: 12),
              // Previous stepper layout (preserved for reference)
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewMenuGrid extends StatelessWidget {
  const _ReviewMenuGrid({required this.onItemTap});

  final ValueChanged<String> onItemTap;

  static final _menuEntries = [
    const _ReviewMenuEntry(
      'Kontrak',
      Icons.document_scanner,
      AppRoutes.projectContracts,
    ),
    const _ReviewMenuEntry(
      'Draft Desain',
      Icons.draw_outlined,
      AppRoutes.projectDraftDesign,
    ),
    const _ReviewMenuEntry(
      'Final Desain',
      Icons.layers_outlined,
      AppRoutes.projectFinalDesign,
    ),
    const _ReviewMenuEntry(
      'Invoice',
      Icons.receipt_long,
      AppRoutes.projectInvoice,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const crossAxisSpacing = 16.0;
    const mainAxisSpacing = 12.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _menuEntries.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = _menuEntries[index];
          return Center(
            child: FeatureCircleCard(
              label: item.label,
              icon: item.icon,
              showBadge: true,
              badgeValue: '5',
              onTap: () => onItemTap(item.route),
            ),
          );
        },
      ),
    );
  }
}

class _ReviewMenuEntry {
  const _ReviewMenuEntry(this.label, this.icon, this.route);

  final String label;
  final IconData icon;
  final String route;
}

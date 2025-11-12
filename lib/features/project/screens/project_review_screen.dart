import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/data/models/project.dart';

class ProjectReviewScreen extends StatefulWidget {
  const ProjectReviewScreen({super.key});

  @override
  State<ProjectReviewScreen> createState() => _ProjectReviewScreenState();
}

class _ProjectReviewScreenState extends State<ProjectReviewScreen> {
  int _currentStep = 0;
  late final Project? _project;

  static const List<_ProjectReviewStep> _steps = [
    _ProjectReviewStep(
      title: 'Konsultasi',
      description:
          'Tinjau proses konsultasi untuk memastikan proposal layanan dan jadwal sudah sesuai.',
      icon: Icons.chat_bubble_outline,
    ),
    _ProjectReviewStep(
      title: 'Perizinan',
      description:
          'Pantau izin yang sedang diajukan dan pastikan dokumen pendukung lengkap.',
      icon: Icons.description,
    ),
    _ProjectReviewStep(
      title: 'Material',
      description:
      'Pembelian material berdasarkan hasil konsultasi atau dilakukan mandiri.',
      icon: Icons.inventory_2_outlined,
    ),
    _ProjectReviewStep(
      title: 'Konstruksi',
      description:
      'Sewa jasa tenaga konstruksi rumah.',
      icon: Icons.construction_outlined,
    ),
    _ProjectReviewStep(
      title: 'Pembiayaan',
      description:
      'Pengajuan pembiayaan kepada Bank dan Lembaga keuangan lain.',
      icon: Icons.account_balance_wallet_outlined,
    ),
    _ProjectReviewStep(
      title: 'Pengawasan',
      description:
          'Susun jadwal pengawasan dan pastikan progres lapangan terlaporkan.',
      icon: Icons.engineering,
    ),
  ];

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      _project = args['project'] as Project?;
    } else {
      _project = null;
    }
  }

  void _navigateToProjectDetails() {
    final project = _project;
    if (project == null) return;
    Get.toNamed(
      AppRoutes.projectDetails,
      arguments: _buildProjectDetailsArgs(project),
    );
  }

  Map<String, dynamic> _buildProjectDetailsArgs(Project project) {
    return {
      'projectId': project.projectId,
      'homeOwnerId': project.homeOwnerId,
      'homeOwnerName': project.homeOwnerName,
      'consultantId': project.consultantId,
      'consultantName': project.consultantName,
    };
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
      appBar: const PkpAppBar(title: 'Tinjauan Proyek'),
      body: SafeArea(
        child: Stepper(
          type: StepperType.vertical,
          physics: const BouncingScrollPhysics(),
          currentStep: _currentStep,
          onStepTapped: (index) {
            setState(() => _currentStep = index);
          },
          controlsBuilder: (_, __) => const SizedBox.shrink(),
          steps: _steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            return Step(
              title: Text(step.title, style: AppTextStyles.h4),
              subtitle: Text(
                step.description,
                style: AppTextStyles.bodyS.copyWith(
                  color: AppColors.neutralDarkest.withOpacity(0.6),
                ),
              ),
              content: _buildStepCard(step),
              isActive: _currentStep >= index,
              state: _currentStep > index
                  ? StepState.complete
                  : StepState.indexed,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildStepCard(_ProjectReviewStep step) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.neutralLight.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(step.icon, color: AppColors.primaryDarkest),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    step.title,
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.primaryDarkest,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              step.description,
              style: AppTextStyles.bodyM.copyWith(
                color: AppColors.neutralDarkest,
              ),
            ),
            const SizedBox(height: 16),
            PkpElevatedButton(
              text: AppStrings.projectDetailsTitle,
              onPressed: _navigateToProjectDetails,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectReviewStep {
  const _ProjectReviewStep({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}

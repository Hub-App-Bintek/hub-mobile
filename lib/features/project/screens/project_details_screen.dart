import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_card.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/data/models/project_history.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/features/project/controllers/project_details_controller.dart';
import 'package:pkp_hub/features/project/widgets/contract_actions_bottom_sheet.dart';
import 'package:pkp_hub/features/project/widgets/survey_schedule_bottom_sheet.dart';

class ProjectDetailsScreen extends GetView<ProjectDetailsController> {
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PkpAppBar(
        title: AppStrings.projectDetailsTitle,
        actions: Icons.cancel,
        onActionPressed: () {
          Get.back();
        },
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.error.value != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.error.value?.message ?? '',
                      style: AppTextStyles.bodyM,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: controller.fetchDetails,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }
          return Column(
            children: [
              _buildStepper(controller.details.value),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: controller.fetchDetails,
                  child: SingleChildScrollView(
                    controller: controller.timelineScrollController,
                    padding: const EdgeInsets.all(16.0),
                    child: _buildTimeline(controller.consultationHistory),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: Obx(() {
        if (controller.shouldShowConsultationConfirmationButtons) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: PkpOutlinedButton(
                    text: 'Tolak Konsultasi',
                    isLoading: controller.rejectConsultationLoading.value,
                    enabled:
                        !(controller.rejectConsultationLoading.value ||
                            controller.acceptConsultationLoading.value),
                    onPressed:
                        (controller.rejectConsultationLoading.value ||
                            controller.acceptConsultationLoading.value)
                        ? null
                        : controller.rejectConsultation,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PkpElevatedButton(
                    text: 'Terima Konsultasi',
                    isLoading: controller.acceptConsultationLoading.value,
                    enabled:
                        !(controller.acceptConsultationLoading.value ||
                            controller.rejectConsultationLoading.value),
                    onPressed:
                        (controller.acceptConsultationLoading.value ||
                            controller.rejectConsultationLoading.value)
                        ? null
                        : controller.acceptConsultation,
                  ),
                ),
              ],
            ),
          );
        }

        // Consultant reschedules when the latest proposed schedule was rejected
        if (controller.shouldShowRescheduleButton) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: PkpElevatedButton(
              text: 'Ajukan Ulang Jadwal',
              enabled: true,
              onPressed: () {
                controller.showBottomSheet(
                  SurveyScheduleBottomSheet(
                    onButtonPressed: (request) {
                      controller.submitRescheduleSurvey(request);
                    },
                  ),
                );
              },
            ),
          );
        }

        // Consultant proposes schedule
        if (controller.shouldShowScheduleButton) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: PkpElevatedButton(
              text: 'Ajukan Jadwal Survey',
              enabled: true,
              onPressed: () {
                controller.showBottomSheet(
                  SurveyScheduleBottomSheet(
                    onButtonPressed: (request) {
                      controller.submitSurveySchedule(request);
                    },
                  ),
                );
              },
            ),
          );
        }

        // Homeowner approves/rejects schedule
        if (controller.shouldShowSurveyScheduleApprovalButtons) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: PkpOutlinedButton(
                    text: 'Tolak Jadwal',
                    isLoading: controller.rejectLoading.value,
                    enabled:
                        !(controller.rejectLoading.value ||
                            controller.approveLoading.value),
                    onPressed:
                        (controller.rejectLoading.value ||
                            controller.approveLoading.value)
                        ? null
                        : () => controller.rejectSurveySchedule(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PkpElevatedButton(
                    text: 'Setuju',
                    isLoading: controller.approveLoading.value,
                    enabled:
                        !(controller.approveLoading.value ||
                            controller.rejectLoading.value),
                    onPressed:
                        (controller.approveLoading.value ||
                            controller.rejectLoading.value)
                        ? null
                        : controller.approveSurveySchedule,
                  ),
                ),
              ],
            ),
          );
        }

        // Consultant marks survey as completed
        if (controller.shouldShowCompleteSurveyButton) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: PkpElevatedButton(
              text: 'Selesaikan Survey',
              isLoading: controller.completeSurveyLoading.value,
              enabled: !controller.completeSurveyLoading.value,
              onPressed: controller.completeSurveyLoading.value
                  ? null
                  : controller.completeSurvey,
            ),
          );
        }

        // Consultant contract actions: download template & upload contract
        if (controller.shouldShowContractActions) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: PkpOutlinedButton(
                    text: 'Unduh Template',
                    isLoading: controller.downloadTemplateLoading.value,
                    enabled:
                        !(controller.downloadTemplateLoading.value ||
                            controller.uploadContractLoading.value),
                    onPressed:
                        (controller.downloadTemplateLoading.value ||
                            controller.uploadContractLoading.value)
                        ? null
                        : () {
                            controller.showBottomSheet(
                              const ContractActionsBottomSheet(
                                isDownload: true,
                              ),
                            );
                          },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PkpElevatedButton(
                    text: 'Unggah Kontrak',
                    isLoading: controller.uploadContractLoading.value,
                    enabled:
                        !(controller.uploadContractLoading.value ||
                            controller.downloadTemplateLoading.value),
                    onPressed:
                        (controller.uploadContractLoading.value ||
                            controller.downloadTemplateLoading.value)
                        ? null
                        : () {
                            controller.showBottomSheet(
                              const ContractActionsBottomSheet(),
                            );
                          },
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      }),
    );
  }

  Widget _buildStepper(ProjectDetailsResponse? details) {
    final steps = <_StepInfo>[];

    if (details?.consultation != null) {
      steps.add(
        _StepInfo(
          label: AppStrings.menuConsultation,
          isCompleted: details?.consultation?.status == 'COMPLETED',
        ),
      );
    }

    if (details?.permit != null) {
      steps.add(
        _StepInfo(
          label: AppStrings.menuLicensing,
          isCompleted: (details?.permit?.isNotEmpty ?? false),
        ),
      );
    }

    if (details?.monitoring != null) {
      steps.add(
        _StepInfo(
          label: AppStrings.menuMonitoring,
          isCompleted: details?.monitoring != null,
        ),
      );
    }

    final firstIncompleteIndex = steps.indexWhere((step) => !step.isCompleted);
    final activeIndex = firstIncompleteIndex == -1
        ? steps.length - 1
        : firstIncompleteIndex;

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: steps.asMap().entries.map((entry) {
          final index = entry.key;
          final step = entry.value;
          final isActive = index == activeIndex;
          return Expanded(
            child: _StepIndicator(
              index: index,
              label: step.label,
              isCompleted: step.isCompleted,
              isActive: isActive,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTimeline(List<ProjectHistory> history) {
    // final history = controller.consultationHistory.value ?? const <ProjectHistory>[];

    if (history.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Belum ada riwayat untuk ditampilkan',
              style: AppTextStyles.bodyS.copyWith(
                color: AppColors.neutralMedium,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: history
          .map(
            (timeline) => PkpCard(
              title: timeline.title ?? '',
              subtitle: timeline.subtitle ?? '',
            ),
          )
          .toList(),
    );
  }
}

class _StepInfo {
  const _StepInfo({required this.label, required this.isCompleted});

  final String label;
  final bool isCompleted;
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({
    required this.index,
    required this.label,
    required this.isCompleted,
    required this.isActive,
  });

  final int index;
  final String label;
  final bool isCompleted;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final Widget icon;
    Color circleColor;

    if (isCompleted) {
      circleColor = AppColors.primaryLightest;
      icon = const Icon(Icons.check, size: 18, color: AppColors.primaryDark);
    } else if (isActive) {
      circleColor = AppColors.primaryDarkest;
      icon = Text(
        '${index + 1}',
        style: AppTextStyles.bodyS.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      );
    } else {
      circleColor = AppColors.neutralLightest;
      icon = Text(
        '${index + 1}',
        style: AppTextStyles.bodyS.copyWith(color: AppColors.neutralMedium),
      );
    }

    final textStyle = isActive
        ? AppTextStyles.bodyS.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.neutralDarkest,
          )
        : AppTextStyles.bodyS.copyWith(color: AppColors.neutralMedium);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
          child: Center(child: icon),
        ),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center, style: textStyle),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_card.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
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
                child: SingleChildScrollView(
                  controller: controller.timelineScrollController,
                  padding: const EdgeInsets.all(16.0),
                  child: _buildTimeline(controller.consultationHistory),
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
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton(
                      onPressed:
                          (controller.rejectConsultationLoading.value ||
                              controller.acceptConsultationLoading.value)
                          ? null
                          : controller.rejectConsultation,
                      child: controller.rejectConsultationLoading.value
                          ? SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          : const Text('Tolak Konsultasi'),
                    ),
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
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton(
                      onPressed:
                          (controller.rejectLoading.value ||
                              controller.approveLoading.value)
                          ? null
                          : () => controller.rejectSurveySchedule(),
                      child: controller.rejectLoading.value
                          ? SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          : const Text('Tolak Jadwal'),
                    ),
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
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton(
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
                      child: controller.downloadTemplateLoading.value
                          ? SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          : const Text('Unduh Template'),
                    ),
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
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: AppColors.primaryDarkest,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '1',
              style: AppTextStyles.bodyS.copyWith(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 4),
        // Show step label under the dot
        Text(AppStrings.menuConsultation, style: AppTextStyles.bodyS),
      ],
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

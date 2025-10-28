import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_card.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/project/controllers/project_details_controller.dart';
import 'package:pkp_hub/data/models/project_history.dart';
import 'package:pkp_hub/core/enums/consultation_status.dart' as cs;

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
                      controller.error.value!.message,
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
          final details = controller.details.value;
          if (details == null) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              _buildStepper(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildTimeline(),
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  Widget _buildStepper() {
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

  Widget _buildTimeline() {
    final history = controller.consultationHistory.value ?? const [];

    if (history.isEmpty) {
      return const PkpCard(
        title: 'Belum ada riwayat konsultasi',
        subtitle: 'Riwayat akan muncul setelah ada aktivitas baru.',
      );
    }

    final children = <Widget>[];
    for (var i = 0; i < history.length; i++) {
      final ProjectHistory h = history[i];
      if (i > 0) children.add(const SizedBox(height: 12));
      final hasFiles =
          (h.attachments?.isNotEmpty == true) || (h.files?.isNotEmpty == true);
      children.add(
        PkpCard(
          title: h.title ?? '-',
          subtitle: _historySubtitle(h),
          actionButton: hasFiles
              ? SizedBox(
                  height: 36,
                  child: OutlinedButton(
                    onPressed: () => controller.onHistoryDownload(h),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Download'),
                  ),
                )
              : null,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  String _historySubtitle(ProjectHistory h) {
    final parts = <String>[];
    if ((h.subtitle ?? '').trim().isNotEmpty) parts.add(h.subtitle!.trim());
    final actor = h.metadata?.actor;
    if ((actor ?? '').trim().isNotEmpty) parts.add('Oleh: ${actor!.trim()}');
    final dt = h.metadata?.dateTime;
    if ((dt ?? '').trim().isNotEmpty) parts.add(dt!.trim());
    // Return empty string if nothing meaningful so the UI only shows the title.
    return parts.isEmpty ? '' : parts.join(' • ');
  }

  // Bottom actions: prefers single "Upload Dokumen" during upload stages, otherwise falls back to consultant approve/reject.
  Widget? _buildBottomButtons() {
    return Obx(() {
      // Use fast synchronous getters that react to Rx changes
      if (controller.canConsultantSetSurveySchedule) {
        return _singleSetSurveyButton();
      }
      if (controller.canConsultantCompleteSurvey) {
        return _singleCompleteSurveyButton();
      }
      if (controller.canHomeownerScheduleApproval) {
        return _homeownerScheduleApprovalButtons();
      }
      if (controller.canConsultantUploadFinalDocs) {
        return _singleUploadFinalDocsButton();
      }
      if (controller.canHomeownerApproveFinalDocs) {
        return _homeownerFinalDocsApprovalButtons();
      }
      if (controller.canConsultantFinalizeConsultation) {
        return _singleFinalizeButton();
      }

      // Fallback: consultant waiting-for-confirmation
      final details = controller.details.value;
      final status = cs.consultationStatusFromString(
        details?.consultation?.status,
      );
      if (status != cs.ConsultationStatus.waitingForConfirmation) {
        return const SizedBox.shrink();
      }
      return FutureBuilder<bool>(
        future: controller.showActionButtons(),
        builder: (context, snapshot) {
          final show = snapshot.data ?? false;
          if (!show) return const SizedBox.shrink();
          return _consultantWaitingButtons();
        },
      );
    });
  }

  Widget _singleSetSurveyButton() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: PkpElevatedButton(
          onPressed: controller.onSetSurveySchedulePressed,
          text: 'Jadwalkan Survey',
          enabled: true,
        ),
      ),
    );
  }

  Widget _singleCompleteSurveyButton() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: PkpElevatedButton(
          onPressed: controller.completeSurvey,
          text: 'Selesaikan Survey',
          enabled: true,
        ),
      ),
    );
  }

  Widget _singleUploadFinalDocsButton() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: PkpElevatedButton(
          onPressed: controller.onUploadFinalDocumentsPressed,
          text: 'Upload Dokumen',
          enabled: true,
        ),
      ),
    );
  }

  Widget _consultantWaitingButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 52,
                child: OutlinedButton(
                  onPressed: controller.rejectConsultation,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryDarkest,
                    side: const BorderSide(color: AppColors.primaryDarkest),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Reject'),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: PkpElevatedButton(
                onPressed: controller.acceptConsultation,
                text: 'Approve',
                enabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeownerScheduleApprovalButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 52,
                child: OutlinedButton(
                  onPressed: controller.rejectSurveyBottomSheet,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryDarkest,
                    side: const BorderSide(color: AppColors.primaryDarkest),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Reject'),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: PkpElevatedButton(
                onPressed: controller.approveSurveySchedule,
                text: 'Approve',
                enabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeownerFinalDocsApprovalButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 52,
                child: OutlinedButton(
                  onPressed: controller.rejectFinalDocumentsBottomSheet,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryDarkest,
                    side: const BorderSide(color: AppColors.primaryDarkest),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Reject'),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: PkpElevatedButton(
                onPressed: controller.approveFinalDocuments,
                text: 'Approve',
                enabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _singleFinalizeButton() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: PkpElevatedButton(
          onPressed: controller.finalizeConsultation,
          text: 'Selesaikan Konsultasi',
          enabled: true,
        ),
      ),
    );
  }
}

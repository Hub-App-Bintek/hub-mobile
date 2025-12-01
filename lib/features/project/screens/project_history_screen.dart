import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_button_size.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/project_history.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/features/project/controllers/project_history_controller.dart';
import 'package:pkp_hub/features/project/widgets/contract_actions_bottom_sheet.dart';
import 'package:pkp_hub/features/project/widgets/project_information_bottom_sheet.dart';
import 'package:pkp_hub/features/project/widgets/survey_schedule_bottom_sheet.dart';
import 'package:pkp_hub/features/project/widgets/upload_design_documents_bottom_sheet.dart';

class ProjectHistoryScreen extends GetView<ProjectHistoryController> {
  const ProjectHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PkpAppBar(
        title: AppStrings.projectDetailsTitle,
        actions: [
          PkpAppBarAction(icon: Icons.chat, onPressed: controller.openChatRoom),
          // PkpAppBarAction(
          //   icon: Icons.cancel,
          //   onPressed: () {
          //     // TODO: Cancel project
          //     Get.back();
          //   },
          // ),
        ],
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
                      child: const Text(AppStrings.retryButton),
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
                    child: _buildTimeline(
                      controller.consultationHistory,
                      controller.details.value,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: Obx(() {
        if (controller.shouldShowConsultationConfirmationButtons) {
          final isBusy =
              controller.rejectConsultationLoading.value ||
              controller.acceptConsultationLoading.value;
          return SafeArea(
            child: PkpBottomActions(
              secondaryText: 'Tolak Konsultasi',
              onSecondaryPressed: controller.rejectConsultation,
              secondaryEnabled: !isBusy,
              secondaryLoading: controller.rejectConsultationLoading.value,
              primaryText: 'Terima Konsultasi',
              onPrimaryPressed: controller.acceptConsultation,
              primaryEnabled: !isBusy,
              primaryLoading: controller.acceptConsultationLoading.value,
            ),
          );
        }

        // Consultant reschedules when the latest proposed schedule was rejected
        if (controller.shouldShowRescheduleButton) {
          return SafeArea(
            child: PkpBottomActions(
              primaryText: 'Ajukan Ulang Jadwal',
              onPrimaryPressed: () {
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
            child: PkpBottomActions(
              secondaryText: 'Lanjut Tanpa Survey',
              onSecondaryPressed: () {},
              primaryText: 'Ajukan Jadwal Survey',
              onPrimaryPressed: () {
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
          final isBusy =
              controller.rejectLoading.value || controller.approveLoading.value;
          return SafeArea(
            child: PkpBottomActions(
              secondaryText: 'Tolak Jadwal',
              onSecondaryPressed: controller.rejectSurveySchedule,
              secondaryEnabled: !isBusy,
              secondaryLoading: controller.rejectLoading.value,
              primaryText: 'Setuju',
              onPrimaryPressed: controller.approveSurveySchedule,
              primaryEnabled: !isBusy,
              primaryLoading: controller.approveLoading.value,
            ),
          );
        }

        // Consultant marks survey as completed
        if (controller.shouldShowCompleteSurveyButton) {
          return SafeArea(
            child: PkpBottomActions(
              primaryText: 'Selesaikan Survey',
              primaryEnabled: !controller.completeSurveyLoading.value,
              primaryLoading: controller.completeSurveyLoading.value,
              onPrimaryPressed: controller.completeSurvey,
            ),
          );
        }

        // Consultant contract actions: download template & upload contract
        if (controller.shouldShowContractActions) {
          final isBusy =
              controller.downloadTemplateLoading.value ||
              controller.uploadContractLoading.value;
          return SafeArea(
            child: PkpBottomActions(
              secondaryText: 'Unduh Template',
              onSecondaryPressed: () {
                controller.showBottomSheet(
                  const ContractActionsBottomSheet(isDownload: true),
                );
              },
              secondaryEnabled: !isBusy,
              secondaryLoading: controller.downloadTemplateLoading.value,
              primaryText: 'Unggah Kontrak',
              onPrimaryPressed: () {
                controller.showBottomSheet(const ContractActionsBottomSheet());
              },
              primaryEnabled: !isBusy,
              primaryLoading: controller.uploadContractLoading.value,
            ),
          );
        }

        // Homeowner approve/reject contract
        if (controller.shouldShowContractApprovalButtons) {
          final isBusy =
              controller.contractRejectLoading.value ||
              controller.contractApproveLoading.value;
          return SafeArea(
            child: PkpBottomActions(
              secondaryText: 'Minta Revisi',
              onSecondaryPressed: controller.rejectContract,
              secondaryEnabled: !isBusy,
              secondaryLoading: controller.contractRejectLoading.value,
              primaryText: 'Setujui Kontrak',
              onPrimaryPressed: controller.approveContract,
              primaryEnabled: !isBusy,
              primaryLoading: controller.contractApproveLoading.value,
            ),
          );
        }

        // New: Sign contract button for both roles depending on partial sign state
        if (controller.shouldShowSignContractButton) {
          return SafeArea(
            child: PkpBottomActions(
              primaryText: 'Tanda Tangan Kontrak',
              primaryEnabled: !controller.signContractLoading.value,
              primaryLoading: controller.signContractLoading.value,
              onPrimaryPressed: controller.signContract,
            ),
          );
        }

        // Consultant request payment action
        if (controller.shouldShowRequestPaymentButton) {
          return SafeArea(
            child: PkpBottomActions(
              primaryText: 'Minta Pembayaran',
              primaryEnabled: !controller.requestPaymentLoading.value,
              primaryLoading: controller.requestPaymentLoading.value,
              onPrimaryPressed: () async {
                controller.showConfirmationDialog(
                  title: 'Konfirmasi',
                  message:
                      'Apakah Anda yakin ingin meminta pembayaran ke pemilik lahan?',
                  confirmText: 'Ya',
                  onConfirm: controller.requestPayment,
                  cancelText: 'Batal',
                  onCancel: () {},
                );
              },
            ),
          );
        }

        // Homeowner payment actions (approve / pay)
        if (controller.shouldShowPaymentButtons) {
          final isBusy = controller.approvePaymentLoading.value;
          return SafeArea(
            child: PkpBottomActions(
              secondaryText: 'Simulasi Pembayaran',
              onSecondaryPressed: controller.goToPaymentPage,
              secondaryEnabled: !isBusy,
              primaryText: 'Lakukan Pembayaran',
              primaryEnabled: !isBusy,
              primaryLoading: isBusy,
              onPrimaryPressed: () async {
                controller.showConfirmationDialog(
                  title: 'Konfirmasi Pembayaran',
                  message:
                      'Apakah Anda ingin melakukan pembayaran? Saldo anda akan ditahan sampai proses konsultasi selesai.',
                  confirmText: 'Ya',
                  onConfirm: controller.approvePayment,
                  cancelText: 'Batal',
                  onCancel: () {},
                );
              },
            ),
          );
        }

        // Homeowner design approval/revision actions when requested
        if (controller.shouldShowDesignApprovalButtons) {
          final isBusy =
              controller.designRejectLoading.value ||
              controller.designApproveLoading.value;
          return SafeArea(
            child: PkpBottomActions(
              secondaryText: 'Minta Revisi',
              onSecondaryPressed: controller.askDesignRevision,
              secondaryEnabled: !isBusy,
              secondaryLoading: controller.designRejectLoading.value,
              primaryText: 'Setujui Desain',
              onPrimaryPressed: controller.approveDesignDocuments,
              primaryEnabled: !isBusy,
              primaryLoading: controller.designApproveLoading.value,
            ),
          );
        }

        // Consultant can upload documents when consultation is active and
        // the first consultation history state is STARTED
        if (controller.shouldShowUploadDocumentsButton) {
          return SafeArea(
            child: PkpBottomActions(
              primaryText: 'Unggah Dokumen',
              primaryEnabled: !controller.uploadDesignDocumentsLoading.value,
              primaryLoading: controller.uploadDesignDocumentsLoading.value,
              onPrimaryPressed: () {
                controller.showBottomSheet(
                  const UploadDesignDocumentsBottomSheet(),
                );
              },
            ),
          );
        }

        if (controller.shouldShowFinalizeActions) {
          return SafeArea(
            child: PkpBottomActions(
              secondaryText: 'Selesai',
              onSecondaryPressed: () {},
              primaryText: 'Lanjut Perizinan',
              onPrimaryPressed: () {},
            ),
          );
        }

        return const SizedBox.shrink();
      }),
    );
  }

  Widget _buildStepper(ProjectDetailsResponse? details) {
    final steps = <_StepInfo>[];

    // if (details?.consultation != null) {
    steps.add(
      _StepInfo(
        label: AppStrings.menuConsultation,
        isCompleted: details?.consultation?.status == 'COMPLETED',
      ),
    );
    // }

    // if (details?.permit != null) {
    steps.add(
      _StepInfo(
        label: AppStrings.menuLicensing,
        isCompleted: (details?.permit?.isNotEmpty ?? false),
      ),
    );
    // }

    // if (details?.monitoring != null) {
    steps.add(
      _StepInfo(
        label: AppStrings.menuMonitoring,
        isCompleted: details?.monitoring != null,
      ),
    );
    // }

    final firstIncompleteIndex = steps.indexWhere((step) => !step.isCompleted);
    final activeIndex = firstIncompleteIndex == -1
        ? steps.length - 1
        : firstIncompleteIndex;

    final stepChildren = <Widget>[];
    const stepFlex = 3;
    const connectorFlex = 1;
    for (var entry in steps.asMap().entries) {
      final index = entry.key;
      final step = entry.value;
      final isActive = index == activeIndex;
      stepChildren.add(
        Expanded(
          flex: stepFlex,
          child: _StepIndicator(
            index: index,
            label: step.label,
            isCompleted: step.isCompleted,
            isActive: isActive,
          ),
        ),
      );
      if (index < steps.length - 1) {
        stepChildren.add(
          Expanded(
            flex: connectorFlex,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Center(
                child: Container(
                  height: 1.2,
                  color: AppColors.neutralLight,
                  // margin: const EdgeInsets.symmetric(horizontal: 4),
                ),
              ),
            ),
          ),
        );
      }
    }

    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: stepChildren,
        ),
      ),
    );
  }

  Widget _buildTimeline(
    List<ProjectHistory> history,
    ProjectDetailsResponse? details,
  ) {
    if (history.isEmpty) {
      return const _TimelineEmptyState();
    }

    final widgets = <Widget>[];
    final lastIndex = history.length - 1;

    for (var i = 0; i < history.length; i++) {
      final item = history[i];
      final actorRole = UserRole.fromString(item.metadata?.actor);
      final isRightAligned = _isRightAligned(actorRole);
      final isLatest = i == lastIndex;
      final action = controller.timelineActionFor(item);
      final projectInfoAction = (i == 0 && details != null)
          ? () => _showProjectInfo(details)
          : null;

      widgets.add(
        _TimelineItem(
          isRightAligned: isRightAligned,
          child: _TimelineBubble(
            title: item.title ?? '-',
            body: _buildBodyText(item),
            roleLabel: _roleLabel(actorRole),
            timestamp: _formatTimelineTimestamp(item.metadata?.dateTime),
            isLatest: isLatest,
            isRightAligned: isRightAligned,
            action: action,
            onProjectInfoTap: projectInfoAction,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widgets,
    );
  }

  bool _isRightAligned(UserRole role) {
    return role == UserRole.consultant;
  }

  String _roleLabel(UserRole role) {
    switch (role) {
      case UserRole.consultant:
        return AppStrings.roleConsultant;
      case UserRole.homeowner:
        return AppStrings.roleHomeowner;
      default:
        return AppStrings.roleUnknown;
    }
  }

  String? _buildBodyText(ProjectHistory history) {
    final subtitle = history.subtitle?.trim() ?? '';
    if (subtitle.isNotEmpty) return subtitle;
    final notes = history.metadata?.notes?.trim() ?? '';
    return notes.isNotEmpty ? notes : null;
  }

  String _formatTimelineTimestamp(String? isoDateTime) {
    final formatted = Formatters.formatIsoDateTime(
      isoDateTime,
      joiner: ' · ',
      appendWib: true,
    );
    return formatted ?? '';
  }

  void _showProjectInfo(ProjectDetailsResponse details) {
    controller.showBottomSheet(
      ProjectInformationBottomSheet(
        projectName: details.name ?? '-',
        locationDetail: details.locationDetail,
        landArea: details.landArea,
        latitude: details.latitude,
        longitude: details.longitude,
        createdAt: details.createdAt,
        homeOwnerName: controller.homeOwnerName,
      ),
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
      circleColor = AppColors.neutralLighter;
      icon = Text(
        '${index + 1}',
        style: AppTextStyles.bodyS.copyWith(color: AppColors.white),
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

class _TimelineEmptyState extends StatelessWidget {
  const _TimelineEmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: AppColors.neutralLightest,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.chat_bubble_outline,
              color: AppColors.neutralMedium,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.consultationTimelineEmpty,
            style: AppTextStyles.bodyM.copyWith(color: AppColors.neutralMedium),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.isRightAligned, required this.child});

  final bool isRightAligned;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bubbleWidth = constraints.maxWidth * 0.85;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: isRightAligned
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              SizedBox(
                width: bubbleWidth,
                child: Align(
                  alignment: isRightAligned
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TimelineBubble extends StatelessWidget {
  const _TimelineBubble({
    required this.title,
    required this.roleLabel,
    required this.timestamp,
    required this.isLatest,
    required this.isRightAligned,
    this.body,
    this.action,
    this.onProjectInfoTap,
  });

  final String title;
  final String roleLabel;
  final String timestamp;
  final bool isLatest;
  final bool isRightAligned;
  final String? body;
  final TimelineActionConfig? action;
  final VoidCallback? onProjectInfoTap;

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isRightAligned
        ? AppColors.primaryLightest
        : AppColors.white;
    final borderColor = isLatest
        ? AppColors.primaryDark
        : AppColors.neutralLight;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16),
          topRight: const Radius.circular(16),
          bottomLeft: Radius.circular(isRightAligned ? 16 : 4),
          bottomRight: Radius.circular(isRightAligned ? 4 : 16),
        ),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RoleChip(label: roleLabel, isRightAligned: isRightAligned),
          if (timestamp.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              timestamp,
              style: AppTextStyles.bodyXS.copyWith(
                color: AppColors.neutralMedium,
              ),
            ),
          ],
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutralDarkest,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (body != null) ...[
            const SizedBox(height: 8),
            Text(
              body!,
              style: AppTextStyles.bodyS.copyWith(color: AppColors.neutralDark),
            ),
          ],
          if (action != null) ...[
            const SizedBox(height: 12),
            _TimelineActionButton(config: action!),
          ],
          if (onProjectInfoTap != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: PkpOutlinedButton(
                size: PkpButtonSize.medium,
                text: AppStrings.consultationTimelineProjectInfo,
                onPressed: onProjectInfoTap,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _RoleChip extends StatelessWidget {
  const _RoleChip({required this.label, required this.isRightAligned});

  final String label;
  final bool isRightAligned;

  @override
  Widget build(BuildContext context) {
    final background = isRightAligned
        ? AppColors.primaryDark
        : AppColors.neutralMedium;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodyXS.copyWith(color: AppColors.white),
      ),
    );
  }
}

class _TimelineActionButton extends StatelessWidget {
  const _TimelineActionButton({required this.config});

  final TimelineActionConfig config;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PkpOutlinedButton(
        text: config.label,
        size: PkpButtonSize.medium,
        isLoading: config.isLoading,
        onPressed: config.isLoading ? null : config.onPressed,
        // style: OutlinedButton.styleFrom(
        //   padding: const EdgeInsets.symmetric(vertical: 10),
        //   side: const BorderSide(color: AppColors.primaryDark),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ),
        // child: config.isLoading
        //     ? const SizedBox(
        //         width: 16,
        //         height: 16,
        //         child: CircularProgressIndicator(
        //           strokeWidth: 2,
        //           color: AppColors.primaryDark,
        //         ),
        //       )
        //     : Text(
        //         config.label,
        //         style: AppTextStyles.bodyS.copyWith(
        //           color: AppColors.primaryDark,
        //           fontWeight: FontWeight.w600,
        //         ),
        //       ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/empty_placeholder.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/stepper_indicator.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/features/licensing/controllers/licensing_details_controller.dart';
import 'package:pkp_hub/features/main/widgets/project_item.dart';

class LicensingDetailsScreen extends GetView<LicensingDetailsController> {
  const LicensingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: 'Perizinan'),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value &&
              controller.permitStatus.value == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final stage = controller.selectedStage.value;
          final hasDocument = controller.hasDocument;
          return RefreshIndicator(
            onRefresh: controller.fetchPermitStatus,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 16),
                _buildStageMenu(context, stage),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(_stageTitle(stage), style: AppTextStyles.h3),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildContent(stage, hasDocument),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: SafeArea(
        child: Obx(() {
          final hasDocument = controller.hasDocument;
          if (hasDocument ||
              controller.selectedStage.value != LicensingStage.documents) {
            return const SizedBox.shrink();
          }
          return PkpBottomActions(
            primaryText: 'Upload Dokumen',
            onPrimaryPressed: () {},
          );
        }),
      ),
    );
  }

  Widget _buildStageMenu(BuildContext context, LicensingStage selectedStage) {
    const stages = [
      _StageOption(
        label: 'Dokumen Pendukung',
        icon: AppIcons.documentFinal,
        value: LicensingStage.documents,
      ),
      _StageOption(
        label: 'Status',
        icon: AppIcons.hourglass,
        value: LicensingStage.status,
      ),
      _StageOption(
        label: 'Hasil',
        icon: AppIcons.checkCircle,
        value: LicensingStage.result,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: stages
            .map(
              (stage) => Expanded(
                child: Center(
                  child: FeatureCircleCard(
                    label: stage.label,
                    labelOutside: true,
                    labelStyle: AppTextStyles.bodyS.copyWith(
                      color: selectedStage == stage.value
                          ? AppColors.neutralDarkest
                          : AppColors.neutralMediumLight,
                    ),
                    iconAsset: stage.icon,
                    iconColor: selectedStage == stage.value
                        ? AppColors.white
                        : AppColors.inputBorder,
                    backgroundColor: selectedStage == stage.value
                        ? AppColors.primaryDark
                        : AppColors.primaryLightest,
                    onTap: () => controller.selectStage(stage.value),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  String _stageTitle(LicensingStage stage) {
    switch (stage) {
      case LicensingStage.documents:
        return 'Dokumen Pendukung';
      case LicensingStage.status:
        return 'Status';
      case LicensingStage.result:
        return 'Hasil';
    }
  }

  Widget _buildContent(LicensingStage stage, bool hasDocument) {
    if (stage == LicensingStage.status) {
      final steps = controller.steps;
      return ListView.builder(
        itemCount: steps.length,
        itemBuilder: (_, index) {
          final step = steps[index];
          final isFirst = index == 0;
          final isLast = index == steps.length - 1;

          return _StatusTimelineItem(
            isFirst: isFirst,
            isLast: isLast,
            isCompleted: step.isCompleted,
            child: ProjectItem(
              title: step.title,
              content: step.subtitle,
              date: step.date,
              status: ProjectItemStatus.none,
            ),
          );
        },
      );
    }

    if (stage == LicensingStage.documents) {
      if (!hasDocument) {
        return const Center(
          child: EmptyPlaceholder(message: 'Belum ada dokumen yang diupload'),
        );
      }

      // Now, we build the list from the controller's `documents` state
      return Obx(() {
        return ListView.builder(
          itemCount: controller.documents.length,
          itemBuilder: (_, index) {
            // The controller already prepared the ProjectItem for us
            return controller.documents[index];
          },
        );
      });
    }

    if (stage == LicensingStage.result) {
      return Obx(() {
        return ListView.builder(
          itemCount: controller.results.length,
          itemBuilder: (_, index) {
            // The controller already prepared the ProjectItem for us
            return controller.results[index];
          },
        );
      });
    }

    return ListView(
      children: const [
        ProjectItem(
          title: 'Title',
          content: 'Content',
          date: '01 Des 2025',
          status: ProjectItemStatus.awaitingApproval,
        ),
      ],
    );
  }
}

class _StageOption {
  const _StageOption({
    required this.label,
    required this.icon,
    required this.value,
  });

  final String label;
  final String icon;
  final LicensingStage value;
}

class _StatusTimelineItem extends StatelessWidget {
  const _StatusTimelineItem({
    required this.child,
    required this.isFirst,
    required this.isLast,
    required this.isCompleted,
  });

  final Widget child;
  final bool isFirst;
  final bool isLast;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepperIndicator(
            isFirst: isFirst,
            isLast: isLast,
            state: isCompleted ? StepperState.completed : StepperState.pending,
            connectorExtent: 12,
            indicatorSize: 24,
            fillAvailableHeight: true,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/empty_placeholder.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_details_controller.dart';
import 'package:pkp_hub/features/consultation/screens/sheets/choose_contract_bottom_sheet.dart';
import 'package:pkp_hub/features/consultation/screens/sheets/choose_design_bottom_sheet.dart';
import 'package:pkp_hub/features/consultation/screens/sheets/choose_payment_terms_sheet.dart';
import 'package:pkp_hub/features/consultation/widgets/cancel_consultation_bottom_sheet.dart';
import 'package:pkp_hub/features/main/widgets/project_item.dart';

class ConsultationDetailsScreen extends GetView<ConsultationDetailsController> {
  const ConsultationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(
          () => PkpAppBar(
            title: controller.project.value?.projectName?.trim() ?? 'Proyek',
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          final selectedStep = controller.selectedStep;
          final currentStep = selectedStep.value;
          final sectionTitle = controller.sectionTitle(currentStep);
          final consultation = controller.consultation.value;
          final consultantName = consultation?.consultantName?.trim() ?? '';
          final homeOwnerName = consultation?.homeOwnerName?.trim() ?? '';
          final consultationStatus = consultation?.status?.trim() ?? '';

          if (controller.isLoading.value && consultation == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: controller.handleRefresh,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildConsultationState(
                    currentStep,
                    controller.selectStep,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildConsultantCard(
                    consultantName,
                    homeOwnerName,
                    consultationStatus,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildSectionTitle(sectionTitle),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStepContent(currentStep, consultantName),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: SafeArea(child: _buildBottomAction(context)),
    );
  }

  Widget _buildConsultationState(
    ConsultationDetailStep state,
    ValueChanged<ConsultationDetailStep> onStateSelected,
  ) {
    final contractCount = controller.contracts.length;
    final draftCount = controller.draftDesigns.length;
    final finalCount = controller.finalDesigns.length;
    final invoiceCount = controller.invoices.length;
    final isPaid =
        controller.consultation.value?.consultationType == 'BERBAYAR';

    final states = [
      (
        label: 'Kontrak',
        icon: Icons.description_outlined,
        step: ConsultationDetailStep.contract,
        badge: contractCount,
      ),
      (
        label: 'Draft Desain',
        icon: Icons.insert_drive_file_outlined,
        step: ConsultationDetailStep.draftDesign,
        badge: draftCount,
      ),
      (
        label: 'Final Desain',
        icon: Icons.file_copy_outlined,
        step: ConsultationDetailStep.finalDesign,
        badge: finalCount,
      ),
      if (isPaid)
        (
          label: 'Invoice',
          icon: Icons.receipt_long_outlined,
          step: ConsultationDetailStep.invoice,
          badge: invoiceCount,
        ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: states
          .map(
            (item) => Expanded(
              child: Center(
                child: FeatureCircleCard(
                  label: item.label,
                  labelOutside: true,
                  labelStyle: AppTextStyles.bodyM.copyWith(
                    color: AppColors.neutralDarkest,
                  ),
                  icon: item.icon,
                  iconColor: state == item.step
                      ? AppColors.white
                      : AppColors.neutralMediumLight,
                  backgroundColor: state == item.step
                      ? AppColors.primaryDark
                      : AppColors.inputSurface,
                  onTap: () => onStateSelected(item.step),
                  showBadge: (item.badge) > 0,
                  badgeValue: item.badge > 0 ? '${item.badge}' : null,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildConsultantCard(
    String consultantName,
    String homeOwnerName,
    String consultationStatus,
  ) {
    final initial = consultantName.isNotEmpty
        ? consultantName.characters.first.toUpperCase()
        : 'C';
    final avatarUrl = controller.consultation.value?.consultantId?.toString();

    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.inputSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Row(
          children: [
            _Avatar(initial: initial, imageUrl: avatarUrl),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.isConsultant ? homeOwnerName : consultantName,
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.neutralDarkest,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    consultationStatus.replaceAll('_', ' ').capitalizeFirst ??
                        '',
                    style: AppTextStyles.bodyS.copyWith(
                      color: AppColors.neutralMediumLight,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                controller.startChatWithConsultant();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.primaryDark,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.chat,
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent(
    ConsultationDetailStep currentStep,
    String consultantName,
  ) {
    switch (currentStep) {
      case ConsultationDetailStep.contract:
        return _buildContractsSection(consultantName);
      case ConsultationDetailStep.draftDesign:
        return _buildDraftContractSection();
      case ConsultationDetailStep.finalDesign:
        return _buildFinalDesignSection();
      case ConsultationDetailStep.invoice:
        if (controller.consultation.value?.consultationType != 'BERBAYAR') {
          return _buildEmptyState(message: 'Tidak ada invoice');
        }
        return _buildInvoiceSection();
    }
  }

  Widget _buildContractsSection(String consultantName) {
    if (controller.contracts.isEmpty) {
      return Center(
        child: _buildEmptyState(message: 'Belum ada kontrak yang tersedia'),
      );
    }

    return Column(
      children: controller.contracts
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildContractCard(item, consultantName),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDraftContractSection() {
    if (controller.draftDesigns.isEmpty) {
      return _buildEmptyState(message: 'Belum ada draft desain yang diunggah');
    }

    return Column(
      children: controller.draftDesigns
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildDesignCard(item),
            ),
          )
          .toList(),
    );
  }

  Widget _buildFinalDesignSection() {
    if (controller.finalDesigns.isEmpty) {
      return _buildEmptyState(message: 'Belum ada desain final yang tersedia');
    }

    return Column(
      children: controller.finalDesigns
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildDesignCard(item),
            ),
          )
          .toList(),
    );
  }

  Widget _buildInvoiceSection() {
    if (controller.invoices.isEmpty) {
      return _buildEmptyState(message: 'Belum ada invoice');
    }

    return Column(
      children: controller.invoices
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildInvoiceCard(item),
            ),
          )
          .toList(),
    );
  }

  Widget _buildContractCard(
    ConsultationContractItem contract,
    String consultantName,
  ) {
    return ProjectItem(
      title: contract.title,
      content: 'Diupload ${contract.dateLabel}',
      date: contract.version,
      status: _mapContractStatus(contract.status),
      onDownloadTap: () => controller.downloadContract(contract),
    );
  }

  Widget _buildDesignCard(ConsultationDesignItem design) {
    return ProjectItem(
      title: design.title,
      content: 'Diupload ${design.dateLabel}',
      date: 'v${design.version}',
      status: _mapDesignStatus(design.status),
      onDownloadTap: () => controller.downloadDesign(design),
    );
  }

  Widget _buildSectionTitle(String title) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        style: AppTextStyles.h2.copyWith(color: AppColors.neutralDarkest),
      ),
    );
  }

  Widget _buildEmptyState({required String message}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(child: EmptyPlaceholder(message: message)),
    );
  }

  Widget _buildApprovalActions({
    required VoidCallback onApprove,
    required VoidCallback onReject,
    bool canRequestRevision = true,
  }) {
    if (!canRequestRevision) {
      return PkpBottomActions(
        primaryText: 'Setujui',
        onPrimaryPressed: onApprove,
      );
    }
    return PkpBottomActions(
      secondaryText: 'Minta Revisi',
      onSecondaryPressed: onReject,
      primaryText: 'Setujui',
      onPrimaryPressed: onApprove,
    );
  }

  Widget _buildCancelConsultation() {
    if (controller.userRole.value == UserRole.consultant) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: _showCancelConsultationSheet,
        child: Text(
          'Batalkan Konsultasi',
          style: AppTextStyles.actionM.copyWith(color: AppColors.errorDark),
        ),
      ),
    );
  }

  void _showCancelConsultationSheet() {
    controller.showBottomSheet(
      CancelConsultationBottomSheet(
        onSubmit: (reason) =>
            controller.cancelConsultation(reason, onSuccess: Get.back),
        isLoading: controller.isCancellingConsultation,
      ),
    );
  }

  Widget _buildInvoiceCard(ConsultationInvoiceItem item) {
    final isPaid = item.status == InvoiceStatus.paid;

    return ProjectItem(
      title: item.title,
      content: Formatters.currency(item.amount),
      date: item.dateLabel,
      status: isPaid ? ProjectItemStatus.paid : ProjectItemStatus.unpaid,
      onTap: () {
        if (controller.userRole.value == UserRole.consultant) {
          return;
        }

        if (isPaid) {
          controller.navigateTo(
            AppRoutes.paymentReceipt,
            arguments: PaymentArgs(amount: item.amount, method: item.method),
          );
        } else {
          controller.navigateTo(
            AppRoutes.payment,
            arguments: PaymentArgs(amount: item.amount, method: item.method),
          );
        }
      },
    );
  }

  ProjectItemStatus _mapContractStatus(ContractStatus status) {
    switch (status) {
      case ContractStatus.needApproval:
        return ProjectItemStatus.awaitingApproval;
      case ContractStatus.needRevision:
        return ProjectItemStatus.revisionRequired;
      case ContractStatus.approved:
      case ContractStatus.homeownerSigned:
      case ContractStatus.consultantSigned:
        return ProjectItemStatus.approved;
      case ContractStatus.signed:
        return ProjectItemStatus.signed;
      case ContractStatus.unknown:
        return ProjectItemStatus.awaitingApproval;
    }
  }

  ProjectItemStatus _mapDesignStatus(DesignStatus status) {
    switch (status) {
      case DesignStatus.awaitingApproval:
        return ProjectItemStatus.awaitingApproval;
      case DesignStatus.needsRevision:
        return ProjectItemStatus.revisionRequired;
      case DesignStatus.approved:
        return ProjectItemStatus.approved;
    }
  }

  void _showChooseContractSheet() {
    controller.showBottomSheet(
      ChooseContractBottomSheet(
        contractController: controller.contractController,
        isUploading: controller.isUploadingContract,
        selectedContractPath: controller.selectedContractPath,
        onPickFile: controller.pickContractFileCustom,
        onSubmit: () async {
          if (!controller.canSubmitContractUpload()) return;
          if (controller.isPaidConsultation) {
            Get.back();
            _showPaymentTermsSheet(onSubmit: controller.submitContractDraft);
          } else {
            await controller.submitContractDraft();
          }
        },
      ),
    );
  }

  void _showPaymentTermsSheet({required VoidCallback onSubmit}) {
    controller.showBottomSheet(
      ChoosePaymentTermsSheet(
        contractValueController: controller.contractValueController,
        termAmountControllers: controller.termAmountControllers,
        termDueDateControllers: controller.termDueDateControllers,
        isPaymentTermsValid: controller.isPaymentTermsValid,
        loadingFlag: controller.isUploadingContract,
        onPickDate: controller.selectTermDueDate,
        onSubmit: onSubmit,
      ),
    );
  }

  void _showChooseDesignSheet() {
    controller.showBottomSheet(
      ChooseDesignBottomSheet(
        draftFileControllers: controller.designFileControllers,
        isFormValid: controller.isDesignFormValid,
        onPickFile: (idx) => controller.pickDesignFile(idx),
        loading: controller.isUploadingDesign,
        onSubmit: controller.submitDesignsDraft,
      ),
    );
  }

  Widget _buildBottomAction(BuildContext context) {
    return Obx(() {
      final isConsultant = controller.userRole.value == UserRole.consultant;
      final step = controller.selectedStep.value;
      if (step == ConsultationDetailStep.contract) {
        return _buildContractBottomActions(isConsultant);
      }
      if (step == ConsultationDetailStep.draftDesign) {
        return _buildDesignBottomActions(isConsultant);
      }
      return const SizedBox.shrink();
    });
  }

  Widget _buildContractBottomActions(bool isConsultant) {
    final hasContracts = controller.contracts.isNotEmpty;
    final lastContract = hasContracts ? controller.contracts.last : null;
    final lastStatus = lastContract?.status;
    final isAwaitingApproval = lastStatus == ContractStatus.needApproval;
    final isApproved = lastStatus == ContractStatus.approved;
    final homeownerSigned = lastStatus == ContractStatus.homeownerSigned;
    final consultantSigned = lastStatus == ContractStatus.consultantSigned;
    final isSigned = lastStatus == ContractStatus.signed;

    if (hasContracts && lastStatus == ContractStatus.unknown) {
      return const SizedBox.shrink();
    }
    if (isConsultant && isAwaitingApproval) {
      return const SizedBox.shrink();
    }
    if (isSigned) {
      return const SizedBox.shrink();
    }

    final isPendingSign = isApproved || homeownerSigned || consultantSigned;
    final shouldConsultantSign =
        isConsultant && (isApproved || homeownerSigned);
    final shouldHomeOwnerSign =
        !isConsultant && (isApproved || consultantSigned);
    final hasPendingContractSign = shouldConsultantSign || shouldHomeOwnerSign;

    if (hasPendingContractSign) {
      return PkpBottomActions(
        primaryText: 'Tandatangani Kontrak',
        onPrimaryPressed: controller.signLatestContract,
      );
    }

    final canCancel = !isSigned && !isConsultant;
    final revisionAttemptsContract = controller.revisionAttemptsUsed;
    final canRequestRevision =
        revisionAttemptsContract <
        ConsultationDetailsController.maxRevisionAttempts;
    final hasPendingContractApproval = isAwaitingApproval && !isConsultant;

    if (isConsultant && !controller.hasUploadedContract.value) {
      return PkpBottomActions(
        secondaryText: 'Unduh Template',
        onSecondaryPressed: () {
          if (controller.isPaidConsultation) {
            _showPaymentTermsSheet(
              onSubmit: controller.downloadContractTemplate,
            );
          } else {
            controller.downloadContractTemplate();
          }
        },
        primaryText: 'Unggah Kontrak',
        onPrimaryPressed: _showChooseContractSheet,
      );
    }

    if (hasPendingContractApproval && canCancel) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildApprovalActions(
            onApprove: controller.approveLatestContract,
            onReject: controller.reviseLatestContract,
            canRequestRevision: canRequestRevision,
          ),
          _buildCancelConsultation(),
        ],
      );
    }

    if (canCancel) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: _buildCancelConsultation(),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildDesignBottomActions(bool isConsultant) {
    final lastDraft = controller.draftDesigns.isNotEmpty
        ? controller.draftDesigns.last
        : null;
    final isApprovedSigned =
        controller.contracts.isNotEmpty &&
        controller.contracts.last.status == ContractStatus.signed;
    final needsDraftUpload =
        controller.draftDesigns.isEmpty ||
        lastDraft?.status == DesignStatus.needsRevision;
    final showDraftUploadCta =
        isApprovedSigned && needsDraftUpload && isConsultant;
    final isDraftAwaitingApproval =
        lastDraft?.status == DesignStatus.awaitingApproval && !isConsultant;
    final revisionAttemptsDesign = controller.designRevisionAttemptsUsed;
    final canRequestDesignRevision =
        revisionAttemptsDesign <
        ConsultationDetailsController.maxRevisionAttempts;

    if (showDraftUploadCta) {
      return PkpBottomActions(
        primaryText: 'Unggah Draft Desain',
        onPrimaryPressed: () {
          _showChooseDesignSheet();
        },
      );
    }

    if (isDraftAwaitingApproval) {
      return _buildApprovalActions(
        onApprove: controller.approveLatestDesign,
        onReject: controller.reviseLatestDesign,
        canRequestRevision: canRequestDesignRevision,
      );
    }

    if (lastDraft?.status == DesignStatus.needsRevision && isConsultant) {
      return PkpBottomActions(
        primaryText: 'Unggah Revisi Desain',
        onPrimaryPressed: () {
          _showChooseDesignSheet();
        },
      );
    }

    return const SizedBox.shrink();
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.initial, this.imageUrl});

  final String initial;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 48,
        height: 48,
        color: AppColors.primaryDark,
        child: imageUrl != null && imageUrl?.isNotEmpty == true
            ? Image.network(
                imageUrl ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _fallback(),
              )
            : _fallback(),
      ),
    );
  }

  Widget _fallback() {
    return Center(
      child: Text(
        initial,
        style: AppTextStyles.h4.copyWith(color: AppColors.white),
      ),
    );
  }
}

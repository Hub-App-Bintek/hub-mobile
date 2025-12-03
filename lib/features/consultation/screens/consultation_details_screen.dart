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
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_details_controller.dart';
import 'package:pkp_hub/features/main/widgets/project_item.dart';

class ConsultationDetailsScreen extends GetView<ConsultationDetailsController> {
  const ConsultationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedStep = controller.selectedStep;
    final consultantName =
        controller.project.consultationInfo?.consultantName?.trim() ??
        'Konsultan';

    return Scaffold(
      appBar: PkpAppBar(title: controller.project.name?.trim() ?? 'Proyek'),
      body: SafeArea(
        child: Obx(() {
          final currentStep = selectedStep.value;
          final sectionTitle = controller.sectionTitle(currentStep);
          return Column(
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
                child: _buildConsultantCard(consultantName),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildSectionTitle(sectionTitle),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_buildStepContent(currentStep, consultantName)],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: SafeArea(child: _buildBottomBar(context)),
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

  Widget _buildConsultantCard(String consultantName) {
    final initial = consultantName.isNotEmpty
        ? consultantName.characters.first.toUpperCase()
        : 'I';
    final avatarUrl = controller.project.consultationInfo?.consultantId
        ?.toString();

    return Container(
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
                  consultantName,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.neutralDarkest,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Consultant Speciality',
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
      content: consultantName,
      date: contract.dateLabel,
      status: _mapContractStatus(contract.status),
      onDownloadTap: () => controller.downloadContract(contract),
    );
  }

  Widget _buildDesignCard(ConsultationDocumentItem item) {
    return ProjectItem(
      title: item.title,
      content: 'Diupload ${item.dateLabel}',
      date: item.dateLabel,
      status: _mapDesignStatus(item.status),
      onDownloadTap: () => controller.downloadDesign(item),
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
  }) {
    return PkpBottomActions(
      secondaryText: 'Minta Revisi',
      onSecondaryPressed: onReject,
      primaryText: 'Setujui',
      onPrimaryPressed: onApprove,
    );
  }

  Widget _buildCancelConsultation() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Batalkan Konsultasi',
          style: AppTextStyles.actionM.copyWith(color: AppColors.errorDark),
        ),
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
      case ContractStatus.awaitingApproval:
        return ProjectItemStatus.awaitingApproval;
      case ContractStatus.needsRevision:
        return ProjectItemStatus.revisionRequired;
      case ContractStatus.approvedNeedSign:
        return ProjectItemStatus.approved;
      case ContractStatus.approvedSigned:
        return ProjectItemStatus.signed;
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

  void _showUploadContractSheet(BuildContext context) {
    controller.showBottomSheet(
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PkpAppBar(
                title: 'Termin Pembayaran',
                leading: Icons.close_rounded,
                backgroundColor: AppColors.white,
                titleTextColor: AppColors.neutralDarkest,
                leadingColor: AppColors.neutralDarkest,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PkpTextFormField(
                  controller: controller.contractController,
                  labelText: 'Dokumen Kontrak',
                  hintText: 'Pilih Dokumen Kontrak',
                  type: PkpTextFormFieldType.filePicker,
                  customPickFile: controller.pickContractFileCustom,
                  allowedFileLabel: 'PDF (Maks 5MB)',
                  filePickerType: PkpFilePickerType.pdf,
                  allowedFileExtensions: const ['pdf'],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: PkpBottomActions(
                  primaryText: 'Submit',
                  onPrimaryPressed: () {
                    controller.submitContractUpload();
                    Get.back();
                    Future.microtask(() {
                      final ctx = Get.context;
                      if (ctx != null) _showPaymentTermsSheet(ctx);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentTermsSheet(BuildContext context) {
    controller.showBottomSheet(
      SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxHeight = constraints.maxHeight * 0.95;
            return SizedBox(
              height: maxHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PkpAppBar(
                    title: 'Termin Pembayaran',
                    leading: Icons.close_rounded,
                    backgroundColor: AppColors.white,
                    titleTextColor: AppColors.neutralDarkest,
                    leadingColor: AppColors.neutralDarkest,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPaymentTermSection(
                            title: 'Termin 1',
                            amountController:
                                controller.termAmountControllers[0],
                            dueDateController:
                                controller.termDueDateControllers[0],
                            onPickDate: () => controller.selectTermDueDate(0),
                          ),
                          const SizedBox(height: 16),
                          _buildPaymentTermSection(
                            title: 'Termin 2',
                            amountController:
                                controller.termAmountControllers[1],
                            dueDateController:
                                controller.termDueDateControllers[1],
                            onPickDate: () => controller.selectTermDueDate(1),
                          ),
                          const SizedBox(height: 16),
                          _buildPaymentTermSection(
                            title: 'Termin 3',
                            amountController:
                                controller.termAmountControllers[2],
                            dueDateController:
                                controller.termDueDateControllers[2],
                            onPickDate: () => controller.selectTermDueDate(2),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                  PkpBottomActions(
                    primaryText: 'Submit',
                    onPrimaryPressed: () {
                      controller.submitPaymentTerms();
                      Get.back();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showUploadDraftSheet(BuildContext context) {
    controller.showBottomSheet(
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PkpAppBar(
                title: 'Upload Draft Desain',
                leading: Icons.close_rounded,
                backgroundColor: AppColors.white,
                titleTextColor: AppColors.neutralDarkest,
                leadingColor: AppColors.neutralDarkest,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDraftUploadField(
                      label: 'Dokumen DED',
                      controller: controller.draftFileControllers[0],
                      onPick: () => controller.pickDraftFileCustom(0),
                    ),
                    const SizedBox(height: 12),
                    _buildDraftUploadField(
                      label: 'Dokumen RAB',
                      controller: controller.draftFileControllers[1],
                      onPick: () => controller.pickDraftFileCustom(1),
                    ),
                    const SizedBox(height: 12),
                    _buildDraftUploadField(
                      label: 'Dokumen BOQ',
                      controller: controller.draftFileControllers[2],
                      onPick: () => controller.pickDraftFileCustom(2),
                    ),
                    const SizedBox(height: 12),
                    PkpTextFormField(
                      controller: controller.draftNotesController,
                      labelText: 'Catatan',
                      hintText: 'Tuliskan catatan untuk konsultan',
                      type: PkpTextFormFieldType.multiline,
                      borderRadius: 12,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              PkpBottomActions(
                primaryText: 'Submit',
                onPrimaryPressed: () {
                  controller.submitDraftDesigns();
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDraftUploadField({
    required String label,
    required TextEditingController controller,
    required Future<String?> Function() onPick,
  }) {
    return PkpTextFormField(
      controller: controller,
      labelText: label,
      hintText: 'Pilih Dokumen (PDF)',
      type: PkpTextFormFieldType.filePicker,
      filePickerType: PkpFilePickerType.pdf,
      allowedFileExtensions: const ['pdf'],
      allowedFileLabel: 'PDF (Maks 5MB)',
      customPickFile: onPick,
    );
  }

  Widget _buildPaymentTermSection({
    required String title,
    required TextEditingController amountController,
    required TextEditingController dueDateController,
    required VoidCallback onPickDate,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h4.copyWith(color: AppColors.neutralDarkest),
        ),
        const SizedBox(height: 8),
        PkpTextFormField(
          controller: amountController,
          labelText: 'Nominal',
          hintText: '123.456.789',
          type: PkpTextFormFieldType.currency,
          borderRadius: 12,
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onPickDate,
          child: AbsorbPointer(
            child: PkpTextFormField(
              controller: dueDateController,
              labelText: 'Tanggal Jatuh Tempo',
              hintText: 'Pilih Tanggal',
              type: PkpTextFormFieldType.datetime,
              borderRadius: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Obx(() {
      final isConsultant = controller.userRole.value == UserRole.consultant;
      final step = controller.selectedStep.value;
      final hasContracts = controller.contracts.isNotEmpty;
      final lastContract = hasContracts ? controller.contracts.last : null;
      final isConsultantAwaitingApproval =
          isConsultant &&
          lastContract != null &&
          lastContract.status == ContractStatus.awaitingApproval;
      final hasPendingContractApproval =
          step == ConsultationDetailStep.contract &&
          lastContract?.status == ContractStatus.awaitingApproval;
      final hasPendingContractSign =
          step == ConsultationDetailStep.contract &&
          lastContract?.status == ContractStatus.approvedNeedSign;
      final hasApprovedContract =
          step == ConsultationDetailStep.contract &&
          lastContract != null &&
          (lastContract.status == ContractStatus.approvedNeedSign ||
              lastContract.status == ContractStatus.approvedSigned);
      final isApprovedSigned =
          lastContract?.status == ContractStatus.approvedSigned;
      final canCancel =
          step == ConsultationDetailStep.contract &&
          !hasApprovedContract &&
          !isConsultant;
      final showDraftUploadCta =
          isApprovedSigned &&
          controller.draftDesigns.isEmpty &&
          step == ConsultationDetailStep.contract;
      final showDraftUploadOnDraftTab =
          isConsultant &&
          isApprovedSigned &&
          controller.draftDesigns.isEmpty &&
          step == ConsultationDetailStep.draftDesign;
      final lastDraft = controller.draftDesigns.isNotEmpty
          ? controller.draftDesigns.last
          : null;
      final showHomeOwnerDraftApproval =
          !isConsultant &&
          step == ConsultationDetailStep.draftDesign &&
          lastDraft?.status == DesignStatus.awaitingApproval;

      if (isConsultantAwaitingApproval) {
        return const SizedBox.shrink();
      }

      if (isApprovedSigned && step == ConsultationDetailStep.contract) {
        return const SizedBox.shrink();
      }

      if (hasPendingContractSign) {
        return PkpBottomActions(
          primaryText: 'Tandatangani Kontrak',
          onPrimaryPressed: controller.signLatestContract,
        );
      }

      if (showDraftUploadCta) {
        return PkpBottomActions(
          primaryText: 'Unggah Draft Desain',
          onPrimaryPressed: () {
            final ctx = Get.context;
            if (ctx != null) _showUploadDraftSheet(ctx);
          },
        );
      }

      if (showDraftUploadOnDraftTab) {
        return PkpBottomActions(
          primaryText: 'Unggah Draft Desain',
          onPrimaryPressed: () {
            final ctx = Get.context;
            if (ctx != null) _showUploadDraftSheet(ctx);
          },
        );
      }

      if (showHomeOwnerDraftApproval) {
        return _buildApprovalActions(
          onApprove: controller.approveLatestDraft,
          onReject: controller.reviseLatestDraft,
        );
      }

      if (isConsultant &&
          step == ConsultationDetailStep.contract &&
          !controller.hasUploadedContract.value) {
        return PkpBottomActions(
          secondaryText: 'Unduh Template',
          onSecondaryPressed: controller.downloadContractTemplate,
          primaryText: 'Unggah Kontrak',
          onPrimaryPressed: () {
            _showUploadContractSheet(context);
          },
        );
      }

      if (hasPendingContractApproval && canCancel) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildApprovalActions(
              onApprove: controller.approveLatestContract,
              onReject: controller.reviseLatestContract,
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
    });
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
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(
                imageUrl!,
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

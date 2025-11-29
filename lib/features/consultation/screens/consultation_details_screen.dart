import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_details_controller.dart';

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
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
      bottomNavigationBar: _buildBottomBar(context),
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
              final consultantName =
                  controller.project.consultationInfo?.consultantName?.trim() ??
                  '';
              controller.navigateTo(
                AppRoutes.chat,
                arguments: ChatArgs(
                  name: consultantName.isNotEmpty == true
                      ? consultantName
                      : 'Konsultan',
                ),
              );
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
      return _buildEmptyState(message: 'Belum ada kontrak yang tersedia');
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contract.title,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.neutralDarkest,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      consultantName,
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.neutralDarkest,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      contract.dateLabel,
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.neutralMediumLight,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.file_download_outlined),
                color: AppColors.primaryDarkest,
                onPressed: () => controller.downloadContract(contract),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: _buildContractStatus(contract.status),
          ),
        ],
      ),
    );
  }

  Widget _buildDesignCard(ConsultationDocumentItem item) {
    final isAwaitingApproval = item.status == DesignStatus.awaitingApproval;
    final isRevision = item.status == DesignStatus.needsRevision;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.neutralDarkest,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.dateLabel,
                      style: AppTextStyles.bodyS.copyWith(
                        color: AppColors.neutralMediumLight,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.file_download_outlined),
                color: AppColors.primaryDarkest,
                onPressed: () => controller.downloadDesign(item),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isAwaitingApproval
                    ? AppColors.warningLight
                    : isRevision
                    ? AppColors.errorLight
                    : AppColors.successLight,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                isAwaitingApproval
                    ? 'Menunggu Persetujuan'
                    : isRevision
                    ? 'Perlu Revisi'
                    : 'Disetujui',
                style: AppTextStyles.bodyS.copyWith(
                  color: isAwaitingApproval
                      ? AppColors.warningDark
                      : isRevision
                      ? AppColors.errorDark
                      : AppColors.successDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.insert_drive_file_outlined,
              size: 48,
              color: AppColors.neutralMediumLight,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: AppTextStyles.bodyM.copyWith(
                color: AppColors.neutralMediumLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContractStatus(ContractStatus status) {
    late final String label;
    late final Color textColor;
    late final Color background;

    switch (status) {
      case ContractStatus.awaitingApproval:
        label = 'Menunggu Persetujuan';
        textColor = AppColors.warningDark;
        background = AppColors.warningLight;
        break;
      case ContractStatus.needsRevision:
        label = 'Perlu Revisi';
        textColor = AppColors.errorDark;
        background = AppColors.errorLight;
        break;
      case ContractStatus.approvedNeedSign:
      case ContractStatus.approvedSigned:
        label = 'Disetujui';
        textColor = AppColors.successDark;
        background = AppColors.successLight;
        break;
    }

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodyS.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            // TODO: Cancel consultation
          },
          child: Text(
            'Batalkan Konsultasi',
            style: AppTextStyles.actionM.copyWith(color: AppColors.errorDark),
          ),
        ),
      ),
    );
  }

  Widget _buildInvoiceCard(ConsultationInvoiceItem item) {
    final isPaid = item.status == InvoiceStatus.paid;

    return GestureDetector(
      onTap: () {
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
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.inputSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.inputBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.neutralDarkest,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.dateLabel,
                        style: AppTextStyles.bodyS.copyWith(
                          color: AppColors.neutralMediumLight,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        Formatters.currency(item.amount),
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.neutralDarkest,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.file_download_outlined),
                  color: AppColors.primaryDarkest,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isPaid
                      ? AppColors.successLight
                      : AppColors.warningLight,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  isPaid ? 'Sudah Dibayar' : 'Belum Dibayar',
                  style: AppTextStyles.bodyS.copyWith(
                    color: isPaid
                        ? AppColors.successDark
                        : AppColors.warningDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showUploadContractSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primaryLightest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.description_outlined,
                  color: AppColors.primaryDark,
                  size: 28,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Unggah Dokumen Kontrak',
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Unggah kontrak untuk diajukan ke pemilik proyek.',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.neutralMediumLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              PkpElevatedButton(
                text: 'Pilih Dokumen',
                onPressed: () {
                  controller.markContractUploaded();
                  Get.back();
                },
              ),
              const SizedBox(height: 8),
              PkpOutlinedButton(text: 'Batal', onPressed: Get.back),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showUploadedContractSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kontrak Diunggah',
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.inputSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.inputBorder),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.picture_as_pdf_outlined,
                      color: AppColors.primaryDark,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text('Kontrak.pdf', style: AppTextStyles.bodyM),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              PkpOutlinedButton(
                text: 'Unduh Kontrak',
                onPressed: () {
                  controller.downloadContractTemplate();
                },
              ),
              const SizedBox(height: 8),
              PkpElevatedButton(
                text: 'Unggah Ulang',
                onPressed: () {
                  controller.markContractUploaded();
                  Get.back();
                  _showUploadContractSheet(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Obx(() {
      final isConsultant = controller.userRole.value == UserRole.consultant;
      final step = controller.selectedStep.value;
      final hasContracts = controller.contracts.isNotEmpty;
      final lastContract = hasContracts ? controller.contracts.last : null;
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
      final canCancel =
          step == ConsultationDetailStep.contract &&
          !hasApprovedContract &&
          !isConsultant;

      if (isConsultant && step == ConsultationDetailStep.contract) {
        return PkpBottomActions(
          secondaryText: 'Unduh Template',
          onSecondaryPressed: controller.downloadContractTemplate,
          primaryText: controller.hasUploadedContract.value
              ? 'Lihat Kontrak'
              : 'Unggah Kontrak',
          onPrimaryPressed: () {
            if (controller.hasUploadedContract.value) {
              _showUploadedContractSheet(context);
            } else {
              _showUploadContractSheet(context);
            }
          },
        );
      }

      if (hasPendingContractSign) {
        return PkpBottomActions(
          primaryText: 'Tandatangani Kontrak',
          onPrimaryPressed: () {},
        );
      }

      if (hasPendingContractApproval) {
        return _buildApprovalActions(onApprove: () {}, onReject: () {});
      }

      if (canCancel) {
        return _buildCancelConsultation();
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/app/widgets/pkp_upload_document_widget.dart';
import 'package:pkp_hub/data/models/installment.dart';
import 'package:pkp_hub/features/project/controllers/project_details_controller.dart';

class ContractActionsBottomSheet extends StatefulWidget {
  final bool isDownload; // if true show download button, else upload button
  const ContractActionsBottomSheet({super.key, this.isDownload = false});

  @override
  State<ContractActionsBottomSheet> createState() =>
      _ContractActionsBottomSheetState();
}

class _ContractActionsBottomSheetState
    extends State<ContractActionsBottomSheet> {
  final ProjectDetailsController controller =
      Get.find<ProjectDetailsController>();

  File? _selectedFile;

  final TextEditingController _consultationCostCtrl = TextEditingController();

  // Track Rx subscriptions so we can dispose properly and rebuild when they change.
  final List<Worker> _workers = [];

  @override
  void initState() {
    super.initState();
    // Refresh UI when any field changes so validation/enabling updates reactively.
    for (final controller in [
      _consultationCostCtrl,
    ]) {
      controller.addListener(() => setState(() {}));
    }
    // Also react to GetX loading states to refresh button/file section instantly.
    _workers.addAll([
      ever<bool>(controller.uploadContractLoading, (_) => setState(() {})),
      ever<bool>(controller.downloadTemplateLoading, (_) => setState(() {})),
    ]);
  }

  @override
  void dispose() {
    _consultationCostCtrl.dispose();
    for (final worker in _workers) {
      worker.dispose();
    }
    super.dispose();
  }

  bool get _consultationCostFilled =>
      _parsePositiveDouble(_consultationCostCtrl.text) > 0;

  double _parsePositiveDouble(String text) {
    final digits = text.replaceAll(RegExp(r'[^0-9]'), '');
    return double.tryParse(digits) ?? 0.0;
  }

  Widget _fileSection(BuildContext context) {
    if (widget.isDownload) return const SizedBox.shrink();
    // Use controller's loading state directly; setState is triggered by workers above.
    final isLoading = controller.uploadContractLoading.value;
    final status = isLoading
        ? PkpUploadStatus.uploading
        : (_selectedFile != null
              ? PkpUploadStatus.success
              : PkpUploadStatus.none);
    return PkpUploadDocumentWidget(
      title: 'Dokumen Kontrak',
      buttonText: 'Pilih File',
      enabled: !isLoading,
      isLoading: isLoading,
      allowedExtensions: const ['pdf'],
      selectedFileName: _selectedFile?.path.split('/').last,
      onFileSelected: (file) => setState(() => _selectedFile = file),
      uploadStatus: status,
    );
  }

  bool _isAllRequiredFilled() {
    // Required for upload: file selected and consultation cost filled.
    return _consultationCostFilled && (_selectedFile != null && !widget.isDownload);
  }

  double _parseContractValue() {
    return _parsePositiveDouble(_consultationCostCtrl.text).toDouble();
  }

  bool _isPdfFile(File f) {
    final name = f.path.toLowerCase();
    return name.endsWith('.pdf');
  }

  bool _validateUpload() {
    // Ensure file exists and is a valid PDF with size <= 2MB, and cost > 0
    if (_selectedFile == null) {
      Get.snackbar(
        'Terjadi Kesalahan',
        'Silakan pilih dokumen kontrak (PDF).',
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
      );
      return false;
    }
    if (!_isPdfFile(_selectedFile!)) {
      Get.snackbar(
        'Terjadi Kesalahan',
        'Format file tidak valid. Hanya mendukung PDF.',
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
      );
      return false;
    }
    // File size limit: 2 MB max
    final fileSize = _selectedFile!.lengthSync();
    const maxBytes = 2 * 1024 * 1024; // 2MB
    if (fileSize > maxBytes) {
      Get.snackbar(
        'Terjadi Kesalahan',
        'Ukuran file melebihi 2MB. Mohon unggah file ≤ 2MB.',
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
      );
      return false;
    }

    final value = _parseContractValue();
    if (value <= 0) {
      Get.snackbar(
        'Terjadi Kesalahan',
        'Total biaya konsultasi harus lebih dari 0.',
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final uploading = controller.uploadContractLoading.value;
    final downloading = controller.downloadTemplateLoading.value;
    final isBusy = uploading || downloading;

    // Enable action when not busy and minimal required fields are filled
    final bool isActionEnabled = widget.isDownload
        ? (!isBusy && _consultationCostFilled)
        : (!isBusy && _isAllRequiredFilled());

    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PkpAppBar(leading: Icons.close),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 1. Upload file section (upload mode only)
                    _fileSection(context),
                    const SizedBox(height: 16),

                    // Total Biaya Konsultasi
                    PkpTextFormField(
                      controller: _consultationCostCtrl,
                      labelText: 'Total Biaya Konsultasi',
                      hintText: '123.456.789',
                      type: PkpTextFormFieldType.currency,
                    ),

                    const SizedBox(height: 20),

                    // 2. Upload or download button
                    PkpElevatedButton(
                      text: widget.isDownload
                          ? 'Generate Dokumen Kontrak'
                          : 'Submit Dokumen Kontrak',
                      enabled: isActionEnabled,
                      isLoading: isBusy,
                      onPressed: widget.isDownload
                          ? () async {
                              final done = await controller
                                  .generateAndDownloadContractTemplate(
                                contractValue: _parseContractValue(),
                                installments: const <Installment>[],
                              );
                              if (done) {
                                Get.back(); // Close bottom sheet on success
                              }
                            }
                          : (_isAllRequiredFilled()
                              ? () async {
                                  if (!_validateUpload()) return;

                                  final done = await controller.uploadContract(
                                    _selectedFile!,
                                    _parseContractValue(),
                                    const <Installment>[],
                                  );
                                  if (done) {
                                    await Future.delayed(
                                      const Duration(milliseconds: 150),
                                    );
                                    try {
                                      if (Navigator.of(context).canPop()) {
                                        Navigator.of(context).pop();
                                      } else {
                                        Get.back();
                                      }
                                    } catch (_) {
                                      try {
                                        Get.back();
                                      } catch (_) {}
                                    }
                                  }
                                }
                              : null),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

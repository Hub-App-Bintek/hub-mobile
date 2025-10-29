import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/app/widgets/pkp_upload_document_widget.dart';
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
  final TextEditingController _firstTermWeightCtrl = TextEditingController();
  final TextEditingController _firstTermLastPaymentDateCtrl =
      TextEditingController();
  final TextEditingController _secondTermWeightCtrl = TextEditingController();
  final TextEditingController _secondTermLastPaymentDateCtrl =
      TextEditingController();
  final TextEditingController _thirdTermWeightCtrl = TextEditingController();
  final TextEditingController _thirdTermLastPaymentDateCtrl =
      TextEditingController();

  // Track Rx subscriptions so we can dispose properly and rebuild when they change.
  final List<Worker> _workers = [];

  @override
  void initState() {
    super.initState();
    // Refresh UI when any field changes so validation/enabling updates reactively.
    for (final c in [
      _consultationCostCtrl,
      _firstTermWeightCtrl,
      _firstTermLastPaymentDateCtrl,
      _secondTermWeightCtrl,
      _secondTermLastPaymentDateCtrl,
      _thirdTermWeightCtrl,
      _thirdTermLastPaymentDateCtrl,
    ]) {
      c.addListener(() => setState(() {}));
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
    _firstTermWeightCtrl.dispose();
    _firstTermLastPaymentDateCtrl.dispose();
    _secondTermWeightCtrl.dispose();
    _secondTermLastPaymentDateCtrl.dispose();
    _thirdTermWeightCtrl.dispose();
    _thirdTermLastPaymentDateCtrl.dispose();
    for (final w in _workers) {
      w.dispose();
    }
    super.dispose();
  }

  bool get _term1Filled =>
      _firstTermLastPaymentDateCtrl.text.trim().isNotEmpty &&
      _parsePositiveInt(_firstTermWeightCtrl.text) > 0;

  bool get _term2Filled =>
      _secondTermLastPaymentDateCtrl.text.trim().isNotEmpty &&
      _parsePositiveInt(_secondTermWeightCtrl.text) > 0;

  bool get _term3Filled =>
      _thirdTermLastPaymentDateCtrl.text.trim().isNotEmpty &&
      _parsePositiveInt(_thirdTermWeightCtrl.text) > 0;

  bool get _consultationCostFilled =>
      _parsePositiveInt(_consultationCostCtrl.text) > 0;

  int _parsePositiveInt(String text) {
    final digits = text.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(digits) ?? 0;
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

  Widget _termBlock({
    required String title,
    required TextEditingController dateCtrl,
    required TextEditingController weightCtrl,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: PkpTextFormField(
                controller: dateCtrl,
                labelText: title,
                hintText: 'Pilih tanggal',
                type: PkpTextFormFieldType.datetime,
                enabled: enabled,
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 120,
              child: PkpTextFormField(
                controller: weightCtrl,
                labelText: 'Bobot',
                hintText: '0',
                type: PkpTextFormFieldType.percentage,
                enabled: enabled,
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _isAllRequiredFilled() {
    // All required fields for upload: file selected, consultation cost, and all three terms.
    return _consultationCostFilled &&
        _term1Filled &&
        _term2Filled &&
        _term3Filled &&
        _selectedFile != null;
  }

  @override
  Widget build(BuildContext context) {
    final uploading = controller.uploadContractLoading.value;
    final downloading = controller.downloadTemplateLoading.value;
    final isBusy = uploading || downloading;
    final bool isActionEnabled = widget.isDownload
        ? !isBusy
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
                    // 1. Upload file section
                    _fileSection(context),
                    const SizedBox(height: 16),

                    // Total Biaya Konsultasi
                    PkpTextFormField(
                      controller: _consultationCostCtrl,
                      labelText: 'Total Biaya Konsultasi',
                      hintText: '123.456.789',
                      type: PkpTextFormFieldType.currency,
                    ),

                    const SizedBox(height: 16),

                    // 2. Form per terms (1, 2, 3)
                    _termBlock(
                      title: 'Batas Waktu Pembayaran Termin 1',
                      dateCtrl: _firstTermLastPaymentDateCtrl,
                      weightCtrl: _firstTermWeightCtrl,
                      enabled: true,
                    ),
                    const SizedBox(height: 16),
                    _termBlock(
                      title: 'Batas Waktu Pembayaran Termin 2',
                      dateCtrl: _secondTermLastPaymentDateCtrl,
                      weightCtrl: _secondTermWeightCtrl,
                      enabled: _term1Filled,
                    ),
                    const SizedBox(height: 16),
                    _termBlock(
                      title: 'Batas Waktu Pembayaran Termin 3',
                      dateCtrl: _thirdTermLastPaymentDateCtrl,
                      weightCtrl: _thirdTermWeightCtrl,
                      enabled: _term1Filled && _term2Filled,
                    ),

                    const SizedBox(height: 20),

                    // 3. Upload or download button (disabled until all validations pass)
                    PkpElevatedButton(
                      text: widget.isDownload
                          ? 'Unduh Dokumen Kontrak'
                          : 'Unggah Dokumen Kontrak',
                      enabled: isActionEnabled,
                      isLoading: isBusy,
                      onPressed: _isAllRequiredFilled()
                          ? () async {
                              if (widget.isDownload) {
                                await controller.downloadContractTemplate();
                              } else {
                                final ok = await controller.uploadContractFile(
                                  _selectedFile!,
                                );
                                if (ok) Get.back();
                              }
                            }
                          : null,
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/app/widgets/pkp_upload_document_widget.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
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
    for (final controller in [
      _consultationCostCtrl,
      _firstTermWeightCtrl,
      _firstTermLastPaymentDateCtrl,
      _secondTermWeightCtrl,
      _secondTermLastPaymentDateCtrl,
      _thirdTermWeightCtrl,
      _thirdTermLastPaymentDateCtrl,
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
    _firstTermWeightCtrl.dispose();
    _firstTermLastPaymentDateCtrl.dispose();
    _secondTermWeightCtrl.dispose();
    _secondTermLastPaymentDateCtrl.dispose();
    _thirdTermWeightCtrl.dispose();
    _thirdTermLastPaymentDateCtrl.dispose();
    for (final worker in _workers) {
      worker.dispose();
    }
    super.dispose();
  }

  bool get _term1Filled =>
      _firstTermLastPaymentDateCtrl.text.trim().isNotEmpty &&
      _parsePositiveDouble(_firstTermWeightCtrl.text) > 0;

  bool get _term2Filled =>
      _secondTermLastPaymentDateCtrl.text.trim().isNotEmpty &&
      _parsePositiveDouble(_secondTermWeightCtrl.text) > 0;

  bool get _term3Filled =>
      _thirdTermLastPaymentDateCtrl.text.trim().isNotEmpty &&
      _parsePositiveDouble(_thirdTermWeightCtrl.text) > 0;

  bool get _consultationCostFilled =>
      _parsePositiveDouble(_consultationCostCtrl.text) > 0;

  double _parsePositiveDouble(String text) {
    final digits = text.replaceAll(RegExp(r'[^0-9]'), '');
    return double.tryParse(digits) ?? 0.0;
  }

  double _totalWeight() {
    return _parsePositiveDouble(_firstTermWeightCtrl.text) +
        _parsePositiveDouble(_secondTermWeightCtrl.text) +
        _parsePositiveDouble(_thirdTermWeightCtrl.text);
  }

  bool get _isTotalWeightValid => _totalWeight() <= 100.0;

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

  DateTime? _parseIsoFromCtrl(TextEditingController ctrl) {
    final iso = Formatters.toIsoDate(ctrl.text);
    return Formatters.tryParseIso(iso);
  }

  DateTime? _nextDay(DateTime? dt) => dt == null
      ? null
      : DateTime(dt.year, dt.month, dt.day).add(const Duration(days: 1));

  Widget _termBlock({
    required String title,
    required TextEditingController dateCtrl,
    required TextEditingController weightCtrl,
    bool enabled = true,
    DateTime? firstDate,
    DateTime? initialDate,
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
                firstDate: firstDate,
                initialDate: initialDate,
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
        (_selectedFile != null && !widget.isDownload);
  }

  double _parseContractValue() {
    return _parsePositiveDouble(_consultationCostCtrl.text).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final uploading = controller.uploadContractLoading.value;
    final downloading = controller.downloadTemplateLoading.value;
    final isBusy = uploading || downloading;
    final bool isActionEnabled = widget.isDownload
        ? (!isBusy &&
              _consultationCostFilled &&
              _term1Filled &&
              _term2Filled &&
              _term3Filled)
        : (!isBusy && _isAllRequiredFilled());

    List<Installment>? buildInstallments() {
      final d1 = Formatters.toIsoDate(_firstTermLastPaymentDateCtrl.text);
      final d2 = Formatters.toIsoDate(_secondTermLastPaymentDateCtrl.text);
      final d3 = Formatters.toIsoDate(_thirdTermLastPaymentDateCtrl.text);
      if (d1 == null || d2 == null || d3 == null) return null;
      return [
        Installment(
          percentage: _parsePositiveDouble(
            _firstTermWeightCtrl.text,
          ).toDouble(),
          dueDate: d1,
        ),
        Installment(
          percentage: _parsePositiveDouble(
            _secondTermWeightCtrl.text,
          ).toDouble(),
          dueDate: d2,
        ),
        Installment(
          percentage: _parsePositiveDouble(
            _thirdTermWeightCtrl.text,
          ).toDouble(),
          dueDate: d3,
        ),
      ];
    }

    final term1Date = _parseIsoFromCtrl(_firstTermLastPaymentDateCtrl);
    final term2Date = _parseIsoFromCtrl(_secondTermLastPaymentDateCtrl);

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
                      firstDate: _nextDay(term1Date),
                      initialDate: _nextDay(term1Date),
                    ),
                    const SizedBox(height: 16),
                    _termBlock(
                      title: 'Batas Waktu Pembayaran Termin 3',
                      dateCtrl: _thirdTermLastPaymentDateCtrl,
                      weightCtrl: _thirdTermWeightCtrl,
                      enabled: _term1Filled && _term2Filled,
                      firstDate: _nextDay(term2Date),
                      initialDate: _nextDay(term2Date),
                    ),

                    const SizedBox(height: 20),

                    // 3. Upload or download button (disabled until all validations pass)
                    PkpElevatedButton(
                      text: widget.isDownload
                          ? 'Generate Dokumen Kontrak'
                          : 'Submit Dokumen Kontrak',
                      enabled: isActionEnabled,
                      isLoading: isBusy,
                      onPressed: widget.isDownload
                          ? () async {
                              if (!_isTotalWeightValid) {
                                Get.snackbar(
                                  'Error',
                                  'Total bobot termin tidak boleh lebih dari 100%.',
                                  colorText: AppColors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppColors.errorDark,
                                );
                                return;
                              }

                              final installments = buildInstallments();
                              if (installments == null) {
                                Get.snackbar(
                                  'Error',
                                  'Data termin tidak valid.',
                                  colorText: AppColors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppColors.errorDark,
                                );
                                return;
                              }

                              await controller
                                  .generateAndDownloadContractTemplate(
                                    contractValue: _parseContractValue(),
                                    installments: buildInstallments() ?? [],
                                  );
                            }
                          : (_isAllRequiredFilled()
                                ? () async {
                                    final ok = await controller
                                        .uploadContractFile(
                                          _selectedFile!,
                                          _parseContractValue(),
                                        );
                                    if (ok) Get.back();
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

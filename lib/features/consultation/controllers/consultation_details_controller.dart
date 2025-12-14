import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/data/models/installment.dart';
import 'package:pkp_hub/data/models/payment.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/request/create_contract_draft_request.dart';
import 'package:pkp_hub/data/models/response/consultation_details_response.dart';
import 'package:pkp_hub/data/models/response/contract_version_response.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/data/models/response/design_document_approval_response.dart';
import 'package:pkp_hub/data/models/response/design_document_response.dart';
import 'package:pkp_hub/data/models/response/design_document_revision_response.dart';
import 'package:pkp_hub/data/models/response/upload_design_document_response.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/get_consultation_detail_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/approve_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/ask_contract_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/create_contract_draft_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/generate_contract_draft_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/download_contract_version_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/get_contract_versions_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/sign_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_param.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_revised_contract_param.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_revised_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/approve_design_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/ask_design_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/download_design_version_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/get_design_document_versions_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/upload_design_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/payment/get_payments_use_case.dart';

enum ConsultationDetailStep { contract, draftDesign, finalDesign, invoice }

enum ContractStatus {
  needApproval,
  needRevision,
  approved,
  homeownerSigned,
  consultantSigned,
  signed,
  unknown,
}

enum DesignStatus { awaitingApproval, approved, needsRevision }

enum InvoiceStatus { unpaid, paid }

class ConsultationDetailsController extends BaseController {
  // Max revisions allowed before forcing approval (initial + 2 revisions -> final).
  static const int maxRevisionAttempts = 3;
  final Rx<ConsultationDetailStep> selectedStep =
      ConsultationDetailStep.contract.obs;
  final Rxn<UserRole> userRole = Rxn<UserRole>();
  final RxBool isLoading = false.obs;
  final RxBool isLoadingContracts = false.obs;
  final RxBool isLoadingDesigns = false.obs;
  final RxBool isUploadingContract = false.obs;
  final RxBool isUploadingDesign = false.obs;
  final RxBool isDownloadingContract = false.obs;
  final RxBool isDownloadingDesign = false.obs;
  final RxBool isGeneratingContractTemplate = false.obs;
  final RxBool isLoadingInvoices = false.obs;
  final RxBool hasUploadedContract = false.obs;
  final UserStorage _userStorage;
  final Rxn<ConsultationDetailsResponse> consultation =
      Rxn<ConsultationDetailsResponse>();
  final Rxn<Project> project = Rxn<Project>();

  final RxList<ConsultationContractItem> contracts =
      <ConsultationContractItem>[].obs;
  final RxList<ConsultationDesignItem> draftDesigns =
      <ConsultationDesignItem>[].obs;
  final RxList<ConsultationDesignItem> finalDesigns =
      <ConsultationDesignItem>[].obs;
  final RxList<ConsultationInvoiceItem> invoices =
      <ConsultationInvoiceItem>[].obs;

  final RxnString selectedContractName = RxnString();
  final RxnString selectedContractPath = RxnString();
  final TextEditingController contractValueController = TextEditingController();
  final List<TextEditingController> termAmountControllers = List.generate(
    3,
    (_) => TextEditingController(),
  );
  final List<TextEditingController> termDueDateControllers = List.generate(
    3,
    (_) => TextEditingController(),
  );
  final List<TextEditingController> designFileControllers = List.generate(
    3,
    (_) => TextEditingController(),
  );
  final List<RxnString> designFileNames = List.generate(3, (_) => RxnString());
  final List<RxnString> designFilePaths = List.generate(3, (_) => RxnString());
  final TextEditingController designNotesController = TextEditingController();
  final RxBool isDesignFormValid = false.obs;

  ConsultationDetailsController(
    this._userStorage,
    this._createDirectChatRoomUseCase,
    this._getConsultationDetailUseCase,
    this._getContractVersionsUseCase,
    this._createContractDraftUseCase,
    this._uploadRevisedContractUseCase,
    this._generateContractDraftUseCase,
    this._approveContractUseCase,
    this._askContractRevisionUseCase,
    this._signContractUseCase,
    this._uploadDesignDocumentsUseCase,
    this._approveDesignDocumentsUseCase,
    this._askDesignRevisionUseCase,
    this._getDesignDocumentVersionsUseCase,
    this._downloadDesignVersionUseCase,
    this._downloadContractVersionUseCase,
    this._getPaymentsUseCase,
  );

  final CreateDirectChatRoomUseCase _createDirectChatRoomUseCase;

  /// Consultation Details
  final GetConsultationDetailUseCase _getConsultationDetailUseCase;

  /// Contract
  final GetContractVersionsUseCase _getContractVersionsUseCase;
  final GenerateContractDraftUseCase _generateContractDraftUseCase;
  final CreateContractDraftUseCase _createContractDraftUseCase;
  final AskContractRevisionUseCase _askContractRevisionUseCase;
  final UploadRevisedContractUseCase _uploadRevisedContractUseCase;
  final ApproveContractUseCase _approveContractUseCase;
  final SignContractUseCase _signContractUseCase;
  final DownloadContractVersionUseCase _downloadContractVersionUseCase;

  /// Design
  final GetDesignDocumentVersionsUseCase _getDesignDocumentVersionsUseCase;
  final UploadDesignDocumentsUseCase _uploadDesignDocumentsUseCase;
  final AskDesignRevisionUseCase _askDesignRevisionUseCase;
  final ApproveDesignDocumentsUseCase _approveDesignDocumentsUseCase;
  final DownloadDesignVersionUseCase _downloadDesignVersionUseCase;

  // Invoice
  final GetPaymentsUseCase _getPaymentsUseCase;

  final TextEditingController contractController = TextEditingController();
  final RxBool isPaymentTermsValid = false.obs;

  bool get isConsultant => userRole.value == UserRole.consultant;

  bool get isPaidConsultation =>
      (project.value?.consultationInfo?.consultationType ?? '').toUpperCase() ==
      'BERBAYAR';

  String sectionTitle(ConsultationDetailStep step) {
    switch (step) {
      case ConsultationDetailStep.contract:
        return 'Daftar Kontrak';
      case ConsultationDetailStep.draftDesign:
        return 'Draft Desain';
      case ConsultationDetailStep.finalDesign:
        return 'Final Desain';
      case ConsultationDetailStep.invoice:
        return 'Invoice';
    }
  }

  void selectStep(ConsultationDetailStep step) {
    selectedStep.value = step;
    if (step == ConsultationDetailStep.contract &&
        contracts.isEmpty &&
        !isLoadingContracts.value) {
      _fetchContractsIfNeeded();
    } else if (step == ConsultationDetailStep.draftDesign &&
        draftDesigns.isEmpty &&
        !isLoadingDesigns.value) {
      _fetchDesignDocumentsIfNeeded();
    } else if (step == ConsultationDetailStep.finalDesign &&
        finalDesigns.isEmpty &&
        !isLoadingDesigns.value) {
      _fetchDesignDocumentsIfNeeded();
    } else if (step == ConsultationDetailStep.invoice &&
        invoices.isEmpty &&
        !isLoadingInvoices.value) {
      _fetchInvoicesIfNeeded();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _setupPaymentTermListeners();
    _hydrateFromArgs();
    _loadUserRole();
    fetchDetails(isInitialLoad: true);
  }

  void _setupPaymentTermListeners() {
    contractValueController.addListener(_recomputePaymentValidation);
    for (final controller in termAmountControllers) {
      controller.addListener(_recomputePaymentValidation);
    }
    for (final controller in termDueDateControllers) {
      controller.addListener(_recomputePaymentValidation);
    }
  }

  void _hydrateFromArgs() {
    final args = Get.arguments;
    if (args is ConsultationDetailsArgs) {
      project.value = args.project;
    } else if (args is Map<String, dynamic>) {
      project.value = args['project'] as Project?;
    }
  }

  Future<void> _loadUserRole() async {
    userRole.value = await _userStorage.getRole() ?? UserRole.unknown;
  }

  Future<void> handleRefresh() async {
    await fetchDetails();
  }

  Future<void> fetchDetails({bool isInitialLoad = false}) async {
    final id = project.value?.consultationInfo?.consultationId;
    if (id == null || id.isEmpty) {
      if (!isInitialLoad) {
        showError(const ServerFailure(message: 'Konsultasi tidak ditemukan'));
      }

      return;
    }

    if (isLoading.value) return;

    isLoading.value = true;
    await handleAsync<ConsultationDetailsResponse>(
      () => _getConsultationDetailUseCase(id),
      onSuccess: (detail) {
        consultation.value = detail;
        if (selectedStep.value == ConsultationDetailStep.contract &&
            !isLoadingContracts.value) {
          _fetchContractsIfNeeded(status: detail.status);
        } else if ((selectedStep.value == ConsultationDetailStep.draftDesign ||
                selectedStep.value == ConsultationDetailStep.finalDesign) &&
            !isLoadingDesigns.value) {
          _fetchDesignDocumentsIfNeeded(consultationId: detail.consultationId);
        } else if (selectedStep.value == ConsultationDetailStep.invoice &&
            !isLoadingInvoices.value) {
          _fetchInvoicesIfNeeded(consultationId: detail.consultationId);
        }
      },
      onFailure: (failure) {
        showError(failure);
      },
    );

    isLoading.value = false;
  }

  Future<void> _fetchContractsIfNeeded({String? status}) async {
    final effectiveProjectId = project.value?.projectId;
    final effectiveConsultationId =
        project.value?.consultationInfo?.consultationId;

    if (status == 'MENYIAPKAN_KONTRAK') return;
    if (effectiveConsultationId == null ||
        effectiveConsultationId.isEmpty ||
        effectiveProjectId == null ||
        effectiveProjectId.isEmpty ||
        isLoadingContracts.value) {
      return;
    }

    isLoadingContracts.value = true;
    await handleAsync<List<ContractVersionResponse>>(
      () => _getContractVersionsUseCase(
        GetContractVersionsParams(
          projectId: effectiveProjectId,
          consultationId: effectiveConsultationId,
        ),
      ),
      onSuccess: (response) {
        final totalContracts = response.length;
        contracts.clear();
        response.reversed.toList().asMap().forEach((index, contract) {
          final info = contract.documentInfo;
          contracts.add(
            ConsultationContractItem(
              id: contract.id,
              versionId: info?.versionId,
              fileId: info?.fileId,
              title: _contractTitleForIndex(index),
              dateLabel:
                  Formatters.formatIsoDateTime(info?.uploadedAt ?? '') ?? '',
              version: 'v${info?.version}',
              status: (index < totalContracts - 1)
                  ? ContractStatus.needRevision
                  : _mapContractStatus(contract.contractStatus),
              rawStatus: contract.contractStatus,
            ),
          );
        });

        _updateHasUploadedContract();
      },
      onFailure: (failure) {
        showError(failure);
      },
    );

    isLoadingContracts.value = false;
  }

  ContractStatus _mapContractStatus(String? status) {
    switch ((status ?? '').toUpperCase()) {
      case 'MENUNGGU_APPROVAL_KONTRAK':
      case 'REQUEST_FOR_APPROVAL':
        return ContractStatus.needApproval;
      case 'REVISION_REQUESTED':
        return ContractStatus.needRevision;
      case 'APPROVED':
        return ContractStatus.approved;
      case 'HOMEOWNER_SIGNED':
        return ContractStatus.homeownerSigned;
      case 'CONSULTANT_SIGNED':
        return ContractStatus.consultantSigned;
      case 'SIGNED':
        return ContractStatus.signed;
      default:
        return ContractStatus.unknown;
    }
  }

  Future<String?> pickContractFileCustom() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
      withData: false,
    );
    final file = result?.files.single;
    if (file == null) return null;

    final name = file.name;
    selectedContractName.value = name;
    selectedContractPath.value = file.path;
    contractController.text = name;
    return name;
  }

  bool canSubmitContractUpload() {
    if ((selectedContractPath.value ?? '').isEmpty) {
      showError(
        const ServerFailure(message: 'Pilih dokumen kontrak terlebih dahulu'),
      );
      return false;
    }
    return true;
  }

  Future<void> selectTermDueDate(int index) async {
    final ctx = Get.context;
    if (ctx == null) return;
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: ctx,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      final formatted = DateFormat('dd MMM yyyy').format(picked);
      termDueDateControllers[index].text = formatted;
      _recomputePaymentValidation();
    }
  }

  double _sumTermAmounts() {
    double total = 0;
    for (final controller in termAmountControllers) {
      final parsed = _parseAmount(controller.text);
      if (parsed != null) total += parsed;
    }

    return total;
  }

  void _recomputePaymentValidation() {
    final contractValue = _parseAmount(contractValueController.text);
    final totalTerms = _sumTermAmounts();
    var datesValid = true;
    for (var i = 0; i < termAmountControllers.length; i++) {
      final amount = _parseAmount(termAmountControllers[i].text) ?? 0;
      final due = termDueDateControllers[i].text.trim();
      final hasDate = due.isNotEmpty;
      if ((amount > 0 && !hasDate) || (amount <= 0 && hasDate)) {
        datesValid = false;
        break;
      }
    }

    final isValid =
        contractValue != null &&
        contractValue > 0 &&
        totalTerms > 0 &&
        datesValid &&
        (contractValue - totalTerms).abs() < 0.01;
    isPaymentTermsValid.value = isValid;
  }

  double? _parseAmount(String text) {
    final cleaned = text.replaceAll(RegExp('[^0-9]'), '').trim();
    if (cleaned.isEmpty) return null;
    return double.tryParse(cleaned);
  }

  List<Installment> _buildInstallments() {
    final installments = <Installment>[];
    for (var i = 0; i < termAmountControllers.length; i++) {
      final amount = _parseAmount(termAmountControllers[i].text);
      final due = Formatters.toIsoDate(termDueDateControllers[i].text.trim());
      if (amount != null && amount > 0 && due != null) {
        installments.add(
          Installment(value: amount, percentage: false, dueDate: due),
        );
      }
    }

    return installments;
  }

  List<Installment> _buildFreeInstallments() {
    final todayIso =
        Formatters.toIsoDate(
          DateFormat('dd MMM yyyy').format(DateTime.now()),
        ) ??
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    return List.generate(
      3,
      (_) => Installment(value: 0, percentage: false, dueDate: todayIso),
    );
  }

  Future<void> downloadContractTemplate() async {
    final consultationId = project.value?.consultationInfo?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'ID konsultasi tidak ditemukan'));
      return;
    }

    if (isGeneratingContractTemplate.value) return;

    final contractValue =
        _parseAmount(contractValueController.text) ?? _sumTermAmounts();
    if (contractValue <= 0) {
      showError(const ServerFailure(message: 'Nilai kontrak harus diisi'));
      return;
    }

    final installments = isPaidConsultation
        ? _buildInstallments()
        : _buildFreeInstallments();

    isGeneratingContractTemplate.value = true;
    showLoadingOverlay(
      message: 'Mengunduh template kontrak...',
      delay: Duration.zero,
    );

    await handleAsync<DownloadedFile>(
      () => _generateContractDraftUseCase(
        GenerateContractDraftParams(
          consultationId: consultationId,
          request: UploadContractRequest(
            contractValue: contractValue,
            installments: installments,
            fileUrl: null,
          ),
        ),
      ),
      onSuccess: (file) async {
        hideLoadingOverlay();
        final projectName = project.value?.projectName ?? 'Konsultasi';
        final saved = await _saveDownloadedFile(
          file: file,
          projectName: projectName,
          subDirectory: 'Kontrak',
          mimeType:
              'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        );

        if (saved != null && saved.isNotEmpty) {
          _clearContractInputs();
          Get.back();
          final where = Platform.isAndroid
              ? 'Dokumen > PKP > $projectName > Kontrak'
              : 'Files app (lokasi yang Anda pilih)';
          Get.snackbar(
            'Berhasil',
            'File disimpan di: $where',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
        } else {
          Get.snackbar(
            'Gagal',
            'File gagal disimpan.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.errorDark,
            colorText: AppColors.white,
          );
        }
      },
      onFailure: (failure) {
        hideLoadingOverlay();
        showError(failure);
      },
    ).whenComplete(() {
      isGeneratingContractTemplate.value = false;
    });
  }

  Future<void> submitContractDraft() async {
    if (isUploadingContract.value) return;
    final consultationId = project.value?.consultationInfo?.consultationId;
    final path = selectedContractPath.value;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'ID konsultasi tidak ditemukan'));
      return;
    }
    if (path == null || path.isEmpty) {
      showError(
        const ServerFailure(message: 'Pilih dokumen kontrak terlebih dahulu'),
      );
      return;
    }

    final file = File(path);
    if (!file.existsSync()) {
      showError(const ServerFailure(message: 'File kontrak tidak ditemukan'));
      return;
    }

    double contractValue = 0;
    List<Installment> installments;
    if (isPaidConsultation) {
      contractValue =
          _parseAmount(contractValueController.text) ?? _sumTermAmounts();
      if (contractValue <= 0) {
        showError(const ServerFailure(message: 'Nilai kontrak harus diisi'));
        return;
      }
      installments = _buildInstallments();
    } else {
      contractValue = 0;
      installments = _buildFreeInstallments();
    }

    final request = UploadContractRequest(
      contractValue: contractValue,
      installments: installments,
      fileUrl: null,
    );

    isUploadingContract.value = true;
    final isRevisionFlow =
        contracts.isNotEmpty &&
        contracts.last.status == ContractStatus.needRevision;

    await handleAsync(
      () => isRevisionFlow
          ? _uploadRevisedContractUseCase(
              UploadRevisedContractParam(
                consultationId: consultationId,
                request: request,
                file: file,
              ),
            )
          : _createContractDraftUseCase(
              UploadContractParam(
                consultationId: consultationId,
                file: file,
                request: request,
              ),
            ),
      onSuccess: (_) async {
        markContractUploaded();
        _clearContractInputs();
        Get.back();
        await fetchDetails();
      },
      onFailure: (failure) {
        showError(failure);
      },
    );
    isUploadingContract.value = false;
  }

  Future<void> downloadContract(ConsultationContractItem item) async {
    if (isDownloadingContract.value) return;
    final contractId = item.id;
    if (contractId == null || contractId.isEmpty) {
      showError(const ServerFailure(message: 'ID kontrak tidak tersedia'));
      return;
    }
    final versionId = item.versionId;
    if (versionId == null || versionId.isEmpty) {
      showError(
        const ServerFailure(message: 'Versi dokumen kontrak tidak tersedia'),
      );
      return;
    }

    isDownloadingContract.value = true;
    showLoadingOverlay(message: 'Mengunduh kontrak...', delay: Duration.zero);

    try {
      await handleAsync<DownloadedFile>(
        () => _downloadContractVersionUseCase(
          DownloadContractVersionParams(
            contractId: contractId,
            documentVersionId: versionId,
          ),
        ),
        onSuccess: (file) async {
          hideLoadingOverlay();
          final projectName = project.value?.projectName ?? 'Konsultasi';
          final saved = await _saveDownloadedFile(
            file: file,
            projectName: projectName,
            subDirectory: 'Kontrak',
            mimeType: 'application/octet-stream',
          );

          if (saved != null && saved.isNotEmpty) {
            final where = Platform.isAndroid
                ? 'Dokumen > PKP > $projectName > Kontrak'
                : 'Files app (lokasi yang Anda pilih)';
            Get.snackbar(
              'Berhasil',
              'File disimpan di: $where',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.successDark,
              colorText: AppColors.white,
            );
          } else {
            Get.snackbar(
              'Gagal',
              'File gagal disimpan.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.errorDark,
              colorText: AppColors.white,
            );
          }
        },
        onFailure: (failure) {
          hideLoadingOverlay();
          showError(failure);
        },
      );
    } finally {
      hideLoadingOverlay();
      isDownloadingContract.value = false;
    }
  }

  Future<void> _approveContract() async {
    if (contracts.isEmpty) return;
    final latest = contracts.last;
    final contractId = latest.id;
    if (contractId == null || contractId.isEmpty) {
      showError(const ServerFailure(message: 'ID kontrak tidak ditemukan'));
      return;
    }
    final approvedVersionId = latest.versionId;
    if (approvedVersionId == null || approvedVersionId.isEmpty) {
      showError(
        const ServerFailure(message: 'Versi dokumen kontrak tidak ditemukan'),
      );
      return;
    }
    isLoadingContracts.value = true;
    await handleAsync<Contract>(
      () => _approveContractUseCase(
        ApproveContractParams(
          contractId: contractId,
          approvedDocumentVersionId: approvedVersionId,
          revisionNotes: '-',
        ),
      ),
      onSuccess: (_) async {
        await fetchDetails();
      },
      onFailure: (failure) {
        showError(failure);
      },
    );
    isLoadingContracts.value = false;
  }

  Future<void> _requestContractRevision({String? notes}) async {
    if (contracts.isEmpty) return;
    final latest = contracts.last;
    final contractId = latest.id;
    if (contractId == null || contractId.isEmpty) {
      showError(const ServerFailure(message: 'ID kontrak tidak ditemukan'));
      return;
    }
    isLoadingContracts.value = true;
    await handleAsync<Contract>(
      () => _askContractRevisionUseCase(
        AskContractRevisionParams(contractId: contractId, revisionNotes: notes),
      ),
      onSuccess: (_) async {
        await fetchDetails();
      },
      onFailure: (error) {
        showError(error);
      },
    );
    isLoadingContracts.value = false;
  }

  Future<void> _signContract() async {
    if (contracts.isEmpty) return;
    final latest = contracts.last;
    final contractId = latest.id;
    if (contractId == null || contractId.isEmpty) {
      showError(const ServerFailure(message: 'ID kontrak tidak ditemukan'));
      return;
    }
    isLoadingContracts.value = true;
    await handleAsync<Contract>(
      () => _signContractUseCase(contractId),
      onSuccess: (_) async {
        await fetchDetails();
      },
      onFailure: (error) {
        showError(error);
      },
    );
    isLoadingContracts.value = false;
  }

  Future<void> _fetchDesignDocumentsIfNeeded({String? consultationId}) async {
    final effectiveConsultationId =
        consultationId ?? project.value?.consultationInfo?.consultationId;
    if (effectiveConsultationId == null ||
        effectiveConsultationId.isEmpty ||
        isLoadingDesigns.value) {
      return;
    }

    isLoadingDesigns.value = true;
    await handleAsync<List<DesignDocumentResponse>>(
      () => _getDesignDocumentVersionsUseCase(
        GetDesignDocumentVersionsParams(
          consultationId: effectiveConsultationId,
        ),
      ),
      onSuccess: (response) {
        draftDesigns.clear();
        finalDesigns.clear();
        response.reversed.toList().asMap().forEach((index, design) {
          draftDesigns.add(
            ConsultationDesignItem(
              id: design.designDocumentId,
              title: _designTitleForIndex(index),
              dateLabel:
                  Formatters.formatIsoDateTime(design.latestUploadedAt ?? '') ??
                  '',
              status: _mapDesignStatusFromApi(design.designDocumentStatus),
              rawStatus: design.designDocumentStatus,
              version: design.version ?? '',
            ),
          );
        });

        if (draftDesigns.lastOrNull?.status == DesignStatus.approved) {
          final approvedDesign = draftDesigns.last;
          finalDesigns.add(
            ConsultationDesignItem(
              id: approvedDesign.id,
              title: 'Final Desain',
              dateLabel: approvedDesign.dateLabel,
              status: approvedDesign.status,
              rawStatus: approvedDesign.rawStatus,
              version: approvedDesign.version ?? '',
            ),
          );
        }
      },
      onFailure: (error) {
        showError(error);
      },
    );
    isLoadingDesigns.value = false;
  }

  DesignStatus _mapDesignStatusFromApi(String? status) {
    switch ((status ?? '').toUpperCase()) {
      case 'SUBMITTED':
      case 'REQUEST_FOR_APPROVAL':
        return DesignStatus.awaitingApproval;
      case 'REVISION_REQUESTED':
        return DesignStatus.needsRevision;
      case 'APPROVED':
        return DesignStatus.approved;
      default:
        return DesignStatus.awaitingApproval;
    }
  }

  Future<String?> pickDesignFile(int index) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
      withData: false,
    );
    final file = result?.files.single;
    if (file == null) return null;

    final name = file.name;
    designFileNames[index].value = name;
    designFileControllers[index].text = name;
    designFilePaths[index].value = file.path;
    isDesignFormValid.value = designFilePaths.every(
      (design) => design.value?.isNotEmpty == true,
    );
    return name;
  }

  Future<void> _fetchInvoicesIfNeeded({String? consultationId}) async {
    final effectiveConsultationId =
        consultationId ?? project.value?.consultationInfo?.consultationId;
    if (effectiveConsultationId == null ||
        effectiveConsultationId.isEmpty ||
        isLoadingInvoices.value) {
      return;
    }
    isLoadingInvoices.value = true;
    await handleAsync<List<Payment>>(
      () => _getPaymentsUseCase(effectiveConsultationId),
      onSuccess: (response) {
        final mapped = response.map((payment) {
          final title = payment.termin != null
              ? 'Termin ${payment.termin}'
              : 'Invoice';
          final date =
              Formatters.formatIsoDate(
                payment.dueDate ?? payment.createdAt ?? '',
              ) ??
              '';
          return ConsultationInvoiceItem(
            title: title,
            dateLabel: date,
            status: _mapInvoiceStatus(payment.status),
            amount: (payment.amount ?? 0).toDouble(),
            method: payment.method ?? '-',
          );
        }).toList();
        invoices
          ..clear()
          ..addAll(mapped);
      },
      onFailure: (error) {
        showError(error);
      },
    );
    isLoadingInvoices.value = false;
  }

  InvoiceStatus _mapInvoiceStatus(String? status) {
    switch ((status ?? '').toUpperCase()) {
      case 'PAID':
      case 'SETTLED':
      case 'COMPLETED':
        return InvoiceStatus.paid;
      case 'MENUNGGU':
      case 'ESCROW_HOLD':
      default:
        return InvoiceStatus.unpaid;
    }
  }

  Future<String?> _saveDownloadedFile({
    required DownloadedFile file,
    required String projectName,
    required String subDirectory,
    required String mimeType,
  }) async {
    final tempPath = file.path;
    if (tempPath != null && tempPath.isNotEmpty) {
      try {
        final source = File(tempPath);
        if (await source.exists()) {
          final bytes = await source.readAsBytes();
          final saved = await saveToExternalProjectDocuments(
            projectName: projectName,
            fileName: file.fileName,
            bytes: bytes,
            subDirectory: subDirectory,
            mimeType: mimeType,
          );
          await source.delete().catchError((_) => source);
          if (saved != null && saved.isNotEmpty) {
            return saved;
          }
        }
      } catch (_) {}
    }

    if (file.bytes.isNotEmpty) {
      final saved = await saveToExternalProjectDocuments(
        projectName: projectName,
        fileName: file.fileName,
        bytes: file.bytes,
        subDirectory: subDirectory,
        mimeType: mimeType,
      );
      if (saved != null && saved.isNotEmpty) {
        return saved;
      }
    }

    return null;
  }

  Future<void> downloadDesign(ConsultationDesignItem item) async {
    if (isDownloadingDesign.value) return;
    final version = item.version;
    if (version == null || version.isEmpty) {
      showError(const ServerFailure(message: 'Versi desain tidak tersedia'));
      return;
    }
    isDownloadingDesign.value = true;
    showLoadingOverlay(message: 'Mengunduh desain...', delay: Duration.zero);
    try {
      await handleAsync<DownloadedFile>(
        () => _downloadDesignVersionUseCase(
          DownloadDesignVersionParams(
            version,
            project.value?.consultationInfo?.consultationId ?? '',
          ),
        ),
        onSuccess: (file) async {
          hideLoadingOverlay();
          final projectName = project.value?.projectName ?? 'Konsultasi';
          final saved = await _saveDownloadedFile(
            file: file,
            projectName: projectName,
            subDirectory: 'Desain',
            mimeType: 'application/zip',
          );

          if (saved != null && saved.isNotEmpty) {
            final where = Platform.isAndroid
                ? 'Dokumen > PKP > $projectName > Desain'
                : 'Files app (lokasi yang Anda pilih)';
            Get.snackbar(
              'Berhasil',
              'File disimpan di: $where',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.successDark,
              colorText: AppColors.white,
            );
          } else {
            Get.snackbar(
              'Gagal',
              'File gagal disimpan.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColors.errorDark,
              colorText: AppColors.white,
            );
          }
        },
        onFailure: (failure) {
          hideLoadingOverlay();
          showError(failure);
        },
      );
    } finally {
      hideLoadingOverlay();
      isDownloadingDesign.value = false;
    }
  }

  @override
  void onClose() {
    contractValueController.removeListener(_recomputePaymentValidation);
    for (final controller in termAmountControllers) {
      controller.removeListener(_recomputePaymentValidation);
    }
    for (final controller in termDueDateControllers) {
      controller.removeListener(_recomputePaymentValidation);
      controller.dispose();
    }
    contractValueController.dispose();
    super.onClose();
  }

  void markContractUploaded() {
    _updateHasUploadedContract();
  }

  void approveLatestContract() {
    _approveContract();
  }

  void signLatestContract() {
    _signContract();
  }

  void reviseLatestContract() {
    _requestContractRevision(notes: '-');
  }

  Future<void> approveLatestDesign() async {
    final design = draftDesigns.last;
    final designId = design.id;
    if (designId == null || designId.isEmpty) {
      showError(const ServerFailure(message: 'Dokumen desain tidak ditemukan'));
      return;
    }
    isLoadingDesigns.value = true;
    await handleAsync<DesignDocumentApprovalResponse>(
      () => _approveDesignDocumentsUseCase(
        ApproveDesignParams(
          designDocumentId: designId,
          approvedVersion: design.version,
          revisionNotes: '-',
        ),
      ),
      onSuccess: (_) async {
        await fetchDetails();
      },
      onFailure: showError,
    );
    isLoadingDesigns.value = false;
  }

  Future<void> reviseLatestDesign() async {
    final design = draftDesigns.last;
    final consultationId = project.value?.consultationInfo?.consultationId;
    final designId = design.id;
    if (designId == null || designId.isEmpty) {
      showError(const ServerFailure(message: 'Dokumen desain tidak ditemukan'));
      return;
    }
    isLoadingDesigns.value = true;
    await handleAsync<DesignDocumentRevisionResponse>(
      () => _askDesignRevisionUseCase(
        AskDesignRevisionParams(
          consultationId: consultationId ?? '',
          designDocumentId: designId,
          notes: '-',
        ),
      ),
      onSuccess: (_) async {
        await fetchDetails();
      },
      onFailure: showError,
    );

    isLoadingDesigns.value = false;
  }

  Future<void> submitDesignsDraft() async {
    if (isUploadingDesign.value) return;
    final consultationId = project.value?.consultationInfo?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'ID konsultasi tidak ditemukan'));
      return;
    }

    final fileDedPath = designFilePaths[0].value;
    final fileRabPath = designFilePaths[1].value;
    final fileBoqPath = designFilePaths[2].value;

    if ((fileDedPath ?? '').isEmpty &&
        (fileRabPath ?? '').isEmpty &&
        (fileBoqPath ?? '').isEmpty) {
      showError(
        const ServerFailure(
          message: 'Minimal satu dokumen desain harus dipilih',
        ),
      );
      return;
    }

    File? dedFile;
    File? rabFile;
    File? boqFile;
    if (fileDedPath != null && fileDedPath.isNotEmpty) {
      dedFile = File(fileDedPath);
    }
    if (fileRabPath != null && fileRabPath.isNotEmpty) {
      rabFile = File(fileRabPath);
    }
    if (fileBoqPath != null && fileBoqPath.isNotEmpty) {
      boqFile = File(fileBoqPath);
    }

    isUploadingDesign.value = true;
    await handleAsync<UploadDesignDocumentResponse>(
      () => _uploadDesignDocumentsUseCase(
        UploadDesignDocumentsParams(
          consultationId: consultationId,
          fileDed: dedFile,
          fileRab: rabFile,
          fileBoq: boqFile,
        ),
      ),
      onSuccess: (_) async {
        _clearDesignInputs();
        Get.back();
        fetchDetails();
      },
      onFailure: (failure) {
        showError(failure);
      },
    );
    isUploadingDesign.value = false;
  }

  void _clearDesignInputs() {
    for (final controller in designFileControllers) {
      controller.clear();
    }
    for (final name in designFileNames) {
      name.value = null;
    }
    for (final path in designFilePaths) {
      path.value = null;
    }
    designNotesController.clear();
  }

  void _clearContractInputs() {
    contractController.clear();
    selectedContractName.value = null;
    selectedContractPath.value = null;
    contractValueController.clear();
    for (final controller in termAmountControllers) {
      controller.clear();
    }
    for (final controller in termDueDateControllers) {
      controller.clear();
    }
    isPaymentTermsValid.value = false;
  }

  void _updateHasUploadedContract() {
    hasUploadedContract.value =
        contracts.isNotEmpty &&
        contracts.last.status != ContractStatus.needRevision &&
        contracts.last.status != ContractStatus.unknown;
  }

  int get revisionAttemptsUsed => contracts
      .where((contract) => contract.status == ContractStatus.needRevision)
      .length;

  int get designRevisionAttemptsUsed => draftDesigns
      .where((design) => design.status == DesignStatus.needsRevision)
      .length;

  String _contractTitleForIndex(int index) {
    if (index == 0) return 'Kontrak Awal';
    if (index == 1) return 'Revisi Kontrak Pertama';
    if (index == 2) return 'Revisi Kontrak Kedua';
    return 'Final Kontrak';
  }

  String _designTitleForIndex(int index) {
    if (index == 0) return 'Preliminary Desain';
    if (index == 1) return 'Revisi Desain Pertama';
    if (index == 2) return 'Revisi Desain Kedua';
    return 'Final Desain';
  }

  Future<void> startChatWithConsultant() async {
    final consultantId = consultation.value?.consultantId;
    if (consultantId == null) {
      showError(const ServerFailure(message: 'Konsultan tidak ditemukan'));
      return;
    }
    final consultantName =
        consultation.value?.consultantName?.trim() ?? 'Konsultan';

    await handleAsync<CreateChatRoomResponse>(
      () => _createDirectChatRoomUseCase(consultantId),
      onSuccess: (room) {
        navigateTo(
          AppRoutes.chat,
          arguments: ChatArgs(name: consultantName, roomId: room.id),
        );
      },
      onFailure: showError,
    );
  }
}

class ConsultationContractItem {
  const ConsultationContractItem({
    required this.id,
    this.versionId,
    this.fileId,
    required this.title,
    required this.dateLabel,
    required this.version,
    required this.status,
    required this.rawStatus,
  });

  final String? id;
  final String? versionId;
  final String? fileId;
  final String title;
  final String dateLabel;
  final String version;
  final ContractStatus status;
  final String? rawStatus;
}

class ConsultationDesignItem {
  const ConsultationDesignItem({
    required this.id,
    required this.title,
    required this.dateLabel,
    required this.status,
    this.rawStatus,
    this.version,
  });

  final String? id;
  final String title;
  final String dateLabel;
  final DesignStatus status;
  final String? rawStatus;
  final String? version;
}

class ConsultationInvoiceItem {
  const ConsultationInvoiceItem({
    required this.title,
    required this.dateLabel,
    required this.status,
    required this.amount,
    required this.method,
  });

  final String title;
  final String dateLabel;
  final InvoiceStatus status;
  final double amount;
  final String method;
}

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
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/request/create_contract_draft_request.dart';
import 'package:pkp_hub/data/models/response/consultation_details_response.dart';
import 'package:pkp_hub/data/models/response/contract_version_response.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/data/models/response/design_document_response.dart';
import 'package:pkp_hub/data/models/response/upload_design_document_response.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/get_consultation_detail_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/approve_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/ask_contract_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/create_contract_draft_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/get_contract_versions_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/sign_contract_use_case.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_param.dart';
import 'package:pkp_hub/domain/usecases/design_document/approve_design_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/ask_design_revision_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/download_design_version_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/get_design_document_versions_use_case.dart';
import 'package:pkp_hub/domain/usecases/design_document/upload_design_documents_use_case.dart';
import 'package:pkp_hub/domain/usecases/files/download_file_use_case.dart';

enum ConsultationDetailStep { contract, draftDesign, finalDesign, invoice }

enum ContractStatus {
  requestForApproval,
  revisionRequested,
  approved,
  homeownerSigned,
  consultantSigned,
  signed,
  unknown,
}

enum DesignStatus { awaitingApproval, approved, needsRevision }

enum InvoiceStatus { unpaid, paid }

class ConsultationDetailsController extends BaseController {
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
  final RxBool hasUploadedContract = false.obs;
  final UserStorage _userStorage;
  final Rxn<ConsultationDetailsResponse> consultation =
      Rxn<ConsultationDetailsResponse>();
  final Rxn<Project> project = Rxn<Project>();

  final RxList<ConsultationContractItem> contracts =
      <ConsultationContractItem>[].obs;
  final RxList<ConsultationDocumentItem> draftDesigns =
      <ConsultationDocumentItem>[].obs;
  final RxList<ConsultationDocumentItem> finalDesigns =
      <ConsultationDocumentItem>[].obs;
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
  final List<TextEditingController> draftFileControllers = List.generate(
    3,
    (_) => TextEditingController(),
  );
  final List<RxnString> draftFileNames = List.generate(3, (_) => RxnString());
  final List<RxnString> draftFilePaths = List.generate(3, (_) => RxnString());
  final TextEditingController draftNotesController = TextEditingController();

  ConsultationDetailsController(
    this._userStorage,
    this._createDirectChatRoomUseCase,
    this._getConsultationDetailUseCase,
    this._getContractVersionsUseCase,
    this._createContractDraftUseCase,
    this._approveContractUseCase,
    this._askContractRevisionUseCase,
    this._signContractUseCase,
    this._uploadDesignDocumentsUseCase,
    this._approveDesignDocumentsUseCase,
    this._askDesignRevisionUseCase,
    this._getDesignDocumentVersionsUseCase,
    this._downloadDesignVersionUseCase,
    this._downloadFileUseCase,
  );

  final CreateDirectChatRoomUseCase _createDirectChatRoomUseCase;
  final GetConsultationDetailUseCase _getConsultationDetailUseCase;
  final GetContractVersionsUseCase _getContractVersionsUseCase;
  final CreateContractDraftUseCase _createContractDraftUseCase;
  final ApproveContractUseCase _approveContractUseCase;
  final AskContractRevisionUseCase _askContractRevisionUseCase;
  final SignContractUseCase _signContractUseCase;
  final UploadDesignDocumentsUseCase _uploadDesignDocumentsUseCase;
  final ApproveDesignDocumentsUseCase _approveDesignDocumentsUseCase;
  final AskDesignRevisionUseCase _askDesignRevisionUseCase;
  final GetDesignDocumentVersionsUseCase _getDesignDocumentVersionsUseCase;
  final DownloadDesignVersionUseCase _downloadDesignVersionUseCase;
  final DownloadFileUseCase _downloadFileUseCase;

  final TextEditingController contractController = TextEditingController();
  final RxBool isPaymentTermsValid = false.obs;

  void _hydrateFromArgs() {
    final args = Get.arguments;
    if (args is ConsultationDetailsArgs) {
      project.value = args.project;
    } else if (args is Map<String, dynamic>) {
      project.value = args['project'] as Project?;
    }
  }

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

  Future<void> _loadUserRole() async {
    userRole.value = await _userStorage.getRole() ?? UserRole.unknown;
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
    }
  }

  Future<void> handleRefresh() async {
    await fetchDetails();
  }

  Future<void> fetchDetails({bool isInitialLoad = false}) async {
    final id = project.value?.consultationInfo?.consultationId;
    if (id == null || id.isEmpty) {
      if (!isInitialLoad) {
        showError(
          const ServerFailure(message: 'ID konsultasi tidak ditemukan'),
        );
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
          _fetchContractsIfNeeded(
            consultationId: detail.consultationId,
            projectId: detail.projectId ?? project.value?.projectId,
            status: detail.status,
          );
        } else if ((selectedStep.value == ConsultationDetailStep.draftDesign ||
                selectedStep.value == ConsultationDetailStep.finalDesign) &&
            !isLoadingDesigns.value) {
          _fetchDesignDocumentsIfNeeded(consultationId: detail.consultationId);
        }
      },
      onFailure: showError,
    );
    isLoading.value = false;
  }

  Future<void> _fetchContractsIfNeeded({
    String? consultationId,
    String? projectId,
    String? status,
  }) async {
    final effectiveConsultationId =
        consultationId ?? project.value?.consultationInfo?.consultationId;
    final effectiveProjectId = projectId ?? project.value?.projectId;
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
        final mapped = response.asMap().entries.map((entry) {
          final index = entry.key;
          final contract = entry.value;
          final info = contract.documentInfo;
          return ConsultationContractItem(
            id: contract.id,
            fileId: info?.fileId,
            title: _contractTitleForIndex(index),
            dateLabel: Formatters.formatIsoDate(info?.uploadedAt ?? '') ?? '',
            status: _mapContractStatus(contract.contractStatus),
            rawStatus: contract.contractStatus,
          );
        }).toList();
        contracts
          ..clear()
          ..addAll(mapped);
        _updateHasUploadedContract();
      },
      onFailure: showError,
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
      onSuccess: (versions) {
        draftDesigns.clear();
        finalDesigns.clear();
        for (final version in versions) {
          for (final doc in version.documents) {
            final status = _mapDesignStatusFromApi(doc.status);
            final item = ConsultationDocumentItem(
              id: doc.id,
              title:
                  '${doc.documentType ?? 'Desain'} v${doc.version ?? version.version ?? ''}',
              dateLabel:
                  Formatters.formatIsoDateTime(doc.uploadedAt ?? '') ?? '',
              status: status,
              rawStatus: doc.status,
              documentType: doc.documentType,
              fileUrl: doc.fileUrl,
              fileId: doc.fileId,
              version: doc.version ?? version.version,
            );
            if (status == DesignStatus.approved) {
              finalDesigns.add(item);
            } else {
              draftDesigns.add(item);
            }
          }
        }
      },
      onFailure: showError,
    );
    isLoadingDesigns.value = false;
  }

  ContractStatus _mapContractStatus(String? status) {
    switch ((status ?? '').toUpperCase()) {
      case 'UPLOADED':
        return ContractStatus.requestForApproval;
      case 'MENUNGGU_APPROVAL_KONTRAK':
      case 'REQUEST_FOR_APPROVAL':
        return ContractStatus.requestForApproval;
      case 'REVISION_REQUESTED':
        return ContractStatus.revisionRequested;
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

  DesignStatus _mapDesignStatusFromApi(String? status) {
    switch ((status ?? '').toUpperCase()) {
      case 'SUBMITTED':
      case 'UPLOADED':
        return DesignStatus.awaitingApproval;
      case 'REVISION_REQUESTED':
        return DesignStatus.needsRevision;
      case 'APPROVED':
        return DesignStatus.approved;
      default:
        return DesignStatus.awaitingApproval;
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

  Future<void> downloadContract(ConsultationContractItem item) async {
    if (isDownloadingContract.value) return;
    final fileId = item.fileId;
    if (fileId == null || fileId.isEmpty) {
      showError(const ServerFailure(message: 'File kontrak tidak tersedia'));
      return;
    }
    isDownloadingContract.value = true;
    showLoadingOverlay(message: 'Mengunduh kontrak...', delay: Duration.zero);
    try {
      await handleAsync<DownloadedFile>(
        () => _downloadFileUseCase(DownloadFileParams(fileId: fileId)),
        onSuccess: (file) async {
          hideLoadingOverlay();
          final projectName = project.value?.projectName ?? 'Konsultasi';
          final bytes = file.bytes;
          final saved = await saveToExternalProjectDocuments(
            projectName: projectName,
            fileName: file.fileName,
            bytes: bytes,
            subDirectory: 'Kontrak',
            mimeType: 'application/pdf',
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

  Future<void> downloadDesign(ConsultationDocumentItem item) async {
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
        () =>
            _downloadDesignVersionUseCase(DownloadDesignVersionParams(version)),
        onSuccess: (file) async {
          hideLoadingOverlay();
          final projectName = project.value?.projectName ?? 'Konsultasi';
          final bytes = file.bytes;
          final saved = await saveToExternalProjectDocuments(
            projectName: projectName,
            fileName: file.fileName,
            bytes: bytes,
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

  bool get isConsultant => userRole.value == UserRole.consultant;

  void downloadContractTemplate() {
    Get.snackbar(
      'Unduh Berhasil',
      'Template kontrak berhasil diunduh',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.successDark,
      colorText: AppColors.white,
    );
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

  Future<bool> submitPaymentTerms() async {
    if (isUploadingContract.value) return false;
    final consultationId = project.value?.consultationInfo?.consultationId;
    final path = selectedContractPath.value;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'ID konsultasi tidak ditemukan'));
      return false;
    }
    if (path == null || path.isEmpty) {
      showError(
        const ServerFailure(message: 'Pilih dokumen kontrak terlebih dahulu'),
      );
      return false;
    }

    final file = File(path);
    if (!file.existsSync()) {
      showError(const ServerFailure(message: 'File kontrak tidak ditemukan'));
      return false;
    }

    final contractValue =
        _parseAmount(contractValueController.text) ?? _sumTermAmounts();
    if (contractValue <= 0) {
      showError(const ServerFailure(message: 'Nilai kontrak harus diisi'));
      return false;
    }
    final installments = _buildInstallments();

    final request = CreateContractDraftRequest(
      contractValue: contractValue,
      installments: installments,
      fileUrl: null,
    );

    isUploadingContract.value = true;
    var success = false;
    await handleAsync(
      () => _createContractDraftUseCase(
        UploadContractParam(
          consultationId: consultationId,
          file: file,
          request: request,
        ),
      ),
      onSuccess: (_) async {
        await _fetchContractsIfNeeded(
          consultationId: consultationId,
          projectId: project.value?.projectId,
        );
        markContractUploaded();
        success = true;
        // Close payment terms sheet after successful upload
        Get.back();
      },
      onFailure: showError,
    );
    isUploadingContract.value = false;
    return success;
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
    _handleHomeOwnerApproval();
  }

  void signLatestContract() {
    _handleSignContract();
  }

  void reviseLatestContract() {
    _handleRequestRevision();
  }

  Future<void> approveLatestDraft() async {
    final item = _latestDraftAwaitingAction();
    final designId = item?.id;
    if (designId == null || designId.isEmpty) {
      showError(const ServerFailure(message: 'Dokumen desain tidak ditemukan'));
      return;
    }
    isLoadingDesigns.value = true;
    await handleAsync<void>(
      () => _approveDesignDocumentsUseCase(designId),
      onSuccess: (_) async {
        await _fetchDesignDocumentsIfNeeded(
          consultationId: project.value?.consultationInfo?.consultationId,
        );
      },
      onFailure: showError,
    );
    isLoadingDesigns.value = false;
  }

  Future<void> reviseLatestDraft() async {
    final item = _latestDraftAwaitingAction();
    final designId = item?.id;
    if (designId == null || designId.isEmpty) {
      showError(const ServerFailure(message: 'Dokumen desain tidak ditemukan'));
      return;
    }
    isLoadingDesigns.value = true;
    await handleAsync<void>(
      () => _askDesignRevisionUseCase(
        AskDesignRevisionParams(
          designDocumentId: designId,
          notes: draftNotesController.text.isNotEmpty
              ? draftNotesController.text
              : null,
        ),
      ),
      onSuccess: (_) async {
        await _fetchDesignDocumentsIfNeeded(
          consultationId: project.value?.consultationInfo?.consultationId,
        );
      },
      onFailure: showError,
    );
    isLoadingDesigns.value = false;
  }

  Future<String?> pickDraftFileCustom(int index) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
      withData: false,
    );
    final file = result?.files.single;
    if (file == null) return null;

    final name = file.name;
    draftFileNames[index].value = name;
    draftFileControllers[index].text = name;
    draftFilePaths[index].value = file.path;
    return name;
  }

  Future<void> submitDraftDesigns() async {
    if (isUploadingDesign.value) return;
    final consultationId = project.value?.consultationInfo?.consultationId;
    if (consultationId == null || consultationId.isEmpty) {
      showError(const ServerFailure(message: 'ID konsultasi tidak ditemukan'));
      return;
    }

    final fileDedPath = draftFilePaths[0].value;
    final fileRabPath = draftFilePaths[1].value;
    final fileBoqPath = draftFilePaths[2].value;

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
        _clearDraftInputs();
        await _fetchDesignDocumentsIfNeeded(consultationId: consultationId);
      },
      onFailure: showError,
    );
    isUploadingDesign.value = false;
  }

  void _clearDraftInputs() {
    for (final controller in draftFileControllers) {
      controller.clear();
    }
    for (final name in draftFileNames) {
      name.value = null;
    }
    for (final path in draftFilePaths) {
      path.value = null;
    }
    draftNotesController.clear();
  }

  void _updateHasUploadedContract() {
    hasUploadedContract.value =
        contracts.isNotEmpty &&
        contracts.last.status != ContractStatus.revisionRequested &&
        contracts.last.status != ContractStatus.unknown;
  }

  ConsultationDocumentItem? _latestDraftAwaitingAction() {
    if (draftDesigns.isEmpty) return null;
    for (final item in draftDesigns.reversed) {
      if (item.status == DesignStatus.awaitingApproval ||
          item.status == DesignStatus.needsRevision) {
        return item;
      }
    }
    return null;
  }

  int get revisionAttemptsUsed => contracts
      .where((c) => (c.rawStatus ?? '').toUpperCase().contains('REVISION'))
      .length;

  int get designRevisionAttemptsUsed => draftDesigns
      .where((d) => (d.rawStatus ?? '').toUpperCase().contains('REVISION'))
      .length;

  String _contractTitleForIndex(int index) {
    if (index == 0) return 'Kontrak Awal';
    if (index == 1) return 'Revisi Kontrak Pertama';
    if (index == 2) return 'Revisi Kontrak Kedua';
    return 'Final Kontrak';
  }

  Future<void> _handleHomeOwnerApproval() async {
    if (contracts.isEmpty) return;
    final latest = contracts.last;
    final contractId = latest.id;
    if (contractId == null || contractId.isEmpty) {
      showError(const ServerFailure(message: 'ID kontrak tidak ditemukan'));
      return;
    }
    final approvedVersionId = latest.id;
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
        ),
      ),
      onSuccess: (_) async {
        await _fetchContractsIfNeeded(
          consultationId: project.value?.consultationInfo?.consultationId,
          projectId: project.value?.projectId,
        );
      },
      onFailure: showError,
    );
    isLoadingContracts.value = false;
  }

  Future<void> _handleRequestRevision({String? notes}) async {
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
        await _fetchContractsIfNeeded(
          consultationId: project.value?.consultationInfo?.consultationId,
          projectId: project.value?.projectId,
        );
      },
      onFailure: showError,
    );
    isLoadingContracts.value = false;
  }

  Future<void> _handleSignContract() async {
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
        await _fetchContractsIfNeeded(
          consultationId: project.value?.consultationInfo?.consultationId,
          projectId: project.value?.projectId,
        );
      },
      onFailure: showError,
    );
    isLoadingContracts.value = false;
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
    this.fileId,
    required this.title,
    required this.dateLabel,
    required this.status,
    required this.rawStatus,
  });

  final String? id;
  final String? fileId;
  final String title;
  final String dateLabel;
  final ContractStatus status;
  final String? rawStatus;
}

class ConsultationDocumentItem {
  const ConsultationDocumentItem({
    required this.id,
    required this.title,
    required this.dateLabel,
    required this.status,
    this.rawStatus,
    this.documentType,
    this.fileUrl,
    this.fileId,
    this.version,
  });

  final String? id;
  final String title;
  final String dateLabel;
  final DesignStatus status;
  final String? rawStatus;
  final String? documentType;
  final String? fileUrl;
  final String? fileId;
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

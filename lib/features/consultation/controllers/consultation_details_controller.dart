import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/core/utils/logger.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_details_use_case.dart';

enum ConsultationDetailStep { contract, draftDesign, finalDesign, invoice }

enum ContractStatus {
  awaitingApproval,
  needsRevision,
  approvedNeedSign,
  approvedSigned,
}

enum DesignStatus { awaitingApproval, approved, needsRevision }

enum InvoiceStatus { unpaid, paid }

class ConsultationDetailsController extends BaseController {
  late final Project project;
  final RxString homeOwnerName = ''.obs;
  final Rx<ConsultationDetailStep> selectedStep =
      ConsultationDetailStep.contract.obs;
  final Rxn<UserRole> userRole = Rxn<UserRole>();
  final RxBool hasUploadedContract = false.obs;
  final UserStorage _userStorage;
  final Rxn<Consultation> consultationInfo = Rxn<Consultation>();

  final RxList<ConsultationContractItem> contracts =
      <ConsultationContractItem>[].obs;
  final RxList<ConsultationDocumentItem> draftDesigns =
      <ConsultationDocumentItem>[].obs;
  final RxList<ConsultationDocumentItem> finalDesigns =
      <ConsultationDocumentItem>[].obs;
  final RxList<ConsultationInvoiceItem> invoices =
      <ConsultationInvoiceItem>[].obs;

  final RxnString selectedContractName = RxnString();
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
  final TextEditingController draftNotesController = TextEditingController();

  final GetProjectDetailsUseCase _getDetailsUseCase;

  final _logger = Logger();

  ConsultationDetailsController(
    this._userStorage,
    this._createDirectChatRoomUseCase,
    this._getDetailsUseCase,
  );

  final CreateDirectChatRoomUseCase _createDirectChatRoomUseCase;

  final TextEditingController contractController = TextEditingController();

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
    final args = Get.arguments;
    if (args is ConsultationDetailsArgs) {
      project = args.project;
    } else if (args is Map<String, dynamic>) {
      final mapProject = args['project'] as Project?;
      final projectId = args['projectId'] as String?;
      homeOwnerName.value = args['homeOwnerName'] ?? 'Pemilik Rumah';
      project =
          mapProject ??
          Project(
            projectId: projectId,
            name: args['projectName'] as String?,
            location: null,
          );
    } else {
      project = const Project();
    }

    fetchDetails();
    _applyMockScenario(project.projectId);
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    userRole.value = await _userStorage.getRole() ?? UserRole.unknown;
  }

  void selectStep(ConsultationDetailStep step) {
    selectedStep.value = step;
  }

  Future<void> handleRefresh() async {
    // We call fetchDetails and let it handle the loading state and updates.
    await fetchDetails();
  }

  Future<void> fetchDetails({bool isInitialLoad = false}) async {
    await handleAsync<ProjectDetailsResponse>(
      () => _getDetailsUseCase(project.projectId!),
      onSuccess: (data) {
        final newName = data.userInfo?['name'];

        homeOwnerName.value = newName ?? 'Pemilik Rumah';

        final consultation = data.consultation;
        _logger.d('Consultation: ${consultation?.consultantName}');
        if(consultation != null){
          consultationInfo.value = consultation;
        }
      },
    );
  }

  // --- Mocked download helpers ---

  Future<void> downloadContract(ConsultationContractItem item) async {
    _showDownloadSnack('Dokumen kontrak "${item.title}" berhasil diunduh');
  }

  Future<void> downloadDesign(ConsultationDocumentItem item) async {
    _showDownloadSnack('Dokumen desain "${item.title}" berhasil diunduh');
  }

  void _showDownloadSnack(String message) {
    Get.snackbar(
      'Unduh Dokumen',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.successDark,
      colorText: AppColors.white,
    );
  }

  bool get isConsultant => userRole.value == UserRole.consultant;

  void downloadContractTemplate() {
    _showDownloadSnack('Template kontrak berhasil diunduh');
  }

  void pickContractFile() {
    pickContractFileCustom();
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
    contractController.text = name;
    return name;
  }

  void submitContractUpload() {
    markContractUploaded();
  }

  void markContractUploaded() {
    _updateHasUploadedContract();
  }

  void submitPaymentTerms() {
    _addUploadedContract();
    _updateHasUploadedContract();
  }

  void approveLatestContract() {
    if (contracts.isEmpty) return;
    final last = contracts.last;
    contracts[contracts.length - 1] = ConsultationContractItem(
      title: last.title,
      dateLabel: last.dateLabel,
      status: ContractStatus.approvedNeedSign,
    );
    _updateHasUploadedContract();
  }

  void signLatestContract() {
    if (contracts.isEmpty) return;
    final last = contracts.last;
    contracts[contracts.length - 1] = ConsultationContractItem(
      title: last.title,
      dateLabel: last.dateLabel,
      status: ContractStatus.approvedSigned,
    );
    _updateHasUploadedContract();
  }

  void reviseLatestContract() {
    if (contracts.isEmpty) return;
    final last = contracts.last;
    contracts[contracts.length - 1] = ConsultationContractItem(
      title: last.title,
      dateLabel: last.dateLabel,
      status: ContractStatus.needsRevision,
    );
    _updateHasUploadedContract();
  }

  void approveLatestDraft() {
    if (draftDesigns.isEmpty) return;
    final last = draftDesigns.last;
    draftDesigns[draftDesigns.length - 1] = ConsultationDocumentItem(
      title: last.title,
      dateLabel: last.dateLabel,
      status: DesignStatus.approved,
    );
    finalDesigns.add(
      ConsultationDocumentItem(
        title: last.title,
        dateLabel: last.dateLabel,
        status: DesignStatus.approved,
      ),
    );
  }

  void reviseLatestDraft() {
    if (draftDesigns.isEmpty) return;
    final last = draftDesigns.last;
    draftDesigns[draftDesigns.length - 1] = ConsultationDocumentItem(
      title: last.title,
      dateLabel: last.dateLabel,
      status: DesignStatus.needsRevision,
    );
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
    return name;
  }

  void submitDraftDesigns() {
    final now = DateFormat('dd MMM yyyy').format(DateTime.now());
    final names = draftFileControllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();
    final title = names.isNotEmpty
        ? 'Draft Desain (${names.length} file)'
        : 'Draft Desain';

    draftDesigns.add(
      _designItem(title, DesignStatus.awaitingApproval, date: now),
    );
  }

  void _addUploadedContract() {
    final title = selectedContractName.value?.isNotEmpty == true
        ? selectedContractName.value!
        : 'Kontrak Baru';
    contracts.add(
      _contractItem(
        title,
        ContractStatus.awaitingApproval,
        date: DateFormat('dd MMM yyyy').format(DateTime.now()),
      ),
    );
    _updateHasUploadedContract();
  }

  void _updateHasUploadedContract() {
    hasUploadedContract.value =
        contracts.isNotEmpty &&
        contracts.last.status == ContractStatus.awaitingApproval;
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
    }
  }

  Future<void> startChatWithConsultant() async {
    final consultantId = consultationInfo.value?.consultantId;
    if (consultantId == null) {
      showError(const ServerFailure(message: 'Konsultan tidak ditemukan'));
      return;
    }
    final consultantName =
        consultationInfo.value?.consultantName?.trim() ?? 'Konsultan';

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
    required this.title,
    required this.dateLabel,
    required this.status,
  });

  final String title;
  final String dateLabel;
  final ContractStatus status;
}

class ConsultationDocumentItem {
  const ConsultationDocumentItem({
    required this.title,
    required this.dateLabel,
    required this.status,
  });

  final String title;
  final String dateLabel;
  final DesignStatus status;
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

ConsultationContractItem _contractItem(
  String title,
  ContractStatus status, {
  String date = '15 Nov 2025',
}) {
  return ConsultationContractItem(
    title: title,
    dateLabel: date,
    status: status,
  );
}

ConsultationDocumentItem _designItem(
  String title,
  DesignStatus status, {
  String date = '20 Nov 2025',
}) {
  return ConsultationDocumentItem(
    title: title,
    dateLabel: date,
    status: status,
  );
}

ConsultationInvoiceItem _invoiceItem(
  String title,
  InvoiceStatus status, {
  String date = '10 Des 2025',
  double amount = 5000000,
  String method = 'QRIS',
}) {
  return ConsultationInvoiceItem(
    title: title,
    dateLabel: date,
    status: status,
    amount: amount,
    method: method,
  );
}

extension on ConsultationDetailsController {
  void _applyMockScenario(String? scenarioId) {
    contracts.clear();
    draftDesigns.clear();
    finalDesigns.clear();
    invoices.clear();

    switch (scenarioId) {
      case 'A0':
        break;
      case 'A1':
        contracts.add(
          _contractItem('Kontrak 1', ContractStatus.awaitingApproval),
        );
        break;
      case 'A2':
        contracts.addAll([
          _contractItem('Kontrak Revisi 1', ContractStatus.needsRevision),
          _contractItem('Kontrak Approval 1', ContractStatus.awaitingApproval),
        ]);
        break;
      case 'A3':
        contracts.addAll([
          _contractItem('Kontrak Revisi 1', ContractStatus.needsRevision),
          _contractItem('Kontrak Revisi 2', ContractStatus.needsRevision),
          _contractItem('Kontrak Approval 1', ContractStatus.awaitingApproval),
        ]);
        break;
      case 'A4':
        contracts.addAll([
          _contractItem('Kontrak Revisi 1', ContractStatus.needsRevision),
          _contractItem('Kontrak Revisi 2', ContractStatus.needsRevision),
          _contractItem('Kontrak Revisi 3', ContractStatus.needsRevision),
          _contractItem('Kontrak Approval 1', ContractStatus.awaitingApproval),
        ]);
        break;
      case 'A5':
        contracts.addAll([
          _contractItem('Kontrak Revisi 1', ContractStatus.needsRevision),
          _contractItem('Kontrak Revisi 2', ContractStatus.needsRevision),
          _contractItem('Kontrak Revisi 3', ContractStatus.needsRevision),
          _contractItem('Kontrak Disetujui', ContractStatus.approvedNeedSign),
        ]);
        break;
      case 'A6':
        contracts.addAll([
          _contractItem('Kontrak Revisi 1', ContractStatus.needsRevision),
          _contractItem('Kontrak Revisi 2', ContractStatus.needsRevision),
          _contractItem('Kontrak Revisi 3', ContractStatus.needsRevision),
          _contractItem(
            'Kontrak Ditandatangani',
            ContractStatus.approvedSigned,
          ),
        ]);
        break;
      case 'A7':
        _applyMockScenario('A6');
        draftDesigns.add(
          _designItem('Draft Desain 1', DesignStatus.awaitingApproval),
        );
        break;
      case 'A8':
        _applyMockScenario('A6');
        draftDesigns.addAll([
          _designItem('Draft Desain Revisi 1', DesignStatus.needsRevision),
          _designItem('Draft Desain Approval 1', DesignStatus.awaitingApproval),
        ]);
        break;
      case 'A9':
        _applyMockScenario('A6');
        draftDesigns.addAll([
          _designItem('Draft Desain Revisi 1', DesignStatus.needsRevision),
          _designItem('Draft Desain Revisi 2', DesignStatus.needsRevision),
          _designItem('Draft Desain Approval 1', DesignStatus.awaitingApproval),
        ]);
        break;
      case 'A10':
      case 'A11':
        _applyMockScenario('A6');
        draftDesigns.addAll([
          _designItem('Draft Desain Revisi 1', DesignStatus.needsRevision),
          _designItem('Draft Desain Revisi 2', DesignStatus.needsRevision),
          _designItem('Draft Desain Revisi 3', DesignStatus.needsRevision),
          _designItem('Draft Desain Approval 1', DesignStatus.awaitingApproval),
        ]);
        break;
      case 'A12':
        _applyMockScenario('A6');
        draftDesigns.addAll([
          _designItem('Draft Desain Revisi 1', DesignStatus.needsRevision),
          _designItem('Draft Desain Revisi 2', DesignStatus.needsRevision),
          _designItem('Draft Desain Revisi 3', DesignStatus.needsRevision),
          _designItem('Draft Desain Disetujui', DesignStatus.approved),
        ]);
        break;
      case 'A13':
        _applyMockScenario('A12');
        finalDesigns.add(
          _designItem(
            'Final Desain 1',
            DesignStatus.approved,
            date: '05 Des 2025',
          ),
        );
        break;
      case 'A14':
        _applyMockScenario('A13');
        invoices.add(
          _invoiceItem(
            'Invoice 1',
            InvoiceStatus.unpaid,
            date: '10 Des 2025',
            amount: 5000000,
          ),
        );
        break;
      case 'A15':
        _applyMockScenario('A13');
        invoices.addAll([
          _invoiceItem(
            'Invoice 1',
            InvoiceStatus.paid,
            date: '10 Des 2025',
            amount: 5000000,
          ),
          _invoiceItem(
            'Invoice 2',
            InvoiceStatus.unpaid,
            date: '20 Des 2025',
            amount: 3500000,
          ),
        ]);
        break;
      case 'A16':
        _applyMockScenario('A13');
        invoices.addAll([
          _invoiceItem(
            'Invoice 1',
            InvoiceStatus.paid,
            date: '10 Des 2025',
            amount: 5000000,
          ),
          _invoiceItem(
            'Invoice 2',
            InvoiceStatus.paid,
            date: '20 Des 2025',
            amount: 3500000,
          ),
          _invoiceItem(
            'Invoice 3',
            InvoiceStatus.unpaid,
            date: '30 Des 2025',
            amount: 2500000,
          ),
        ]);
        break;
      case 'A17':
        _applyMockScenario('A13');
        invoices.addAll([
          _invoiceItem(
            'Invoice 1',
            InvoiceStatus.paid,
            date: '10 Des 2025',
            amount: 5000000,
          ),
          _invoiceItem(
            'Invoice 2',
            InvoiceStatus.paid,
            date: '20 Des 2025',
            amount: 3500000,
          ),
          _invoiceItem(
            'Invoice 3',
            InvoiceStatus.paid,
            date: '30 Des 2025',
            amount: 2500000,
          ),
        ]);
        break;
      default:
        break;
    }

    _updateHasUploadedContract();
  }
}

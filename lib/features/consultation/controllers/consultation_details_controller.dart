import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/project.dart';

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
  final Rx<ConsultationDetailStep> selectedStep =
      ConsultationDetailStep.contract.obs;

  final RxList<ConsultationContractItem> contracts =
      <ConsultationContractItem>[].obs;
  final RxList<ConsultationDocumentItem> draftDesigns =
      <ConsultationDocumentItem>[].obs;
  final RxList<ConsultationDocumentItem> finalDesigns =
      <ConsultationDocumentItem>[].obs;
  final RxList<ConsultationInvoiceItem> invoices =
      <ConsultationInvoiceItem>[].obs;

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

    _applyMockScenario(project.projectId);
  }

  void selectStep(ConsultationDetailStep step) {
    selectedStep.value = step;
  }

  // --- Mocked download helpers ---

  Future<void> downloadContract(ConsultationContractItem item) async {
    _showDownloadSnack('Dokumen kontrak "${item.title}" diunduh (mock)');
  }

  Future<void> downloadDesign(ConsultationDocumentItem item) async {
    _showDownloadSnack('Dokumen desain "${item.title}" diunduh (mock)');
  }

  void _showDownloadSnack(String message) {
    Get.snackbar('Unduh Dokumen', message, snackPosition: SnackPosition.BOTTOM);
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
  }
}

import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/network/result.dart';

import '../../../core/base/base_controller.dart';
import 'supervisor_screen_controller.dart';

enum MonitoringStage { kontrak, dokumen, laporan, temuan, invoice }

enum ContractStatus { approved, pending }

class ContractItem {
  ContractItem({
    required this.title,
    required this.company,
    required this.date,
    required this.status,
  });

  final String title;
  final String company;
  final DateTime date;
  final ContractStatus status;

  String get statusLabel =>
      status == ContractStatus.approved ? 'DISETUJUI' : 'MENUNGGU PERSETUJUAN';
}

class DocumentItem {
  DocumentItem({required this.title});

  final String title;
}

class ReportItem {
  ReportItem({required this.title, required this.date, required this.category});

  final String title;
  final DateTime date;
  final String category; // Pondasi, Sloof, etc.
}

class FindingItem {
  FindingItem({required this.title, required this.date});

  final String title;
  final DateTime date;
}

class InvoiceItem {
  InvoiceItem({
    required this.title,
    required this.date,
    required this.amount,
    required this.isPaid,
  });

  final String title;
  final DateTime date;
  final int amount; // simple integer for Rp
  final bool isPaid;
}

class MonitoringDetailController extends BaseController {
  MonitoringDetailController() {
    // get selected supervisor from previous screen if needed
    supervisor = Get.arguments as ConstructionSupervisor?;
  }

  final selectedStage = MonitoringStage.kontrak.obs;

  ConstructionSupervisor? supervisor;

  final contracts = <ContractItem>[
    ContractItem(
      title: 'Kontrak Pengawasan Konstruksi',
      company: 'PT. Jasa Konstruksi',
      date: DateTime(2025, 11, 10),
      status: ContractStatus.approved,
    ),
    ContractItem(
      title: 'Addendum Kontrak',
      company: 'PT. Jasa Konstruksi',
      date: DateTime(2025, 11, 15),
      status: ContractStatus.pending,
    ),
  ].obs;

  final documents = <DocumentItem>[
    DocumentItem(title: 'Bill Of Quantities'),
    DocumentItem(title: 'Daftar Material Terpasang'),
    DocumentItem(title: 'Dokumen Lainnya'),
  ].obs;

  final laporanItems = <ReportItem>[
    ReportItem(
      title: 'Pondasi',
      date: DateTime(2025, 11, 18),
      category: 'Pondasi',
    ),
    ReportItem(title: 'Sloof', date: DateTime(2025, 11, 22), category: 'Sloof'),
    ReportItem(title: 'Kolom', date: DateTime(2025, 11, 25), category: 'Kolom'),
    ReportItem(
      title: 'Ring Balok',
      date: DateTime(2025, 11, 26),
      category: 'Ring Balok',
    ),
    ReportItem(
      title: 'Rangka Atap / Kuda-kuda',
      date: DateTime(2025, 11, 28),
      category: 'Rangka Atap',
    ),
    ReportItem(
      title: 'Pencahayaan',
      date: DateTime(2025, 11, 30),
      category: 'Pencahayaan',
    ),
    ReportItem(
      title: 'Penghawaan',
      date: DateTime(2025, 12, 2),
      category: 'Penghawaan',
    ),
  ].obs;

  final temuanItems = <FindingItem>[
    FindingItem(title: 'Tembok tidak rata', date: DateTime(2025, 11, 18)),
    FindingItem(title: 'Atap Bangunan ada bocor', date: DateTime(2025, 11, 22)),
    FindingItem(title: 'Beton kolom keropos', date: DateTime(2025, 11, 25)),
  ].obs;

  final invoiceItems = <InvoiceItem>[
    InvoiceItem(
      title: 'Invoice Termin 1',
      date: DateTime(2025, 11, 12),
      amount: 25000000,
      isPaid: true,
    ),
    InvoiceItem(
      title: 'Invoice Termin 2',
      date: DateTime(2025, 11, 18),
      amount: 30000000,
      isPaid: false,
    ),
  ].obs;

  void changeStage(MonitoringStage stage) {
    selectedStage.value = stage;
  }

  int get kontrakCount => contracts.length;
  int get dokumenCount => documents.length;
  int get laporanCount => laporanItems.length;
  int get temuanCount => temuanItems.length;
  int get invoiceCount => invoiceItems.length;

  void downloadContract(ContractItem item) {
    // TODO: integrate real download
    Get.snackbar('Download', 'Downloading ${item.title}');
  }

  void downloadDocument(DocumentItem item) {
    Get.snackbar('Download', 'Downloading ${item.title}');
  }

  void requestRevision() {
    // Call handleAsync with a function that returns a Future<Result>
    handleAsync(
      () async {
        // TODO: Replace with actual use case: _requestRevisionUseCase(contractId)
        await Future.delayed(
          const Duration(seconds: 1),
        ); // Simulate network latency
        // Return a mock Success object to satisfy the handleAsync signature
        return Success('Permintaan revisi berhasil dikirim');
      },
      onSuccess: (message) {
        Get.snackbar('Kontrak', message);
        // TODO: Optionally, re-fetch data to update UI state
      },
    );
  }

  void approveContract() {
    handleAsync(
      () async {
        // TODO: Replace with actual use case: _approveContractUseCase(contractId)
        await Future.delayed(const Duration(seconds: 1));
        return Success('Kontrak berhasil disetujui');
      },
      onSuccess: (message) {
        Get.snackbar('Kontrak', message);
        // TODO: Optionally, re-fetch data or update local state
      },
    );
  }

  void uploadDocument() {
    Get.snackbar('Dokumen', 'Membuka pilihan file untuk diupload...');
  }

  void openReportDetail(ReportItem item) {
    Get.toNamed(AppRoutes.monitoringDetailReport, arguments: item);
  }

  void openFindingDetail(FindingItem item) {
    // reuse same detail page as laporan
    final reportLike = ReportItem(
      title: item.title,
      date: item.date,
      category: 'Temuan',
    );
    Get.toNamed(AppRoutes.monitoringDetailReport, arguments: reportLike);
  }

  void openInvoiceDetail(InvoiceItem item) {
    if (item.isPaid) {
      Get.toNamed(
        AppRoutes.paymentReceipt, // existing page in your app
        arguments: item,
      );
    } else {
      Get.toNamed(
        AppRoutes.payment, // existing page in your app
        arguments: item,
      );
    }
  }
}

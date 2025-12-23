import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_findings_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_reports_usecase.dart';
import 'supervisor_screen_controller.dart';

enum MonitoringStage { kontrak, dokumen, laporan, temuan, invoice }

enum ContractStatus { approved, pending, rejected }

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

  String getStatusLabel() {
    switch (status) {
      case ContractStatus.approved:
        return 'DISETUJUI';
      case ContractStatus.pending:
        return 'MENUNGGU PERSETUJUAN';
      default:
        return 'TIDAK DISETUJUI';
    }
  }
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
  final GetReportsUseCase _getReportsUseCase;
  final GetFindingsUseCase _getFindingsUseCase;

  MonitoringDetailController(this._getReportsUseCase, this._getFindingsUseCase);

  final selectedStage = MonitoringStage.kontrak.obs;
  final hasApprovedContract = false.obs;

  final reports = Rx<List<MonitoringItemModel>>([]);
  final findings = Rx<List<MonitoringItemModel>>([]);
  late final int monitoringId;

  @override
  void onInit() {
    super.onInit();
    // Assuming the monitoringId is passed as an argument to the screen
    monitoringId = Get.arguments['monitoringId'] as int;
    fetchData();
  }

  Future<void> fetchData() async {
    // Fetch reports and findings in parallel
    await Future.wait([_fetchReports(), _fetchFindings()]);
  }

  Future<void> _fetchReports() async {
    await handleAsync(
      () => _getReportsUseCase(GetReportsParams(monitoringId: monitoringId)),
      onSuccess: (result) {
        reports.value = result;
      },
      // You can add a specific error handler if needed
      // onError: (failure) => Get.snackbar('Error', 'Gagal memuat laporan.'),
    );
  }

  Future<void> _fetchFindings() async {
    await handleAsync(
      () => _getFindingsUseCase(GetFindingsParams(monitoringId: monitoringId)),
      onSuccess: (result) {
        findings.value = result;
      },
    );
  }

  void onReportTap(int reportId) {
    // TODO: Navigate to the report detail screen
    Get.snackbar('Navigasi', 'Buka detail untuk ID: $reportId');
  }

  void onFindingTap(int findingId) {
    // TODO: Navigate to the finding detail screen
    Get.snackbar('Navigasi', 'Buka detail untuk ID: $findingId');
  }

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
    // ReportItem(
    //   title: 'Pondasi',
    //   date: DateTime(2025, 11, 18),
    //   category: 'Pondasi',
    // ),
    // ReportItem(title: 'Sloof', date: DateTime(2025, 11, 22), category: 'Sloof'),
    // ReportItem(title: 'Kolom', date: DateTime(2025, 11, 25), category: 'Kolom'),
    // ReportItem(
    //   title: 'Ring Balok',
    //   date: DateTime(2025, 11, 26),
    //   category: 'Ring Balok',
    // ),
    // ReportItem(
    //   title: 'Rangka Atap / Kuda-kuda',
    //   date: DateTime(2025, 11, 28),
    //   category: 'Rangka Atap',
    // ),
    // ReportItem(
    //   title: 'Pencahayaan',
    //   date: DateTime(2025, 11, 30),
    //   category: 'Pencahayaan',
    // ),
    // ReportItem(
    //   title: 'Penghawaan',
    //   date: DateTime(2025, 12, 2),
    //   category: 'Penghawaan',
    // ),
  ].obs;

  final temuanItems = <FindingItem>[
    // FindingItem(title: 'Tembok tidak rata', date: DateTime(2025, 11, 18)),
    // FindingItem(title: 'Atap Bangunan ada bocor', date: DateTime(2025, 11, 22)),
    // FindingItem(title: 'Beton kolom keropos', date: DateTime(2025, 11, 25)),
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

  void downloadContract(ContractItem item) async {
    // var status = await Permission.storage.request();
    // if (!status.isGranted) {
    //   Get.snackbar('Izin Ditolak', 'Izin penyimpanan dibutuhkan untuk mengunduh file.');
    //   return;
    // }

    // 2. Define URL and prepare file path
    const url = 'https://hub-dev.editnest.online/api/download/contract-1.pdf';
    final fileName = 'kontrak_${item.title.replaceAll(' ', '_')}.pdf';

    try {
      Directory? downloadsDir;
      if (Platform.isAndroid) {
        // On Android, get the public downloads directory.
        downloadsDir = await getDownloadsDirectory();
      } else {
        // On iOS, get the app's documents directory, which is accessible via the Files app.
        downloadsDir = await getApplicationDocumentsDirectory();
      }

      final savePath = '${downloadsDir!.path}/$fileName';

      // 3. Show "Starting Download" snackbar
      Get.snackbar(
        'Mengunduh',
        'Memulai unduhan file: ${item.title}',
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true,
        progressIndicatorValueColor: const AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      );

      // 4. Perform download with Dio
      await Dio().download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            // You can optionally update a progress variable here
            print("${(received / total * 100).toStringAsFixed(0)}%");
          }
        },
      );

      // 5. Show "Completed" snackbar and offer to open the file
      Get.back(); // Close the progress snackbar
      Get.snackbar(
        'Unduhan Selesai',
        'File "${item.title}" berhasil diunduh.',
        snackPosition: SnackPosition.BOTTOM,
        mainButton: TextButton(
          onPressed: () => OpenFilex.open(savePath),
          child: const Text('BUKA', style: TextStyle(color: Colors.white)),
        ),
        duration: const Duration(seconds: 5),
      );
    } on DioException catch (e) {
      Get.back(); // Close any open snackbar
      Get.snackbar(
        'Gagal Mengunduh',
        'Terjadi kesalahan: ${e.message}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Gagal Mengunduh',
        'Terjadi kesalahan yang tidak diketahui.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  void downloadDocument(DocumentItem item) {
    Get.snackbar('Download', 'Downloading ${item.title}');
  }

  void requestRevision() {
    final ContractItem last = contracts.last;
    contracts[contracts.length - 1] = ContractItem(
      title: last.title,
      company: last.company,
      date: last.date,
      status: ContractStatus.rejected,
    );

    hasApprovedContract.value = true;
  }

  void approveContract() {
    final ContractItem last = contracts.last;
    contracts[contracts.length - 1] = ContractItem(
      title: last.title,
      company: last.company,
      date: last.date,
      status: ContractStatus.approved,
    );
    hasApprovedContract.value = true;
  }

  void uploadDocument() {
    Get.snackbar('Dokumen', 'Membuka pilihan file untuk diupload...');
  }

  void openReportDetail(int id) {
    Get.toNamed(AppRoutes.monitoringDetailReport, arguments: id);
  }

  void openFindingDetail(int id) {
    Get.toNamed(AppRoutes.monitoringDetailReport, arguments: id);
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

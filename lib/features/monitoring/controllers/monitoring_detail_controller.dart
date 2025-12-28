import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/utils/logger.dart';
import 'package:pkp_hub/data/models/monitoring_contract_model.dart';
import 'package:pkp_hub/data/models/monitoring_detail_model.dart';
import 'package:pkp_hub/data/models/monitoring_document_model.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/domain/usecases/monitoring/approve_completion_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_findings_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_monitoring_contracts_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_monitoring_detail_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_monitoring_documents_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/get_reports_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/respond_to_contract_usecase.dart';
import 'package:pkp_hub/domain/usecases/monitoring/upload_document_usecase.dart';

import '../../../domain/usecases/monitoring/sign_contract_usecase.dart';

enum MonitoringStage { kontrak, dokumen, laporan, temuan }

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
  final RespondToContractUseCase _respondUseCase;
  final SignContractUseCase _signUseCase;
  final GetMonitoringDetailUseCase _getDetailUseCase;
  final ApproveCompletionUseCase _approveCompletionUseCase;
  final UploadDocumentUseCase _uploadDocumentUseCase;
  final GetMonitoringDocumentsUseCase _getDocumentsUseCase;
  final GetMonitoringContractsUsecase _getMonitoringContractsUsecase;

  MonitoringDetailController(
    this._getReportsUseCase,
    this._getFindingsUseCase,
    this._respondUseCase,
    this._signUseCase,
    this._getDetailUseCase,
    this._approveCompletionUseCase,
    this._uploadDocumentUseCase,
    this._getDocumentsUseCase,
    this._getMonitoringContractsUsecase,
  );

  final selectedStage = MonitoringStage.kontrak.obs;
  final hasApprovedContract = false.obs;

  final Logger _logger = Logger();

  final reports = Rx<List<MonitoringItemModel>>([]);
  final findings = Rx<List<MonitoringItemModel>>([]);
  late final int monitoringId;
  final monitoringData = Rx<MonitoringDetailModel?>(null);

  bool get showApproveContract {
    final globalStatus = monitoringData.value?.status; // "PENDING_CONTRACT"
    final contractStatus = monitoringData.value?.activeContract?.status; // "PENDING"

    return globalStatus == 'PENDING_CONTRACT' || contractStatus == 'PENDING';
  }

  bool get showSignContract {
    final globalStatus = monitoringData.value?.status;
    final contractStatus = monitoringData.value?.activeContract?.status;

    // Usually goes to SIGNING after approval
    return globalStatus == 'PENDING_SIGNATURES' || contractStatus == 'ACCEPTED';
  }

  final documents = <MonitoringDocumentModel>[].obs;

  final contracts = <MonitoringContractModel>[].obs;

  // In your fetch methods
  Future<void> fetchContracts(int monitoringId) async {
    await handleAsync(
          () => _getMonitoringContractsUsecase(monitoringId),
      onSuccess: (result) {
        contracts.assignAll(result);
      },
    );
  }

  Future<void> fetchDocuments(int monitoringId) async {
    await handleAsync(
      () => _getDocumentsUseCase(monitoringId),
      onSuccess: (result) {
        documents.assignAll(result);
      },
    );
  }

  Future<void> refreshData() async {
    // final id = monitoringData.value?.id;
    // if (id != null) {
        fetchDetail(monitoringId);
        fetchDocuments(monitoringId);
        fetchContracts(monitoringId);
        _fetchFindings();
        _fetchReports();
        // ... other fetch calls
    // }
  }

  Future<void> handleContractResponse(bool approved, String reason) async {
    final id = monitoringData.value?.activeContract?.id;
    if (id == null) return;

    await handleAsync(
      () => _respondUseCase(RespondToContractParams(
        contractId: id,
        approved: approved,
        reason: reason,
      )),
      onSuccess: (result) {
        Get.snackbar(
          "Sukses",
          approved ? "Kontrak disetujui" : "Kontrak ditolak",
        );
        fetchDetail(monitoringId); // Refresh data
      },
    );
  }

  Future<void> fetchDetail(int id) async {
    await handleAsync(
      () => _getDetailUseCase(id),
      onSuccess: (result) {
        monitoringData.value = result;
        monitoringData.refresh();
        _logger.d("Monitoring Data: ${monitoringData.value?.status}");
      },
    );
  }

  Future<void> handleSignContract() async {
    final id = monitoringData.value?.activeContract?.id;
    if (id == null) return;

    await handleAsync(
      () => _signUseCase(id),
      onSuccess: (_) => fetchDetail(monitoringId),
    );
  }

  @override
  void onInit() {
    super.onInit();
    // Assuming the monitoringId is passed as an argument to the screen
    monitoringId = Get.arguments['monitoringId'] as int;
    refreshData();
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

  Future<void> approveCompletion() async {
    final id = monitoringData.value?.id;
    if (id == null) return;

    await handleAsync(
      () => _approveCompletionUseCase(id),
      onSuccess: (result) {
        Get.snackbar("Success", "Monitoring has been completed successfully.");
        fetchDetail(id); // Refresh the detail page
      },
    );
  }

  Future<void> pickAndUploadDocument() async {
    // 1. Use FilePicker to select a file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      final monitoringId = monitoringData.value?.id;

      if (monitoringId == null) return;

      await handleAsync(
        () => _uploadDocumentUseCase(
          monitoringId: monitoringId,
          file: file,
          title: result.files.single.name,
        ),
        onSuccess: (res) {
          Get.snackbar("Success", "Document uploaded successfully");
          fetchDetail(monitoringId); // Refresh to show new document count/list
        },
        onFailure: (failure) {
          Get.snackbar("Error", "Failed to upload document");
          _logger.e("Error uploading document: $failure");
        },
      );
    }
  }

  void onReportTap(int reportId) {
    // TODO: Navigate to the report detail screen
    Get.snackbar('Navigasi', 'Buka detail untuk ID: $reportId');
  }

  void onFindingTap(int findingId) {
    // TODO: Navigate to the finding detail screen
    Get.snackbar('Navigasi', 'Buka detail untuk ID: $findingId');
  }

  // final contracts = <ContractItem>[
  //   ContractItem(
  //     title: 'Kontrak Pengawasan Konstruksi',
  //     company: 'PT. Jasa Konstruksi',
  //     date: DateTime(2025, 11, 10),
  //     status: ContractStatus.approved,
  //   ),
  //   ContractItem(
  //     title: 'Addendum Kontrak',
  //     company: 'PT. Jasa Konstruksi',
  //     date: DateTime(2025, 11, 15),
  //     status: ContractStatus.pending,
  //   ),
  // ].obs;

  /*final documents = <DocumentItem>[
    DocumentItem(title: 'Bill Of Quantities'),
    DocumentItem(title: 'Daftar Material Terpasang'),
    DocumentItem(title: 'Dokumen Lainnya'),
  ].obs;*/

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

  void downloadContract(MonitoringContractModel item) async {
    // 1. Prepare dynamic file name and extension
    final extension = _getFileExtension(item.documentUrl);
    final fileName = 'kontrak_rev${item.revisionCount}_${item.id}$extension';

    try {
      Directory? downloadsDir;
      if (Platform.isAndroid) {
        downloadsDir = await getDownloadsDirectory();
      } else {
        downloadsDir = await getApplicationDocumentsDirectory();
      }

      if (downloadsDir == null) {
        Get.snackbar('Error', 'Tidak dapat menemukan direktori penyimpanan.');
        return;
      }

      final savePath = '${downloadsDir.path}/$fileName';

      // 2. Show Progress Snackbar
      Get.snackbar(
        'Mengunduh',
        'Memulai unduhan kontrak: Versi ${item.revisionCount + 1}',
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true,
        progressIndicatorValueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        duration: const Duration(seconds: 2),
      );

      // 3. Perform download with Dio
      // Use item.documentUrl which comes from your API response
      await Dio().download(
        item.documentUrl,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            _logger.d("Contract Download Progress: ${(received / total * 100).toStringAsFixed(0)}%");
          }
        },
      );

      // 4. Success Notification with Open File action
      Get.snackbar(
        'Unduhan Selesai',
        'Kontrak versi ${item.revisionCount + 1} berhasil diunduh.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        mainButton: TextButton(
          onPressed: () => OpenFilex.open(savePath),
          child: const Text('BUKA', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        duration: const Duration(seconds: 5),
      );
    } on DioException catch (e) {
      _logger.e("Contract Download DioError: ${e.message}");
      Get.snackbar(
        'Gagal Mengunduh',
        'Terjadi kesalahan jaringan: ${e.message}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    } catch (e) {
      _logger.e("Contract Download Error: $e");
      Get.snackbar(
        'Gagal Mengunduh',
        'Terjadi kesalahan saat mengunduh kontrak.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    }
  }


  void downloadDocument(MonitoringDocumentModel item) async {
    final fileName = 'doc_${item.title.replaceAll(' ', '_')}_${item.id}${_getFileExtension(item.documentUrl)}';

    try {
      Directory? downloadsDir;
      if (Platform.isAndroid) {
        downloadsDir = await getDownloadsDirectory();
      } else {
        downloadsDir = await getApplicationDocumentsDirectory();
      }

      if (downloadsDir == null) {
        Get.snackbar('Error', 'Tidak dapat menemukan direktori penyimpanan.');
        return;
      }

      final savePath = '${downloadsDir.path}/$fileName';

      // Show Progress Snackbar
      Get.snackbar(
        'Mengunduh',
        'Memulai unduhan: ${item.title}',
        snackPosition: SnackPosition.BOTTOM,
        showProgressIndicator: true,
        duration: const Duration(seconds: 2),
      );

      // Perform download
      await Dio().download(
        item.documentUrl,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            _logger.d("Download Progress: ${(received / total * 100).toStringAsFixed(0)}%");
          }
        },
      );

      // Success Notification
      Get.snackbar(
        'Unduhan Selesai',
        'File "${item.title}" berhasil diunduh.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        mainButton: TextButton(
          onPressed: () => OpenFilex.open(savePath),
          child: const Text('BUKA', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        duration: const Duration(seconds: 5),
      );
    } catch (e) {
      _logger.e("Download Error: $e");
      Get.snackbar(
        'Gagal Mengunduh',
        'Terjadi kesalahan saat mengunduh file.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
    }
  }

  // Helper to extract file extension from URL
  String _getFileExtension(String url) {
    try {
      final uri = Uri.parse(url);
      final path = uri.path;
      final lastDot = path.lastIndexOf('.');
      if (lastDot != -1) {
        return path.substring(lastDot);
      }
    } catch (_) {}
    return '.pdf'; // Default fallback
  }


  void requestRevision(String reason) async {
    final contractId = monitoringData.value?.activeContract?.id;
    if (contractId == null) {
      Get.snackbar('Error', 'ID Kontrak tidak ditemukan');
      return;
    }

    await handleAsync(
          () => _respondUseCase(RespondToContractParams(
        contractId: contractId,
        approved: false,
        reason: reason,
      )),
      onSuccess: (result) {
        Get.snackbar('Sukses', 'Permintaan revisi telah dikirim');
        fetchDetail(monitoringId);
        fetchContracts(monitoringId);
      },
    );
  }

  void approveContract() async {
    final contractId = monitoringData.value?.activeContract?.id;
    if (contractId == null) {
      Get.snackbar('Error', 'ID Kontrak tidak ditemukan');
      return;
    }

    await handleAsync(
          () => _respondUseCase(RespondToContractParams(
        contractId: contractId,
        approved: true,
        reason: "Approved by Homeowner",
      )),
      onSuccess: (result) {
        Get.snackbar('Sukses', 'Kontrak berhasil disetujui');
        fetchDetail(monitoringId);
        fetchContracts(monitoringId);
      },
    );
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

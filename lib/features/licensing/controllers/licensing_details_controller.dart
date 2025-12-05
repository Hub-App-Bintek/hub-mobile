import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/response/permit_status_response.dart';
import 'package:pkp_hub/domain/usecases/permit/get_permit_status_use_case.dart';
import 'package:pkp_hub/features/main/widgets/project_item.dart';

class LicensingStep {
  LicensingStep({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.isCompleted,
  });

  final String title;
  final String subtitle;
  final String date;
  final bool isCompleted;
}

enum LicensingStage { documents, status, result }

class LicensingDetailsController extends BaseController {
  final RxString licenseNumber = 'PKP-PL-23001'.obs;
  final RxString projectName = 'Perizinan Bangunan Rumah Tinggal'.obs;
  final RxString address =
      'Jl. Mawar No. 21, Kebayoran Lama, Jakarta Selatan'.obs;
  final Rx<LicensingStage> selectedStage = LicensingStage.documents.obs;
  final RxBool isLoading = false.obs;

  final RxList<LicensingStep> steps = <LicensingStep>[].obs;
  final RxList<ProjectItem> documents = <ProjectItem>[].obs;
  final RxList<ProjectItem> results = <ProjectItem>[].obs;

  // 1. Inject the use case
  final GetPermitStatusUseCase _getPermitStatusUseCase;

  LicensingDetailsController(this._getPermitStatusUseCase);

  final permitStatus = Rx<PermitStatusResponse?>(null);

  bool get hasDocument => documents.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    // Assuming projectId is passed as an argument
    projectId = Get.arguments['projectId'] as String;
    // Fetch the status when the screen is initialized
    fetchPermitStatus();
  }

  // 3. Method to fetch the data
  Future<void> fetchPermitStatus({bool isInitialLoad = false}) {
    // This already returns a Future<void>
    // The `onRefresh` callback needs the Future to be returned.
    if (isInitialLoad) {
      return handleAsync(
        // Add 'return' here
        () => _getPermitStatusUseCase(projectId),
        onSuccess: (response) {
          permitStatus.value = response;
          _updateStateFromResponse(response);
        },
        onFailure: (failure) {
          // The base handleAsync will show a snackbar on failure
          showError(failure);
        },
      );
    } else {
      return _handleRefresh();
    }
  }

  Future<void> _handleRefresh() async {
    // Manually check for network connection.
    if (!isConnected) {
      showError(const NetworkFailure(AppStrings.noInternetConnection));
      return;
    }

    return handleAsync(
      // Add 'return' here
      () => _getPermitStatusUseCase(projectId),
      onSuccess: (response) {
        permitStatus.value = response;
        _updateStateFromResponse(response);
      },
      onFailure: (failure) {
        // The base handleAsync will show a snackbar on failure
        showError(failure);
      },
    );
  }

  // Example project ID passed from the previous screen
  late final String projectId;

  // final RxList<LicensingStep> steps = <LicensingStep>[
  //   LicensingStep(
  //     title: 'Pengajuan',
  //     subtitle: 'Dokumen pengajuan telah dikirim',
  //     date: '12 Jan 2025',
  //     isCompleted: true,
  //   ),
  //   LicensingStep(
  //     title: 'Verifikasi',
  //     subtitle: 'Dokumen sedang diverifikasi',
  //     date: '13 Jan 2025',
  //     isCompleted: true,
  //   ),
  //   LicensingStep(
  //     title: 'Proses',
  //     subtitle: 'Permohonan sedang diproses',
  //     date: '14 Jan 2025',
  //     isCompleted: false,
  //   ),
  //   LicensingStep(
  //     title: 'Selesai',
  //     subtitle: 'Perizinan diterbitkan',
  //     date: '-',
  //     isCompleted: false,
  //   ),
  // ].obs;

  void selectStage(LicensingStage stage) {
    if (selectedStage.value == stage) return;
    selectedStage.value = stage;
  }

  // --- NEW: HELPER FOR FORMATTING ---
  String _formatStatusTitle(String status) {
    // Example: 'UNDER_REVIEW' becomes 'Under Review'
    return status
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) {
          if (word.isEmpty) return '';
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  // --- NEW: HELPER TO MAP API RESPONSE TO UI STATE ---
  void _updateStateFromResponse(PermitStatusResponse response) {
    // 1. Update project details (assuming you add these fields to your UI)
    projectName.value =
        response.permit.projectId; // Or a more descriptive name if available
    licenseNumber.value = response.permit.simbgId ?? 'Belum Tersedia';
    // Note: The address is not in the status response, so it must be passed from the previous screen or fetched separately.

    // 2. Map the status history to your LicensingStep model
    final newSteps = response.status.history.map((historyItem) {
      return LicensingStep(
        title: _formatStatusTitle(
          historyItem.status,
        ), // Helper to make title pretty
        subtitle: 'Dokumen ${historyItem.status.toLowerCase()}',
        date: DateFormat('dd MMM yyyy').format(historyItem.at.toLocal()),
        isCompleted: true, // All items in history are completed steps
      );
    }).toList();

    final newDocuments = response.submissions.map((submission) {
      String title = 'Dokumen Pengajuan Awal';
      String content = 'Catatan tidak tersedia';
      try {
        // Safely decode the JSON string in permissionData
        final data =
            json.decode(submission.permissionData) as Map<String, dynamic>;
        title = _formatStatusTitle(
          data['nomorDokumenIzinPemanfaatanRuang'] as String? ?? 'Formulir',
        );
        content =
            data['kondisiBangunanSaatIni'] as String? ??
            'Catatan tidak tersedia';
      } catch (e) {
        // Handle cases where permissionData is not valid JSON
        print('Error decoding permissionData: $e');
      }

      return ProjectItem(
        title: title,
        content: content,
        date: DateFormat('dd MMM yyyy').format(submission.createdAt.toLocal()),
        // Determine status based on logic (e.g., if it's the latest, it's awaiting)
        status: ProjectItemStatus.approved, // Or another dynamic status
      );
    }).toList();

    // 3. Add a final, non-completed step if the process is not finished
    // final lastStatus = response.status.status;
    // if (lastStatus != 'APPROVED' && lastStatus != 'REJECTED') {
    //   newSteps.add(
    //     LicensingStep(
    //       title: _formatStatusTitle(lastStatus),
    //       subtitle: 'Permohonan sedang dalam tahap ini',
    //       date: '-',
    //       isCompleted: false,
    //     ),
    //   );
    // }

    final newResults = <ProjectItem>[
      // ProjectItem(
      //   title: 'Surat Izin Pemanfaatan Ruang (IPR)',
      //   content: 'Dokumen IPR yang telah disetujui.',
      //   date: DateFormat('dd MMM yyyy').format(
      //     response.permit.createdAt.add(const Duration(days: 14)).toLocal(),
      //   ),
      //   status: ProjectItemStatus.approved,
      // ),
      ProjectItem(
        title: 'Dokumen PBG',
        content: 'Dokumen PBG Telah Terbit',
        date: DateFormat('dd MMM yyyy').format(
          response.permit.createdAt.add(const Duration(days: 14)).toLocal(),
        ),
        status: ProjectItemStatus.approved,
        onDownloadTap: () async {
          const url = 'https://hub-dev.editnest.online/api/download/PBG-contoh.pdf';
          final fileName = 'pbg.pdf';

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
              'Memulai unduhan file: PBG',
              snackPosition: SnackPosition.BOTTOM,
              showProgressIndicator: true,
              progressIndicatorValueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            );

            // 4. Perform download with Dio
            await Dio().download(
              url,
              savePath,
              onReceiveProgress: (received, total) {
                if (total != -1) {
                  // You can optionally update a progress variable here
                  print((received / total * 100).toStringAsFixed(0) + "%");
                }
              },
            );

            // 5. Show "Completed" snackbar and offer to open the file
            Get.back(); // Close the progress snackbar
            Get.snackbar(
              'Unduhan Selesai',
              'File "PBG" berhasil diunduh.',
              snackPosition: SnackPosition.BOTTOM,
              mainButton: TextButton(
                onPressed: () => OpenFilex.open(savePath),
                child: const Text(
                  'BUKA',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              duration: const Duration(seconds: 20),
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
        },
      ),
    ];

    documents.assignAll(newDocuments);
    steps.assignAll(newSteps);
    results.assignAll(newResults);
  }
}

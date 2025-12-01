import 'dart:io';

import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/utils/logger.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';
import 'package:pkp_hub/domain/usecases/design/download_prototype_design_use_case.dart';
import 'package:pkp_hub/domain/usecases/design/get_prototype_designs_use_case.dart';

class PrototypeDesignsController extends BaseController {
  PrototypeDesignsController(
    this._getPrototypeDesignsUseCase,
    this._downloadPrototypeDesignUseCase,
  );

  final GetPrototypeDesignsUseCase _getPrototypeDesignsUseCase;
  final DownloadPrototypeDesignUseCase _downloadPrototypeDesignUseCase;

  final designs = <PrototypeDesign>[].obs;
  final isLoading = false.obs;
  final downloadingDesignId = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetchDesigns();
  }

  Future<void> fetchDesigns() async {
    isLoading.value = true;
    await handleAsync<List<PrototypeDesign>>(
      () => _getPrototypeDesignsUseCase(),
      onSuccess: designs.assignAll,
      onFailure: showError,
    );
    isLoading.value = false;
  }

  Future<void> onOpenDetails(PrototypeDesign design) async {
    final result = await navigateToForResult<dynamic>(
      AppRoutes.prototypeDesignDetails,
      arguments: PrototypeDesignDetailsArgs(
        designId: design.id ?? '',
        design: design,
      ),
    );
    if (result is PrototypeDesign) {
      goBack(result: result);
    }
  }

  Future<void> onDownload(PrototypeDesign design) async {
    final id = design.id;
    if (id == null || id.isEmpty) {
      showError(const ServerFailure(message: 'ID desain tidak ditemukan'));
      return;
    }
    if (downloadingDesignId.value == id) return;

    downloadingDesignId.value = id;
    showLoadingOverlay(message: 'Mengunduh dokumen...', delay: Duration.zero);

    try {
      await handleAsync<DownloadedFile>(
        () => _downloadPrototypeDesignUseCase(
          DownloadPrototypeDesignParams(designId: id),
        ),
        onSuccess: (file) async {
          hideLoadingOverlay();
          final projectName = design.name ?? 'Prototype';
          String? saved;
          if (file.path != null) {
            final source = File(file.path!);
            if (await source.exists()) {
              try {
                final bytes = await source.readAsBytes();
                saved = await saveToExternalProjectDocuments(
                  projectName: projectName,
                  fileName: file.fileName,
                  bytes: bytes,
                  subDirectory: 'Prototype Designs',
                  mimeType: 'application/zip',
                );
              } finally {
                // Clean up temp file
                source.delete().catchError((e) {
                  Logger().e('Failed to delete temp file: $e');
                  return null;
                });
              }
            }
          }
          saved ??= await saveToExternalProjectDocuments(
            projectName: projectName,
            fileName: file.fileName,
            bytes: file.bytes,
            subDirectory: 'Prototype Designs',
            mimeType: 'application/zip',
          );
          if (saved != null && saved.isNotEmpty) {
            saved = await saveToExternalProjectDocuments(
              projectName: projectName,
              fileName: file.fileName,
              bytes: file.bytes,
              subDirectory: 'Prototype Designs',
              mimeType: 'application/zip',
            );
          }
          if (saved != null && saved.isNotEmpty) {
            final where = Platform.isAndroid
                ? 'Dokumen > PKP > $projectName'
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
      downloadingDesignId.value = null;
    }
  }
}

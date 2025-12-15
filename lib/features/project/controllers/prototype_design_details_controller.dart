import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/utils/logger.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';
import 'package:pkp_hub/domain/usecases/design/download_prototype_design_use_case.dart';
import 'package:pkp_hub/domain/usecases/design/get_prototype_design_detail_use_case.dart';

class PrototypeDesignDetailsController extends BaseController {
  PrototypeDesignDetailsController(
    this._getPrototypeDesignDetailUseCase,
    this._downloadPrototypeDesignUseCase,
  );

  final GetPrototypeDesignDetailUseCase _getPrototypeDesignDetailUseCase;
  final DownloadPrototypeDesignUseCase _downloadPrototypeDesignUseCase;
  late final String prototypeId;
  PrototypeDesign? _initialDesign;

  final design = Rxn<PrototypeDesign>();
  final features = <String>[].obs;
  final specs = <MapEntry<String, String>>[].obs;
  final isLoading = false.obs;
  final downloadLoading = false.obs;

  List<String> get imageUrls {
    final current = design.value;
    if (current == null) return const [];

    final urls = <String>[];
    urls.addAll(
      current.thumbnailUrls
          .where((url) => url.isNotEmpty)
          .map(_resolveUrl)
          .toList(),
    );

    // Deduplicate while preserving order.
    final seen = <String>{};
    return urls.where((url) => seen.add(url)).toList();
  }

  @override
  void onInit() {
    super.onInit();
    _hydrateArgs();
    fetchDesignDetail();
  }

  void _hydrateArgs() {
    final rawArgs = Get.arguments;
    if (rawArgs is PrototypeDesignDetailsArgs) {
      prototypeId = rawArgs.designId.isNotEmpty
          ? rawArgs.designId
          : (rawArgs.design?.id ?? '');
      _initialDesign = rawArgs.design;
    } else if (rawArgs is Map<String, dynamic>) {
      final design = rawArgs['design'] as PrototypeDesign?;
      final rawId = (rawArgs['designId'] ?? rawArgs['id'] ?? '').toString();
      prototypeId = rawId.isNotEmpty ? rawId : (design?.id ?? '');
      _initialDesign = design;
    } else {
      prototypeId = '';
    }

    if (_initialDesign != null) {
      design.value = _initialDesign;
      _hydrateFromDesign(_initialDesign!);
    }
  }

  Future<void> fetchDesignDetail() async {
    if (prototypeId.isEmpty) return;
    isLoading.value = true;
    await handleAsync<PrototypeDesign>(
      () => _getPrototypeDesignDetailUseCase(prototypeId),
      onSuccess: (data) {
        design.value = data;
        _hydrateFromDesign(data);
      },
      onFailure: showError,
    );
    isLoading.value = false;
  }

  Future<void> onDownloadPressed() async {
    final current = design.value;
    final id = current?.id ?? prototypeId;
    if (id.isEmpty) {
      showError(const ServerFailure(message: 'ID desain tidak ditemukan'));
      return;
    }
    if (downloadLoading.value) return;

    downloadLoading.value = true;
    showLoadingOverlay(message: 'Mengunduh dokumen...', delay: Duration.zero);

    try {
      await handleAsync<DownloadedFile>(
        () => _downloadPrototypeDesignUseCase(
          DownloadPrototypeDesignParams(designId: id),
        ),
        onSuccess: (file) async {
          hideLoadingOverlay();
          final projectName = current?.name ?? 'Prototype';
          String? saved;
          if (file.path != null && file.path!.isNotEmpty) {
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
                source.delete().catchError((e) {
                  Logger().e('Failed to delete temp file: $e');
                  return source;
                });
              }
            }
          }
          if ((saved == null || saved.isEmpty) && file.bytes.isNotEmpty) {
            saved = await saveToExternalProjectDocuments(
              projectName: projectName,
              fileName: file.fileName,
              bytes: file.bytes,
              subDirectory: 'Prototype Designs',
              mimeType: 'application/zip',
            );
          }
          if ((saved == null || saved.isEmpty) && file.bytes.isEmpty) {
            // Nothing to save
            saved = null;
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
            Logger().e(
              'Gagal menyimpan prototype design untuk $projectName (id: $id)',
            );
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
          Logger().e(
            'Download prototype design gagal (id: $id): ${failure.message}',
          );
          showError(failure);
        },
      );
    } finally {
      hideLoadingOverlay();
      downloadLoading.value = false;
    }
  }

  void _hydrateFromDesign(PrototypeDesign data) {
    features.assignAll(_parseFeatures(data.featuresJson));
    specs
      ..clear()
      ..addAll(_parseSpecs(data.specificationsJson));
  }

  List<String> _parseFeatures(String? rawFeatures) {
    if (rawFeatures == null || rawFeatures.isEmpty) return [];
    try {
      final decoded = jsonDecode(rawFeatures);
      if (decoded is Map) {
        final listCandidate = decoded['features'] ?? decoded['fitur_utama'];
        if (listCandidate is List) {
          return listCandidate.map((e) => e.toString()).toList();
        }
      } else if (decoded is List) {
        return decoded.map((e) => e.toString()).toList();
      }
    } catch (_) {
      // Ignore parsing errors and return empty list.
    }
    return [];
  }

  List<MapEntry<String, String>> _parseSpecs(String? rawSpecs) {
    if (rawSpecs == null || rawSpecs.isEmpty) return [];
    try {
      final decoded = jsonDecode(rawSpecs);
      if (decoded is Map) {
        return decoded.entries
            .map(
              (entry) => MapEntry(
                entry.key.toString().replaceAll('_', ' ').capitalizeFirst ?? '',
                entry.value?.toString() ?? '',
              ),
            )
            .toList();
      }
    } catch (_) {
      // Ignore parsing errors and return empty list.
    }
    return [];
  }

  String _resolveUrl(String url) {
    if (url.startsWith('http')) return url;
    final base = Environment.instance.apiBaseUrl;
    if (base.isEmpty) return url;

    if (base.endsWith('/') && url.startsWith('/')) {
      return '$base${url.substring(1)}';
    }
    if (!base.endsWith('/') && !url.startsWith('/')) {
      return '$base/$url';
    }
    return '$base$url';
  }
}

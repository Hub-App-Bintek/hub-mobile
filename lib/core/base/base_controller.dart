import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/network_manager.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/utils/logger.dart';
import 'package:file_saver/file_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';

abstract class BaseController extends GetxController {
  final _logger = Logger();

  NetworkManager get _networkManager => Get.find<NetworkManager>();

  bool get isConnected => _networkManager.isConnected.value;

  // Channel for native file operations (Android)
  static const MethodChannel _filesChannel = MethodChannel(
    'id.go.pkp.hub/files',
  );

  @protected
  Future<void> handleAsync<T>(
    Future<Result<T, Failure>> Function() operation, {
    required void Function(T data) onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    if (!isConnected) {
      const failure = NetworkFailure(AppStrings.noInternetConnection);
      onFailure?.call(failure);
      return;
    }

    try {
      final result = await operation();

      switch (result) {
        case Success(value: final data):
          onSuccess(data);

        case Error(error: final failure):
          onFailure?.call(failure);
      }
    } catch (e, stackTrace) {
      _logger.e(
        'Unhandled error in ViewModel',
        error: e,
        stackTrace: stackTrace,
      );
      final failure = ServerFailure(
        message: 'An unexpected error occurred: $e',
      );
      onFailure?.call(failure);
    }
  }

  /// Displays a standardized error snackbar for a given [Failure].
  /// This can be called manually from controllers when custom error logic is needed.
  void showError(Failure failure) {
    // We always want to show the message when this is called manually.
    _handleError(failure, showErrorMessage: true);
  }

  void _handleError(Failure failure, {bool showErrorMessage = true}) {
    if (showErrorMessage) {
      Get.snackbar(
        AppStrings.errorTitle,
        failure.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
        colorText: AppColors.white,
      );
    }
  }

  // --- Navigation ---

  /// Navigates to the specified named route.
  void navigateTo(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  /// Navigates back to the previous screen.
  /// You can optionally provide a [result] to the previous screen.
  void goBack<T>({T? result}) {
    Get.back(result: result);
  }

  /// Navigates to a new screen and removes all previous screens from the stack.
  /// Useful for post-login or logout flows.
  void navigateOffAll(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
  }

  /// Navigates to a new screen and removes the current screen from the stack.
  void navigateOff(String route, {dynamic arguments}) {
    Get.offNamed(route, arguments: arguments);
  }

  /// Navigates to a new screen and removes all pages in the stack
  /// until the [untilRoute] is reached.
  ///
  /// This is useful for multi-step flows where you want to return
  /// to a specific screen after completion, clearing the intermediate steps.
  /// Example: navigateAndClearUntil('/profile/edit', untilRoute: AppRoutes.main);
  void navigateAndClearUntil(
    String route, {
    required String untilRoute,
    dynamic arguments,
  }) {
    Get.offNamedUntil(
      route,
      (route) => route.settings.name == untilRoute,
      arguments: arguments,
    );
  }

  /// Shows a modal bottom sheet using GetX.
  void showBottomSheet(
    Widget widget, {
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    Get.bottomSheet(
      widget,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  // --- Permissions ---

  /// Checks if the specified permission is granted.
  Future<bool> isPermissionGranted(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  /// Requests the specified permission from the user.
  /// Returns the new permission status.
  Future<PermissionStatus> requestPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isPermanentlyDenied) {
      _showPermissionPermanentlyDeniedDialog();
    }
    return status;
  }

  void _showPermissionPermanentlyDeniedDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text(AppStrings.permissionDenied),
        content: const Text(AppStrings.permissionPermanentlyDenied),
        actions: [
          TextButton(
            child: const Text(AppStrings.cancel),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text(AppStrings.openSettings),
            onPressed: () {
              openAppSettings();
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  /// Save the given bytes to the user's Downloads folder (Android) or
  /// present a system save dialog (iOS). Returns the saved path on Android
  /// when available; may return null on iOS or when the user cancels.
  Future<String?> saveToDownloads({
    required String fileName,
    required Uint8List bytes,
    String mimeType = 'application/octet-stream',
  }) async {
    try {
      // Derive name and extension for FileSaver
      String name = fileName;
      String ext = '';
      final dot = fileName.lastIndexOf('.');
      if (dot > 0 && dot < fileName.length - 1) {
        name = fileName.substring(0, dot);
        ext = fileName.substring(dot + 1).toLowerCase();
      } else {
        // Default to .bin when the server doesn't provide an extension
        ext = 'bin';
      }

      // Map common extensions to MIME types for better compatibility
      String? customMime;
      switch (ext) {
        case 'pdf':
          customMime = 'application/pdf';
          break;
        case 'doc':
          customMime = 'application/msword';
          break;
        case 'docx':
          customMime =
              'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
          break;
        case 'xlsx':
          customMime =
              'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
          break;
        case 'xls':
          customMime = 'application/vnd.ms-excel';
          break;
        default:
          customMime = mimeType; // fallback
      }

      final savedPath = await FileSaver.instance.saveFile(
        name: name,
        bytes: bytes,
        ext: ext,
        customMimeType: customMime,
      );
      return savedPath;
    } catch (e) {
      showError(ServerFailure(message: 'Gagal menyimpan file: $e'));
      return null;
    }
  }

  /// Save under app storage in PKP/Documents/{projectName}/fileName and return the absolute path.
  Future<String?> saveToProjectDocuments({
    required String projectName,
    required String fileName,
    required Uint8List bytes,
  }) async {
    try {
      final sanitizedProject = _sanitizePathSegment(projectName);
      final safeFileName = _sanitizeFileName(fileName);

      Directory baseDir;
      if (Platform.isAndroid) {
        baseDir =
            (await getExternalStorageDirectory()) ??
            await getTemporaryDirectory();
      } else if (Platform.isIOS) {
        baseDir = await getApplicationDocumentsDirectory();
      } else {
        baseDir = await getTemporaryDirectory();
      }

      final sep = Platform.pathSeparator;
      final targetDir = Directory(
        '${baseDir.path}${sep}PKP${sep}Documents${sep}$sanitizedProject',
      );
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }
      final filePath = '${targetDir.path}$sep$safeFileName';
      final out = File(filePath);
      await out.writeAsBytes(bytes, flush: true);
      return out.path;
    } catch (e) {
      showError(ServerFailure(message: 'Gagal menyimpan file: $e'));
      return null;
    }
  }

  /// Save to Android public Documents/PKP/{projectName}/ using MediaStore on Android 10+
  /// and legacy public directory on Android 9 and below. Returns a URI string on Android 10+
  /// or an absolute file path on Android 9 and below. On non-Android platforms, falls back
  /// to [saveToProjectDocuments].
  Future<String?> saveToExternalProjectDocuments({
    required String projectName,
    required String fileName,
    required Uint8List bytes,
    String mimeType = 'application/octet-stream',
  }) async {
    try {
      final sanitizedProject = _sanitizePathSegment(projectName);
      final safeFileName = _sanitizeFileName(fileName);

      // Determine extension and better MIME type
      String ext = '';
      final dot = safeFileName.lastIndexOf('.');
      if (dot > 0 && dot < safeFileName.length - 1) {
        ext = safeFileName.substring(dot + 1).toLowerCase();
      }
      String resolvedMime = mimeType;
      switch (ext) {
        case 'pdf':
          resolvedMime = 'application/pdf';
          break;
        case 'doc':
          resolvedMime = 'application/msword';
          break;
        case 'docx':
          resolvedMime =
              'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
          break;
        case 'xlsx':
          resolvedMime =
              'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
          break;
        case 'xls':
          resolvedMime = 'application/vnd.ms-excel';
          break;
      }

      if (Platform.isIOS) {
        // On iOS, apps can't write to an arbitrary shared folder. Show a save dialog
        // so the user can pick a location in the Files app (iCloud Drive / On My iPhone).
        // We'll prefix the project name into the suggested file name for clarity.
        final suggestedName = sanitizedProject.isNotEmpty
            ? '${sanitizedProject}_$safeFileName'
            : safeFileName;
        final name = suggestedName.contains('.')
            ? suggestedName.substring(0, suggestedName.lastIndexOf('.'))
            : suggestedName;
        final iOSExt = ext.isEmpty ? 'bin' : ext;
        try {
          final saved = await FileSaver.instance.saveFile(
            name: name,
            ext: iOSExt,
            bytes: bytes,
            customMimeType: resolvedMime,
          );
          return saved; // May be a path-like string or null if canceled
        } catch (e) {
          showError(ServerFailure(message: 'Gagal menyimpan file di iOS: $e'));
          return null;
        }
      }

      if (!Platform.isAndroid) {
        // Non-Android platforms fallback to app documents
        return await saveToProjectDocuments(
          projectName: sanitizedProject,
          fileName: safeFileName,
          bytes: bytes,
        );
      }

      // Android: request storage permission only for SDK <= 28 (Android 9 and below)
      int sdkInt = 30;
      try {
        final deviceInfo = DeviceInfoPlugin();
        final android = await deviceInfo.androidInfo;
        sdkInt = android.version.sdkInt;
      } catch (_) {}

      if (sdkInt <= 28) {
        final status = await requestPermission(Permission.storage);
        if (!status.isGranted) {
          return null;
        }
      }

      final result = await _filesChannel
          .invokeMethod<dynamic>('saveToPublicDocuments', {
            'projectName': sanitizedProject,
            'fileName': safeFileName,
            'bytes': bytes,
            'mimeType': resolvedMime,
          });

      if (result is String) return result;
      return result?.toString();
    } catch (e) {
      showError(
        ServerFailure(message: 'Gagal menyimpan ke penyimpanan eksternal: $e'),
      );
      return null;
    }
  }

  String _sanitizePathSegment(String input) {
    // Remove characters not allowed in typical file paths and trim.
    final s = input.replaceAll(RegExp(r'[\\/:*?"<>|]'), '').trim();
    return s.isEmpty ? 'Untitled' : s;
  }

  String _sanitizeFileName(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) return 'file.dat';
    final parts = trimmed.split('.');
    if (parts.length < 2) {
      return _sanitizePathSegment(trimmed);
    }
    final ext = parts.removeLast();
    final base = parts.join('.');
    final safeBase = _sanitizePathSegment(base);
    final safeExt = _sanitizePathSegment(ext);
    return '$safeBase.$safeExt';
  }
}

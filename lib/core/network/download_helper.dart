import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';

Future<Result<DownloadedFile, Failure>> downloadToTempFile({
  required ApiClient apiClient,
  required String url,
  required String fallbackFileName,
  Map<String, dynamic>? queryParameters,
  Options? options,
  dynamic data,
  String prefix = 'download',
}) async {
  try {
    final resolvedUrl = _resolveUrl(url);
    final tempDir = Directory.systemTemp;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final tempPath = '${tempDir.path}/$prefix-$timestamp';

    final existingExtra = options?.extra ?? const <String, dynamic>{};
    final effectiveExtra = {...existingExtra, 'skipChucker': true};
    final mergedHeaders = await _buildHeaders(apiClient, options);
    final effectiveOptions = (options ?? Options()).copyWith(
      responseType: options?.responseType ?? ResponseType.stream,
      headers: mergedHeaders,
      extra: effectiveExtra,
    );

    final response = await apiClient.dio.download(
      resolvedUrl,
      tempPath,
      queryParameters: queryParameters,
      data: data,
      options: effectiveOptions,
    );

    final fileName = _extractFileName(response.headers.map) ?? fallbackFileName;

    return Success(
      DownloadedFile(fileName: fileName, bytes: Uint8List(0), path: tempPath),
    );
  } on DioException catch (e) {
    return Error(apiClient.toFailure(e));
  } catch (e) {
    return Error(ServerFailure(message: 'Gagal download file: $e'));
  }
}

Future<Map<String, dynamic>> _buildHeaders(
  ApiClient apiClient,
  Options? options,
) async {
  final headers = <String, dynamic>{
    ...apiClient.dio.options.headers,
    if (options?.headers != null) ...options!.headers!,
  };

  return headers;
}

String _resolveUrl(String url) {
  final parsed = Uri.tryParse(url);
  if (parsed != null && parsed.hasScheme && parsed.host.isNotEmpty) {
    return url;
  }

  final base = Uri.parse(Environment.instance.apiBaseUrl);
  final relative = url.startsWith('/') ? url : '/$url';
  return base.resolve(relative).toString();
}

String? _extractFileName(Map<String, List<String>> headers) {
  final cd = headers['content-disposition']?.first;
  if (cd == null) return null;
  final match = RegExp(
    r'''filename\*=UTF-8'[^']*'([^;]+)|filename="?([^";]+)"?''',
  ).firstMatch(cd);
  final fn1 = match?.group(1);
  final fn2 = match?.group(2);
  return (fn1 ?? fn2)?.trim();
}

import 'dart:typed_data';

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/design_repository.dart';
import 'package:retrofit/dio.dart';

class DownloadPrototypeDesignParams {
  final String designId;
  const DownloadPrototypeDesignParams({required this.designId});
}

class DownloadPrototypeDesignUseCase
    extends UseCase<DownloadedFile, DownloadPrototypeDesignParams> {
  DownloadPrototypeDesignUseCase(this._repository);

  final DesignRepository _repository;

  @override
  Future<Result<DownloadedFile, Failure>> call(
    DownloadPrototypeDesignParams params,
  ) async {
    final res = await _repository.downloadPrototypeDesign(params.designId);
    return switch (res) {
      Success(value: final http) => _mapResponse(http, params.designId),
      Error(error: final failure) => Error(failure),
    };
  }

  Result<DownloadedFile, Failure> _mapResponse(
    HttpResponse<List<int>> http,
    String designId,
  ) {
    try {
      final bytes = Uint8List.fromList(http.data);
      final headersMap = http.response.headers.map;
      final cd = headersMap['content-disposition']?.first;
      String? fileName = _extractFileNameFromContentDisposition(cd);
      if (fileName == null || fileName.isEmpty) {
        final contentType = headersMap['content-type']?.first;
        final ext = _extensionFromContentType(contentType);
        final safeId = designId.isNotEmpty ? designId : 'design';
        fileName = 'prototype-$safeId$ext';
      }
      return Success(DownloadedFile(fileName: fileName, bytes: bytes));
    } catch (_) {
      return const Error(
        ServerFailure(message: 'Gagal mengunduh dokumen desain'),
      );
    }
  }

  String _extensionFromContentType(String? contentType) {
    if (contentType == null) return '.zip';
    final ct = contentType.toLowerCase();
    if (ct.contains('zip')) return '.zip';
    if (ct.contains('pdf')) return '.pdf';
    if (ct.contains('json')) return '.json';
    if (ct.contains('plain')) return '.txt';
    return '.zip';
  }

  String? _extractFileNameFromContentDisposition(String? contentDisposition) {
    if (contentDisposition == null) return null;
    // Example: attachment; filename="prototype-123.zip"
    final regex = RegExp(
      r'''filename\*=UTF-8'[^']*'([^;]+)|filename="?([^";]+)"?''',
    );
    final match = regex.firstMatch(contentDisposition);
    if (match != null) {
      final fn1 = match.group(1);
      final fn2 = match.group(2);
      return (fn1 ?? fn2)?.trim();
    }
    return null;
  }
}

import 'dart:typed_data';
import 'package:retrofit/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/files_repository.dart';

class DownloadFileParams {
  final String fileId;
  DownloadFileParams({required this.fileId});
}

class DownloadFileUseCase extends UseCase<DownloadedFile, DownloadFileParams> {
  final FilesRepository _repository;
  DownloadFileUseCase(this._repository);

  @override
  Future<Result<DownloadedFile, Failure>> call(
    DownloadFileParams params,
  ) async {
    final res = await _repository.downloadFile(params.fileId);
    return switch (res) {
      Success(value: final HttpResponse<List<int>> http) => _mapResponse(http),
      Error(error: final failure) => Error(failure),
    };
  }

  Result<DownloadedFile, Failure> _mapResponse(HttpResponse<List<int>> http) {
    try {
      final bytes = http.data;
      final headersMap = http.response.headers.map;
      final cd = headersMap['content-disposition']?.first;
      String? fileName;
      if (cd != null) {
        fileName = _extractFileNameFromContentDisposition(cd);
      }
      if (fileName == null || fileName.isEmpty) {
        // Fallback: try to infer extension from Content-Type header
        final contentType = headersMap['content-type']?.first;
        final ext = _extensionFromContentType(contentType);
        fileName = 'downloaded-file$ext';
      }
      return Success(
        DownloadedFile(fileName: fileName, bytes: Uint8List.fromList(bytes)),
      );
    } catch (e) {
      return const Error(ServerFailure(message: 'Gagal mengunduh file'));
    }
  }

  String _extensionFromContentType(String? contentType) {
    if (contentType == null) return '.bin';
    final ct = contentType.toLowerCase();
    if (ct.contains('pdf')) return '.pdf';
    if (ct.contains('word') || ct.contains('officedocument')) return '.docx';
    if (ct.contains('msword')) return '.doc';
    if (ct.contains('zip')) return '.zip';
    if (ct.contains('json')) return '.json';
    if (ct.contains('plain')) return '.txt';
    if (ct.contains('excel')) return '.xlsx';
    return '.bin';
  }

  String? _extractFileNameFromContentDisposition(String? contentDisposition) {
    if (contentDisposition == null) return null;
    // Example: attachment; filename="contract.pdf"
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

import 'dart:typed_data';
import 'package:retrofit/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/contract_repository.dart';
import 'package:pkp_hub/data/models/request/generate_contract_draft_request.dart';

class GenerateContractDraftParams {
  final String consultationId;
  final GenerateContractDraftRequest request;
  GenerateContractDraftParams({
    required this.consultationId,
    required this.request,
  });
}

class GenerateContractDraftUseCase
    extends UseCase<DownloadedFile, GenerateContractDraftParams> {
  final ContractRepository _repository;
  GenerateContractDraftUseCase(this._repository);

  @override
  Future<Result<DownloadedFile, Failure>> call(
    GenerateContractDraftParams params,
  ) async {
    final res = await _repository.generateDraft(
      consultationId: params.consultationId,
      request: params.request,
    );

    return switch (res) {
      Success(value: final HttpResponse<List<int>> http) => _mapResponse(http),
      Error(error: final failure) => Error(failure),
    };
  }

  Result<DownloadedFile, Failure> _mapResponse(HttpResponse<List<int>> http) {
    try {
      final bytes = http.data;
      final cd = http.response.headers.map['content-disposition']?.first;
      if (cd == null) {
        return const Error(
          ServerFailure(message: 'Gagal membuat template kontrak'),
        );
      }
      final fileName = _extractFileNameFromContentDisposition(cd);
      if (fileName == null || fileName.isEmpty) {
        return const Error(
          ServerFailure(message: 'Gagal membuat template kontrak'),
        );
      }
      return Success(
        DownloadedFile(fileName: fileName, bytes: Uint8List.fromList(bytes)),
      );
    } catch (e) {
      return const Error(
        ServerFailure(message: 'Gagal membuat template kontrak'),
      );
    }
  }

  String? _extractFileNameFromContentDisposition(String? contentDisposition) {
    if (contentDisposition == null) return null;
    // Example: attachment; filename="contract-draft.docx"
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

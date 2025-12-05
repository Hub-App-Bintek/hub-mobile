import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/design_document_api_service.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/response/design_document_response.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/data/models/response/upload_design_document_response.dart';

abstract class DesignDocumentNetworkDataSource {
  Future<Result<UploadDesignDocumentResponse, Failure>> uploadDesignDocuments({
    required String consultationId,
    File? fileDed,
    File? fileRab,
    File? fileBoq,
  });

  Future<Result<Response<List<int>>, Failure>> downloadDesignDocument(
    String documentId,
  );

  Future<Result<void, Failure>> approveDesignDocuments(String designDocumentId);
  Future<Result<void, Failure>> askDesignRevision(
    String designDocumentId, {
    String? notes,
  });

  Future<Result<List<DesignDocumentResponse>, Failure>>
  getDesignDocumentVersions({
    required String consultationId,
    String? documentType,
  });

  Future<Result<DownloadedFile, Failure>> downloadVersionZip(String version);
}

class DesignDocumentNetworkDataSourceImpl
    implements DesignDocumentNetworkDataSource {
  final ApiClient _apiClient;
  final DesignDocumentApiService _designDocumentApi;

  DesignDocumentNetworkDataSourceImpl(this._apiClient, this._designDocumentApi);

  @override
  Future<Result<UploadDesignDocumentResponse, Failure>> uploadDesignDocuments({
    required String consultationId,
    File? fileDed,
    File? fileRab,
    File? fileBoq,
  }) async {
    try {
      final formData = FormData();
      formData.fields.add(MapEntry('consultationId', consultationId));
      if (fileDed != null) {
        formData.files.add(
          MapEntry('fileDed', await MultipartFile.fromFile(fileDed.path)),
        );
      }
      if (fileRab != null) {
        formData.files.add(
          MapEntry('fileRab', await MultipartFile.fromFile(fileRab.path)),
        );
      }
      if (fileBoq != null) {
        formData.files.add(
          MapEntry('fileBoq', await MultipartFile.fromFile(fileBoq.path)),
        );
      }
      if (formData.files.isEmpty) {
        return const Error(
          ServerFailure(message: 'Minimal satu dokumen desain harus diunggah'),
        );
      }

      final response = await _apiClient.dio.post(
        ApiEndpoints.designDocumentsUpload,
        data: formData,
      );
      return Success(UploadDesignDocumentResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to upload design documents: $e'),
      );
    }
  }

  @override
  Future<Result<Response<List<int>>, Failure>> downloadDesignDocument(
    String documentId,
  ) async {
    try {
      final url = ApiEndpoints.designDocumentDownload.replaceFirst(
        '{documentId}',
        documentId,
      );
      final res = await _apiClient.dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to download design document: $e'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> approveDesignDocuments(
    String designDocumentId,
  ) async {
    try {
      await _designDocumentApi.approveDesignDocuments(designDocumentId);
      return const Success(null);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to approve design documents: $e'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> askDesignRevision(
    String designDocumentId, {
    String? notes,
  }) async {
    try {
      final payload = notes == null
          ? <String, dynamic>{}
          : {'notes': notes, 'designDocumentId': designDocumentId};
      await _designDocumentApi.requestDesignRevision(designDocumentId, payload);
      return const Success(null);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to request design revision: $e'),
      );
    }
  }

  @override
  Future<Result<List<DesignDocumentResponse>, Failure>>
  getDesignDocumentVersions({
    required String consultationId,
    String? documentType,
  }) async {
    try {
      final res = await _apiClient.dio.get(
        ApiEndpoints.designDocumentsVersions,
        queryParameters: {
          'consultationId': consultationId,
          if (documentType != null) 'documentType': documentType,
        },
      );
      final data = res.data as List<dynamic>;
      final versions = data
          .map(
            (e) => DesignDocumentResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
      return Success(versions);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to fetch design documents: $e'),
      );
    }
  }

  @override
  Future<Result<DownloadedFile, Failure>> downloadVersionZip(
    String version,
  ) async {
    try {
      final url = ApiEndpoints.designDocumentsVersionDownload.replaceFirst(
        '{version}',
        version,
      );
      final res = await _apiClient.dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final cd = res.headers.map['content-disposition']?.first;
      String fileName = 'design-$version.zip';
      if (cd != null) {
        final match = RegExp(
          r'''filename\*=UTF-8'[^']*'([^;]+)|filename="?([^";]+)"?''',
        ).firstMatch(cd);
        final fn1 = match?.group(1);
        final fn2 = match?.group(2);
        fileName = (fn1 ?? fn2 ?? fileName).trim();
      }
      return Success(
        DownloadedFile(
          fileName: fileName,
          bytes: Uint8List.fromList(res.data ?? []),
        ),
      );
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to download desain: $e'));
    }
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/download_helper.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/design_document_api_service.dart';
import 'package:pkp_hub/data/models/request/approve_design_request.dart';
import 'package:pkp_hub/data/models/request/design_document_revision_request.dart';
import 'package:pkp_hub/data/models/response/design_document_approval_response.dart';
import 'package:pkp_hub/data/models/response/design_document_response.dart';
import 'package:pkp_hub/data/models/response/design_document_revision_response.dart';
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

  Future<Result<DesignDocumentApprovalResponse, Failure>>
  approveDesignDocuments(
    String designDocumentId, {
    String? approvedVersion,
    String? revisionNotes,
  });

  Future<Result<DesignDocumentRevisionResponse, Failure>> askDesignRevision(
    String consultationId,
    String designDocumentId,
    String notes,
  );

  Future<Result<List<DesignDocumentResponse>, Failure>>
  getDesignDocumentVersions({
    required String consultationId,
    String? documentType,
  });

  Future<Result<DownloadedFile, Failure>> downloadVersionZip(
    String version,
    String consultationId,
  );
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
  Future<Result<DesignDocumentApprovalResponse, Failure>>
  approveDesignDocuments(
    String designDocumentId, {
    String? approvedVersion,
    String? revisionNotes,
  }) async {
    try {
      final request = ApproveDesignRequest(
        approvedVersion: approvedVersion,
        revisionNotes: revisionNotes,
      );
      final res = await _designDocumentApi.approveDesignDocuments(
        designDocumentId,
        request,
      );
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to approve design documents: $e'),
      );
    }
  }

  @override
  Future<Result<DesignDocumentRevisionResponse, Failure>> askDesignRevision(
    String consultationId,
    String designDocumentId,
    String? notes,
  ) async {
    try {
      final req = DesignDocumentRevisionRequest(
        designDocumentId: designDocumentId,
        notes: notes ?? '',
      );
      final res = await _designDocumentApi.requestDesignRevision(
        consultationId,
        req,
      );
      return Success(res);
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
    String consultationId,
  ) {
    return downloadToTempFile(
      apiClient: _apiClient,
      prefix: 'design-doc',
      url: ApiEndpoints.designDocumentsVersionDownload.replaceFirst(
        '{version}',
        version,
      ),
      fallbackFileName: 'design-$version.zip',
      queryParameters: {'consultationId': consultationId},
      options: Options(responseType: ResponseType.stream),
    );
  }
}

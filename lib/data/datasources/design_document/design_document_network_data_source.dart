import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/design_document_api_service.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/design_document.dart';

abstract class DesignDocumentNetworkDataSource {
  Future<Result<DesignDocument, Failure>> uploadDesignDocuments({
    required String consultationId,
    required File fileDed,
    required File fileRab,
    required File fileBoq,
  });

  Future<Result<Response<List<int>>, Failure>> downloadDesignDocument(
    String documentId,
  );

  Future<Result<void, Failure>> approveDesignDocuments(String designDocumentId);
  Future<Result<void, Failure>> askDesignRevision(
    String designDocumentId, {
    String? notes,
  });
}

class DesignDocumentNetworkDataSourceImpl
    implements DesignDocumentNetworkDataSource {
  final ApiClient _apiClient;
  final DesignDocumentApiService _designDocumentApi;

  DesignDocumentNetworkDataSourceImpl(this._apiClient, this._designDocumentApi);

  @override
  Future<Result<DesignDocument, Failure>> uploadDesignDocuments({
    required String consultationId,
    required File fileDed,
    required File fileRab,
    required File fileBoq,
  }) async {
    try {
      final response = await _designDocumentApi.uploadDesignDocuments(
        consultationId,
        fileDed,
        fileRab,
        fileBoq,
      );
      return Success(response);
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
}

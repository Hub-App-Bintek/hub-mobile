import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/final_document_api_service.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/final_document.dart';

abstract class FinalDocumentNetworkDataSource {
  Future<Result<FinalDocument, Failure>> uploadFinalDocuments({
    required String consultationId,
    required String fileDedUrl,
    required String fileRabUrl,
    required String fileSpektekUrl,
  });

  Future<Result<Response<List<int>>, Failure>> downloadFinalDocument(
    String documentId,
  );

  Future<Result<void, Failure>> approveFinalDocuments(String consultationId);
  Future<Result<void, Failure>> rejectFinalDocuments(
    String consultationId, {
    String? notes,
  });
}

class FinalDocumentNetworkDataSourceImpl
    implements FinalDocumentNetworkDataSource {
  final ApiClient _apiClient;
  final FinalDocumentApiService _finalDocumentApi;

  FinalDocumentNetworkDataSourceImpl(this._apiClient, this._finalDocumentApi);

  @override
  Future<Result<FinalDocument, Failure>> uploadFinalDocuments({
    required String consultationId,
    required String fileDedUrl,
    required String fileRabUrl,
    required String fileSpektekUrl,
  }) async {
    try {
      final payload = {
        'consultationId': consultationId,
        'fileDedUrl': fileDedUrl,
        'fileRabUrl': fileRabUrl,
        'fileSpektekUrl': fileSpektekUrl,
      };
      final response = await _finalDocumentApi.uploadFinalDocuments(payload);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to upload final documents: $e'),
      );
    }
  }

  @override
  Future<Result<Response<List<int>>, Failure>> downloadFinalDocument(
    String documentId,
  ) async {
    try {
      final url = ApiEndpoints.finalDocumentDownload.replaceFirst(
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
        ServerFailure(message: 'Failed to download final document: $e'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> approveFinalDocuments(
    String consultationId,
  ) async {
    try {
      await _finalDocumentApi.approveFinalDocuments(consultationId);
      return const Success(null);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to approve final documents: $e'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> rejectFinalDocuments(
    String consultationId, {
    String? notes,
  }) async {
    try {
      final payload = notes == null ? <String, dynamic>{} : {'notes': notes};
      await _finalDocumentApi.rejectFinalDocuments(consultationId, payload);
      return const Success(null);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to reject final documents: $e'),
      );
    }
  }
}

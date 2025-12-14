import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/download_helper.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/contract_api_service.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/data/models/request/approve_contract_request.dart';
import 'package:pkp_hub/data/models/request/create_contract_draft_request.dart';
import 'package:pkp_hub/data/models/response/contract_version_response.dart';
import 'package:pkp_hub/data/models/response/upload_contract_response.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_param.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_revised_contract_param.dart';

abstract class ContractNetworkDataSource {
  Future<Result<Contract, Failure>> getContract(String consultationId);

  Future<Result<List<ContractVersionResponse>, Failure>> getContractVersions({
    required String projectId,
    required String consultationId,
  });

  Future<Result<Contract, Failure>> signContract(String contractId);

  Future<Result<Contract, Failure>> rejectContract(
    String contractId, {
    String reason,
  });

  Future<Result<Contract, Failure>> approveContract({
    required String contractId,
    required ApproveContractRequest request,
  });

  Future<Result<Contract, Failure>> requestRevision(
    String contractId, {
    String? revisionNotes,
  });

  Future<Result<Contract, Failure>> requestPayment(String contractId);

  Future<Result<UploadContractResponse, Failure>> uploadContract(
    UploadContractParam param,
  );

  Future<Result<UploadContractResponse, Failure>> uploadRevisedContract(
    UploadRevisedContractParam param,
  );

  Future<Result<DownloadedFile, Failure>> generateDraft({
    required String consultationId,
    required UploadContractRequest request,
  });

  Future<Result<DownloadedFile, Failure>> downloadContractVersion({
    required String contractId,
    required String documentVersionId,
  });
}

class ContractNetworkDataSourceImpl implements ContractNetworkDataSource {
  final ApiClient _apiClient;
  final ContractApiService _contractApi;

  ContractNetworkDataSourceImpl(this._apiClient, this._contractApi);

  @override
  Future<Result<List<ContractVersionResponse>, Failure>> getContractVersions({
    required String projectId,
    required String consultationId,
  }) async {
    try {
      final response = await _contractApi.getContractVersions(
        projectId,
        consultationId,
      );
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse contract versions: $e'),
      );
    }
  }

  @override
  Future<Result<Contract, Failure>> getContract(String consultationId) async {
    try {
      final response = await _contractApi.getContract(consultationId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse contract: $e'));
    }
  }

  @override
  Future<Result<Contract, Failure>> signContract(String contractId) async {
    try {
      final response = await _contractApi.signContract(contractId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse sign contract: $e'));
    }
  }

  @override
  Future<Result<Contract, Failure>> rejectContract(
    String contractId, {
    String reason = '',
  }) async {
    try {
      final response = await _contractApi.rejectPost(contractId, reason);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse reject contract: $e'),
      );
    }
  }

  @override
  Future<Result<Contract, Failure>> approveContract({
    required String contractId,
    required ApproveContractRequest request,
  }) async {
    try {
      final response = await _contractApi.approve(contractId, request);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse approve contract: $e'),
      );
    }
  }

  @override
  Future<Result<Contract, Failure>> requestRevision(
    String contractId, {
    String? revisionNotes,
  }) async {
    try {
      final response = await _contractApi.requestRevision(
        contractId,
        revisionNotes,
      );
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse request revision: $e'),
      );
    }
  }

  @override
  Future<Result<Contract, Failure>> requestPayment(String contractId) async {
    try {
      final response = await _contractApi.requestPayment(contractId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to request payment: $e'));
    }
  }

  @override
  Future<Result<UploadContractResponse, Failure>> uploadContract(
    UploadContractParam param,
  ) async {
    try {
      // Build JSON string for the 'request' part (include fileUrl null per backend spec)
      final requestMap = param.request.toJson();
      final requestJson = jsonEncode(requestMap);

      final draft = await _contractApi.createDraft(
        param.consultationId,
        requestJson,
        param.file,
      );
      return Success(draft);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to upload contract: $e'));
    }
  }

  @override
  Future<Result<UploadContractResponse, Failure>> uploadRevisedContract(
    UploadRevisedContractParam param,
  ) async {
    try {
      final requestJson = jsonEncode(param.request.toJson());
      final response = await _contractApi.uploadRevisedContract(
        param.consultationId,
        requestJson,
        param.file,
      );
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to upload revised contract: $e'),
      );
    }
  }

  @override
  Future<Result<DownloadedFile, Failure>> generateDraft({
    required String consultationId,
    required UploadContractRequest request,
  }) async {
    final url = ApiEndpoints.contractGenerateDraft.replaceFirst(
      '{consultationId}',
      consultationId,
    );

    return downloadToTempFile(
      apiClient: _apiClient,
      url: url,
      data: request.toJson(),
      prefix: 'contract-draft',
      fallbackFileName: 'contract-draft.docx',
      options: Options(method: 'POST', responseType: ResponseType.stream),
    );
  }

  @override
  Future<Result<DownloadedFile, Failure>> downloadContractVersion({
    required String contractId,
    required String documentVersionId,
  }) {
    final url = ApiEndpoints.contractVersionDownload
        .replaceFirst('{contractId}', contractId.trim())
        .replaceFirst('{documentVersionId}', documentVersionId.trim());

    return downloadToTempFile(
      apiClient: _apiClient,
      url: url,
      prefix: 'contract-$contractId',
      fallbackFileName: 'contract-$documentVersionId.pdf',
      options: Options(method: 'GET', responseType: ResponseType.stream),
    );
  }
}

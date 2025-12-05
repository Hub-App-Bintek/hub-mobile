import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/contract_api_service.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/data/models/request/approve_contract_request.dart';
import 'package:pkp_hub/data/models/request/generate_contract_draft_request.dart';
import 'package:pkp_hub/data/models/response/contract_version_response.dart';
import 'package:pkp_hub/data/models/response/upload_contract_response.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_param.dart';
import 'package:retrofit/dio.dart';

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

  Future<Result<HttpResponse<List<int>>, Failure>> generateDraft({
    required String consultationId,
    required GenerateContractDraftRequest request,
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
  Future<Result<HttpResponse<List<int>>, Failure>> generateDraft({
    required String consultationId,
    required GenerateContractDraftRequest request,
  }) async {
    try {
      final res = await _contractApi.generateDraft(
        consultationId,
        request.toJson(),
      );
      return Success(res);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to generate contract draft: $e'),
      );
    }
  }
}

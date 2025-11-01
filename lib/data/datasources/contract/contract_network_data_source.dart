import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/contract_api_service.dart';
import 'package:pkp_hub/core/network/services/files_api_service.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:pkp_hub/data/models/request/generate_contract_draft_request.dart';
import 'package:retrofit/dio.dart';

abstract class ContractNetworkDataSource {
  Future<Result<Contract, Failure>> getContract(String consultationId);
  Future<Result<Contract, Failure>> signContract(String contractId);
  Future<Result<Contract, Failure>> rejectContract(
    String contractId, {
    String reason,
  });
  Future<Result<Contract, Failure>> uploadContract(
    String consultationId,
    File file,
    double contractValue,
  );
  Future<Result<HttpResponse<List<int>>, Failure>> generateDraft({
    required String consultationId,
    required GenerateContractDraftRequest request,
  });
}

class ContractNetworkDataSourceImpl implements ContractNetworkDataSource {
  final ApiClient _apiClient;
  final ContractApiService _contractApi;
  final FilesApiService _filesApi;
  ContractNetworkDataSourceImpl(
    this._apiClient,
    this._contractApi,
    this._filesApi,
  );

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
  Future<Result<Contract, Failure>> uploadContract(
    String consultationId,
    File file,
    double contractValue,
  ) async {
    try {
      // 1) Upload file via files service
      final uploadJson = await _filesApi.upload(
        'CONSULTATION',
        'CONTRACT',
        consultationId,
        file,
      );
      final fileUrl = (uploadJson['fileUrl']?.toString() ?? '').trim();
      if (fileUrl.isEmpty) {
        return const Error(
          ServerFailure(message: 'File upload failed: fileUrl missing'),
        );
      }

      // 2) Create contract draft using contract service
      final payload = {'contractValue': contractValue, 'fileUrl': fileUrl};
      final draft = await _contractApi.createDraft(consultationId, payload);
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

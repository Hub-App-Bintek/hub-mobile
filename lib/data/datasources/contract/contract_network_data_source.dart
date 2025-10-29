import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/contract_api_service.dart';
import 'package:pkp_hub/data/models/contract.dart';

abstract class ContractNetworkDataSource {
  Future<Result<Contract, Failure>> getContract(String consultationId);
  Future<Result<Contract, Failure>> signContract(String contractId);
  Future<Result<Contract, Failure>> rejectContract(String contractId);
  Future<Result<Contract, Failure>> uploadContract(
    String consultationId,
    File file,
  );
}

class ContractNetworkDataSourceImpl implements ContractNetworkDataSource {
  final ApiClient _apiClient;
  final ContractApiService _contractApi;
  ContractNetworkDataSourceImpl(this._apiClient, this._contractApi);

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
  Future<Result<Contract, Failure>> rejectContract(String contractId) async {
    try {
      final response = await _contractApi.rejectContract(contractId);
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
  ) async {
    try {
      final fileName = file.path.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final response = await _apiClient.dio.post(
        ApiEndpoints.contractByConsultation.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
        data: formData,
      );
      return Success(Contract.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to upload contract: $e'));
    }
  }
}

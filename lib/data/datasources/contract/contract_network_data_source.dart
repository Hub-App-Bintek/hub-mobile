import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'dart:io';

abstract class ContractNetworkDataSource {
  Future<Result<Contract, Failure>> getContract(String consultationId);
  Future<Result<Contract, Failure>> signContract(String contractId);
  Future<Result<Contract, Failure>> uploadContract(
    String consultationId,
    File file,
  );
}

class ContractNetworkDataSourceImpl implements ContractNetworkDataSource {
  final ApiClient _apiClient;
  ContractNetworkDataSourceImpl(this._apiClient);

  @override
  Future<Result<Contract, Failure>> getContract(String consultationId) async {
    try {
      final res = await _apiClient.dio.get(
        ApiEndpoints.contractByConsultation.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
      );
      return Success(Contract.fromJson(res.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse contract: $e'));
    }
  }

  @override
  Future<Result<Contract, Failure>> signContract(String contractId) async {
    try {
      final res = await _apiClient.dio.patch(
        ApiEndpoints.contractSign.replaceFirst('{contractId}', contractId),
      );
      return Success(Contract.fromJson(res.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse sign contract: $e'));
    }
  }

  @override
  Future<Result<Contract, Failure>> uploadContract(
    String consultationId,
    File file,
  ) async {
    try {
      final fileName = file.path.split('/').last;
      final form = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final res = await _apiClient.dio.post(
        ApiEndpoints.contractByConsultation.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
        data: form,
      );
      return Success(Contract.fromJson(res.data as Map<String, dynamic>));
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to upload contract: $e'));
    }
  }
}

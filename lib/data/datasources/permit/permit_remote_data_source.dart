// lib/data/datasources/permit/permit_remote_data_source.dart

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/permit_api_service.dart';
import 'package:pkp_hub/data/models/request/submit_simbg_request.dart';
import 'package:pkp_hub/data/models/response/permit_status_response.dart';

// Import the new response model
import 'package:pkp_hub/data/models/response/submit_simbg_response.dart';

abstract class PermitRemoteDataSource {
  // Update the return type in the abstract class
  Future<Result<SubmitSimbgResponse, Failure>> submitSimbgForm({
    required String projectId,
    required SubmitSimbgRequest request,
  });

  // --- Contract for the new method ---
  Future<Result<PermitStatusResponse, Failure>> getPermitStatus({
    required String projectId,
  });
}

class PermitRemoteDataSourceImpl implements PermitRemoteDataSource {
  final ApiClient _apiClient;
  final PermitApiService _permitApi;

  PermitRemoteDataSourceImpl(this._apiClient, this._permitApi);

  // Update the implementation's return type and logic
  @override
  Future<Result<SubmitSimbgResponse, Failure>> submitSimbgForm({
    required String projectId,
    required SubmitSimbgRequest request,
  }) async {
    try {
      // The API call now returns a response object
      final response = await _permitApi.submitSimbgForm(projectId, request);
      // Return the response object on success
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse submit SIMBG response: $e'),
      );
    }
  }

  @override
  Future<Result<PermitStatusResponse, Failure>> getPermitStatus({
    required String projectId,
  }) async {
    try {
      final response = await _permitApi.getPermitStatus(projectId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse permit status: $e'),
      );
    }
  }
}
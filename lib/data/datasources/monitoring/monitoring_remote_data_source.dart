import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/monitoring_api_service.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';

// --- DEFINE THE CONTRACT ---
abstract class MonitoringRemoteDataSource {
  Future<Result<void, Failure>> createMonitoringRequest({
    required int supervisorId,
    required int projectId,
  });

  Future<Result<List<ConstructionSupervisorModel>, Failure>> getProfessionals({
    String? query,
  });
}

// --- IMPLEMENT THE CONTRACT ---
class MonitoringRemoteDataSourceImpl implements MonitoringRemoteDataSource {
  final MonitoringApiService _apiService;
  final ApiClient _apiClient;

  MonitoringRemoteDataSourceImpl(this._apiService, this._apiClient);

  @override
  Future<Result<void, Failure>> createMonitoringRequest({
    required int supervisorId,
    required int projectId,
  }) async {
    try {
      final body = {
        'type': 'PAID', // As specified in the request
        'supervisorId': supervisorId,
        'projectId': projectId,
      };
      await _apiService.createMonitoringRequest(body);
      return const Success(null); // Return success with no data
    } on DioException catch (e) {
      // Delegate error handling to the shared ApiClient
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse monitoring request: $e'));
    }
  }

  @override
  Future<Result<List<ConstructionSupervisorModel>, Failure>> getProfessionals({
    String? query,
  }) async {
    try {
      final result = await _apiService.getProfessionals(query);
      return Success(result);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse supervisor request: $e'));
    }
  }
}
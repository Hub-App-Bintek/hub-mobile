import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/monitoring_api_service.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/data/models/report_detail_model.dart';
import 'package:pkp_hub/data/models/response/create_monitoring_response.dart';

// --- DEFINE THE CONTRACT ---
abstract class MonitoringRemoteDataSource {
  Future<Result<MonitoringResponse, Failure>> createMonitoringRequest({
    required int supervisorId,
    required String projectId,
  });

  Future<Result<List<ConstructionSupervisorModel>, Failure>> getProfessionals({
    String? query,
  });

  Future<Result<List<MonitoringItemModel>, Failure>> getReports({
    required int monitoringId,
  });

  Future<Result<List<MonitoringItemModel>, Failure>> getFindings({
    required int monitoringId,
  });

  Future<Result<ReportDetailModel, Failure>> getReportDetail({
    required int reportId,
  });
}

// --- IMPLEMENT THE CONTRACT ---
class MonitoringRemoteDataSourceImpl implements MonitoringRemoteDataSource {
  final MonitoringApiService _apiService;
  final ApiClient _apiClient;

  MonitoringRemoteDataSourceImpl(this._apiService, this._apiClient);

  @override
  Future<Result<MonitoringResponse, Failure>> createMonitoringRequest({
    required int supervisorId,
    required String projectId,
  }) async {
    try {
      final body = {
        'type': 'PAID', // As specified in the request
        'supervisorId': supervisorId,
        'projectId': projectId,
      };
      final result = await _apiService.createMonitoringRequest(body);
      return Success(result); // Return success with no data
    } on DioException catch (e) {
      // Delegate error handling to the shared ApiClient
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse monitoring request: $e'),
      );
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
      return Error(
        ServerFailure(message: 'Failed to parse supervisor request: $e'),
      );
    }
  }

  @override
  Future<Result<List<MonitoringItemModel>, Failure>> getReports({
    required int monitoringId,
  }) async {
    try {
      final result = await _apiService.getReports(monitoringId);
      return Success(result);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }

  @override
  Future<Result<List<MonitoringItemModel>, Failure>> getFindings({
    required int monitoringId,
  }) async {
    try {
      final result = await _apiService.getFindings(monitoringId);
      return Success(result);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }

  @override
  Future<Result<ReportDetailModel, Failure>> getReportDetail({
    required int reportId,
  }) async {
    try {
      final result = await _apiService.getReportDetail(reportId);
      return Success(result);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }
}

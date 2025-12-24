import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/monitoring/monitoring_remote_data_source.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/data/models/report_detail_model.dart';
import 'package:pkp_hub/data/models/response/create_monitoring_response.dart';
// ... other domain imports

abstract class MonitoringRepository {
  // ... (your existing repository methods, e.g., getSupervisors)

  // --- ADD THIS METHOD ---
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

class MonitoringRepositoryImpl implements MonitoringRepository {
  final MonitoringRemoteDataSource _remoteDataSource;
  // ... other datasources

  MonitoringRepositoryImpl(this._remoteDataSource);

  // ... (implementation of other methods)

  // --- IMPLEMENT THE NEW METHOD ---
  @override
  Future<Result<MonitoringResponse, Failure>> createMonitoringRequest({
    required int supervisorId,
    required String projectId,
  }) {
    // Pass the call directly to the remote data source
    return _remoteDataSource.createMonitoringRequest(
      supervisorId: supervisorId,
      projectId: projectId,
    );
  }

  @override
  Future<Result<List<ConstructionSupervisorModel>, Failure>> getProfessionals({
    String? query,
  }) async {
    return _remoteDataSource.getProfessionals(query: query);
  }

  @override
  Future<Result<List<MonitoringItemModel>, Failure>> getFindings({
    required int monitoringId,
  }) async {
    return _remoteDataSource.getFindings(monitoringId: monitoringId);
  }

  @override
  Future<Result<List<MonitoringItemModel>, Failure>> getReports({
    required int monitoringId,
  }) async {
    return _remoteDataSource.getReports(monitoringId: monitoringId);
  }

  @override
  Future<Result<ReportDetailModel, Failure>> getReportDetail({
    required int reportId,
  }) async {
    return _remoteDataSource.getReportDetail(reportId: reportId);
  }
}

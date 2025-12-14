import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/monitoring/monitoring_remote_data_source.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/features/monitoring/controllers/supervisor_screen_controller.dart';
// ... other domain imports

abstract class MonitoringRepository {
  // ... (your existing repository methods, e.g., getSupervisors)

  // --- ADD THIS METHOD ---
  Future<Result<void, Failure>> createMonitoringRequest({
    required int supervisorId,
    required int projectId,
  });

  Future<Result<List<ConstructionSupervisorModel>, Failure>> getProfessionals({
    String? query,
  });
}


class MonitoringRepositoryImpl implements MonitoringRepository {
  final MonitoringRemoteDataSource _remoteDataSource;
  // ... other datasources

  MonitoringRepositoryImpl(this._remoteDataSource);

  // ... (implementation of other methods)

  // --- IMPLEMENT THE NEW METHOD ---
  @override
  Future<Result<void, Failure>> createMonitoringRequest({
    required int supervisorId,
    required int projectId,
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
}
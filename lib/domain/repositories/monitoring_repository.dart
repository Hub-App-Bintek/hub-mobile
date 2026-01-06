import 'dart:io';

import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/monitoring/monitoring_remote_data_source.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/data/models/monitoring_contract_model.dart';
import 'package:pkp_hub/data/models/monitoring_detail_model.dart';
import 'package:pkp_hub/data/models/monitoring_document_model.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/data/models/job_completion_model.dart';
import 'package:pkp_hub/data/models/monitoring_request_item.dart';
import 'package:pkp_hub/data/models/report_detail_model.dart';
import 'package:pkp_hub/data/models/response/create_monitoring_response.dart';
import 'package:pkp_hub/data/models/response/monitoring_request_model.dart';
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

  Future<Result<MonitoringContractModel, Failure>> respondToContract({
    required int contractId,
    required bool approved,
    required String reason,
  });

  Future<Result<MonitoringContractModel, Failure>> signContract(int contractId);

  Future<Result<MonitoringDetailModel, Failure>> getMonitoringDetail(
    int monitoringId,
  );

  Future<Result<MonitoringRequestModel, Failure>> approveCompletion({
    required int requestId,
  });

  Future<Result<MonitoringDocumentModel, Failure>> uploadConstructionDocument({
    required int monitoringId,
    required File file,
    required String title,
    String? description,
  });

  Future<Result<List<MonitoringDocumentModel>, Failure>> getDocuments(
    int monitoringId,
  );

  Future<Result<List<MonitoringRequestItem>, Failure>> getMonitoringRequests({
    required String filterBy,
    String? status,
  });

  Future<Result<List<MonitoringContractModel>, Failure>> getContracts(
    int monitoringId,
  );

  Future<Result<JobCompletionModel, Failure>> getJobCompletion(int requestId);
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

  @override
  Future<Result<MonitoringContractModel, Failure>> respondToContract({
    required int contractId,
    required bool approved,
    required String reason,
  }) async {
    return _remoteDataSource.approveContract(contractId, {
      "approved": approved,
      "reason": reason,
    });
  }

  @override
  Future<Result<MonitoringContractModel, Failure>> signContract(
    int contractId,
  ) async {
    return _remoteDataSource.signContract(contractId);
  }

  @override
  Future<Result<MonitoringDetailModel, Failure>> getMonitoringDetail(
    int monitoringId,
  ) async {
    return _remoteDataSource.getMonitoringDetail(monitoringId);
  }

  @override
  Future<Result<MonitoringRequestModel, Failure>> approveCompletion({
    required int requestId,
  }) async {
    return _remoteDataSource.approveCompletion(requestId);
  }

  @override
  Future<Result<MonitoringDocumentModel, Failure>> uploadConstructionDocument({
    required int monitoringId,
    required File file,
    required String title,
    String? description,
  }) {
    return _remoteDataSource.uploadConstructionDocument(
      monitoringId: monitoringId,
      file: file,
      title: title,
      description: description,
    );
  }

  @override
  Future<Result<List<MonitoringDocumentModel>, Failure>> getDocuments(
    int monitoringId,
  ) async {
    return _remoteDataSource.getDocuments(monitoringId);
  }

  @override
  Future<Result<List<MonitoringRequestItem>, Failure>> getMonitoringRequests({
    required String filterBy,
    String? status,
  }) {
    return _remoteDataSource.getMonitoringRequests(
      filterBy: filterBy,
      status: status,
    );
  }

  @override
  Future<Result<List<MonitoringContractModel>, Failure>> getContracts(
    int monitoringId,
  ) async {
    return _remoteDataSource.getContracts(monitoringId);
  }

  @override
  Future<Result<JobCompletionModel, Failure>> getJobCompletion(
    int requestId,
  ) async {
    return _remoteDataSource.getJobCompletion(requestId);
  }
}

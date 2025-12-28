import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/files_api_service.dart';
import 'package:pkp_hub/core/network/services/monitoring_api_service.dart';
import 'package:pkp_hub/core/utils/logger.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/data/models/monitoring_contract_model.dart';
import 'package:pkp_hub/data/models/monitoring_detail_model.dart';
import 'package:pkp_hub/data/models/monitoring_document_model.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/data/models/monitoring_request_item.dart';
import 'package:pkp_hub/data/models/report_detail_model.dart';
import 'package:pkp_hub/data/models/response/create_monitoring_response.dart';
import 'package:pkp_hub/data/models/response/monitoring_request_model.dart';

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

  Future<Result<MonitoringContractModel, Failure>> approveContract(
      int contractId,
      Map<String, dynamic> body,
      );

  Future<Result<MonitoringContractModel, Failure>> signContract(int contractId);

  Future<Result<MonitoringDetailModel, Failure>> getMonitoringDetail(int monitoringId);


  Future<Result<MonitoringRequestModel, Failure>> approveCompletion(int requestId);

  Future<Result<MonitoringDocumentModel, Failure>> uploadConstructionDocument({
    required int monitoringId,
    required File file,
    required String title,
    String? description,
  });

  Future<Result<List<MonitoringDocumentModel>, Failure>> getDocuments(int monitoringId);

  Future<Result<List<MonitoringRequestItem>, Failure>> getMonitoringRequests({required String filterBy, String? status});

  Future<Result<List<MonitoringContractModel>, Failure>> getContracts(int monitoringId);
}

// --- IMPLEMENT THE CONTRACT ---
class MonitoringRemoteDataSourceImpl implements MonitoringRemoteDataSource {
  final MonitoringApiService _apiService;
  final ApiClient _apiClient;
  final FilesApiService _fileApiService;


  MonitoringRemoteDataSourceImpl(this._apiService, this._apiClient, this._fileApiService);

  final _logger = Logger();

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

  @override
  Future<Result<MonitoringContractModel, Failure>> approveContract(
      int contractId,
      Map<String, dynamic> body,
      ) async {
    try {
      final response = await _apiService.approveContract(contractId, body);
      return Success(response);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }

  @override
  Future<Result<MonitoringContractModel, Failure>> signContract(int contractId) async {
    try {
      final response = await _apiService.signContract(contractId);
      return Success(response);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }

  @override
  Future<Result<MonitoringDetailModel, Failure>> getMonitoringDetail(int monitoringId) async {
    try {
      final response = await _apiService.getMonitoringDetail(monitoringId);
      return Success(response);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }

  @override
  Future<Result<MonitoringRequestModel, Failure>> approveCompletion(int requestId) async {
    try {
      final response = await _apiService.approveCompletion(requestId);
      return Success(response);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }

  @override
  Future<Result<MonitoringDocumentModel, Failure>> uploadConstructionDocument({
    required int monitoringId,
    required File file,
    required String title,
    String? description,
  }) async {
    try {

      // Step 1: Physical File Upload
      // Ensure the category is 'monitoring' as per API docs
      final fileUpload = await _fileApiService.upload(
        'documents',
        'documents',
        monitoringId.toString(),
        file,
      );

      // Step 2: Register Document with Monitoring API
      final response = await _apiService.uploadDocument({
        "monitoringId": monitoringId,
        "documentUrl": fileUpload['fileUrl'],
        "title": title,
        "description": description ?? "",
      });

      return Success(response);
    } catch (e, stack) {
      return Error(ServerFailure(message: 'Failed to upload document: $e'));
    }
  }


  @override
  Future<Result<List<MonitoringDocumentModel>, Failure>> getDocuments(int monitoringId) async {
    try {
      final response = await _apiService.getDocuments(monitoringId);
      return Success(response);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }

  @override
  Future<Result<List<MonitoringRequestItem>, Failure>> getMonitoringRequests({required String filterBy, String? status}) async {
    try {
      final response = await _apiService.getMonitoringRequests(filterBy: filterBy, status: status);
      return Success(response);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }

  @override
  Future<Result<List<MonitoringContractModel>, Failure>> getContracts(int monitoringId) async {
    try {
      final response = await _apiService.getContracts(monitoringId);
      return Success(response);
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to parse request: $e'));
    }
  }


}

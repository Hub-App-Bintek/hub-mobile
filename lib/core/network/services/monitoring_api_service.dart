import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/data/models/monitoring_contract_model.dart';
import 'package:pkp_hub/data/models/monitoring_detail_model.dart';
import 'package:pkp_hub/data/models/monitoring_document_model.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/data/models/monitoring_request_item.dart';
import 'package:pkp_hub/data/models/report_detail_model.dart';
import 'package:pkp_hub/data/models/response/create_monitoring_response.dart';
import 'package:pkp_hub/data/models/response/monitoring_request_model.dart';
import 'package:retrofit/retrofit.dart';

part 'monitoring_api_service.g.dart'; // Ensure this matches your file name

@RestApi()
abstract class MonitoringApiService {
  factory MonitoringApiService(Dio dio, {String baseUrl}) =
      _MonitoringApiService;

  // ... (any existing methods)

  // --- ADD THIS METHOD ---
  @POST(ApiEndpoints.monitoringRequests)
  Future<MonitoringResponse> createMonitoringRequest(
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiEndpoints.getProfessionals)
  Future<List<ConstructionSupervisorModel>> getProfessionals(
    @Query('query') String? query,
  );

  @GET(ApiEndpoints.getMonitoringReports)
  Future<List<MonitoringItemModel>> getReports(
    @Path('monitoringId') int monitoringId,
  );

  @GET(ApiEndpoints.getMonitoringFindings)
  Future<List<MonitoringItemModel>> getFindings(
    @Path('monitoringId') int monitoringId,
  );

  @GET(ApiEndpoints.getReportDetail)
  Future<ReportDetailModel> getReportDetail(@Path('reportId') int reportId);

  @PUT(ApiEndpoints.approveContract)
  Future<MonitoringContractModel> approveContract(
    @Path('id') int contractId,
    @Body() Map<String, dynamic> body, // {"approved": bool, "reason": String}
  );

  @PUT(ApiEndpoints.signContract)
  Future<MonitoringContractModel> signContract(@Path('id') int contractId);

  @PUT(ApiEndpoints.approveCompletion)
  Future<MonitoringRequestModel> approveCompletion(@Path('id') int requestId);

  @POST(ApiEndpoints.uploadDocumentsMonitoring)
  Future<MonitoringDocumentModel> uploadDocument(
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiEndpoints.listDocuments)
  Future<List<MonitoringDocumentModel>> getDocuments(
    @Path('id') int monitoringId,
  );

  @GET(ApiEndpoints.getMonitoringDetail)
  Future<MonitoringDetailModel> getMonitoringDetail(
    @Path('monitoringId') int monitoringId,
  );

  @GET(ApiEndpoints.monitoringRequests)
  Future<List<MonitoringRequestItem>> getMonitoringRequests({
    @Query('filterBy') required String filterBy,
    @Query('status') String? status,
  });

  @GET(ApiEndpoints.listContracts)
  Future<List<MonitoringContractModel>> getContracts(
    @Path('monitoringId') int monitoringId,
  );
}

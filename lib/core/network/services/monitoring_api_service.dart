import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/construction_supervisor_model.dart';
import 'package:pkp_hub/data/models/monitoring_item_model.dart';
import 'package:pkp_hub/data/models/report_detail_model.dart';
import 'package:retrofit/retrofit.dart';

part 'monitoring_api_service.g.dart'; // Ensure this matches your file name

@RestApi()
abstract class MonitoringApiService {
  factory MonitoringApiService(Dio dio,
      {String baseUrl}) = _MonitoringApiService;

  // ... (any existing methods)

  // --- ADD THIS METHOD ---
  @POST(ApiEndpoints.monitoringRequests)
  Future<void> createMonitoringRequest(@Body() Map<String, dynamic> body);

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
  Future<ReportDetailModel> getReportDetail(
      @Path('reportId') int reportId,
      );
}
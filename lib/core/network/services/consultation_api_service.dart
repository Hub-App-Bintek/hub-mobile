import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';

part 'consultation_api_service.g.dart';

@RestApi()
abstract class ConsultationApiService {
  factory ConsultationApiService(Dio dio, {String? baseUrl}) =
      _ConsultationApiService;

  @GET(ApiEndpoints.consultations)
  Future<List<Consultation>> getConsultations();

  @GET(ApiEndpoints.consultationDetail)
  Future<Consultation> getConsultationDetail(
    @Path('consultationId') String consultationId,
  );

  // 1. Create consultation
  @POST(ApiEndpoints.consultations)
  Future<CreateConsultationResponse> createConsultation(
    @Body() CreateConsultationRequest body,
  );

  @POST(ApiEndpoints.consultationAccept)
  Future<Consultation> acceptConsultation(
    @Path('consultationId') String consultationId,
  );

  @POST(ApiEndpoints.consultationReject)
  Future<Consultation> rejectConsultation(
    @Path('consultationId') String consultationId,
  );

  @POST(ApiEndpoints.consultationStartActive)
  Future<Consultation> startActiveConsultation(
    @Path('consultationId') String consultationId,
  );

  @POST(ApiEndpoints.consultationStartRevision)
  Future<Consultation> startRevision(
    @Path('consultationId') String consultationId,
    @Query('notes') String? notes,
  );

  @POST(ApiEndpoints.consultationFinalize)
  Future<Consultation> finalizeConsultation(
    @Path('consultationId') String consultationId,
  );
}

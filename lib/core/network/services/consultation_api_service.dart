import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/consultation.dart';
import 'package:pkp_hub/data/models/request/accept_consultation_request.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/response/consultation_details_response.dart';
import 'package:pkp_hub/data/models/response/consultations_response.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';

part 'consultation_api_service.g.dart';

@RestApi()
abstract class ConsultationApiService {
  factory ConsultationApiService(Dio dio, {String? baseUrl}) =
      _ConsultationApiService;

  @POST(ApiEndpoints.consultations)
  Future<CreateConsultationResponse> createConsultation(
    @Body() CreateConsultationRequest body,
  );

  @GET(ApiEndpoints.consultationProjects)
  Future<ConsultationsResponse> getConsultations(
    @Query('status') String? status,
    @Query('page') int? page,
  );

  @GET(ApiEndpoints.consultationDetail)
  Future<ConsultationDetailsResponse> getConsultationDetail(
    @Path('consultationId') String consultationId,
  );

  @POST(ApiEndpoints.consultationAccept)
  Future<Consultation> acceptConsultation(
    @Path('consultationId') String consultationId,
    @Body() AcceptConsultationRequest body,
  );
}

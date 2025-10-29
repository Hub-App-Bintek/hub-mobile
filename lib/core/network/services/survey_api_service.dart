import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';
import 'package:pkp_hub/data/models/response/survey_response.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';
import 'package:retrofit/retrofit.dart';

part 'survey_api_service.g.dart';

@RestApi()
abstract class SurveyApiService {
  factory SurveyApiService(Dio dio, {String? baseUrl}) = _SurveyApiService;

  @POST(ApiEndpoints.surveyByConsultation)
  Future<SurveyResponse> createSurveySchedule(
    @Path('consultationId') String consultationId,
    @Body() CreateSurveyScheduleRequest body,
  );

  @POST(ApiEndpoints.surveyApprove)
  Future<SurveySchedule> approveSurveySchedule(
    @Path('consultationId') String consultationId,
  );

  @POST(ApiEndpoints.surveyReject)
  Future<SurveySchedule> rejectSurveySchedule(
    @Path('consultationId') String consultationId,
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiEndpoints.surveyReschedule)
  Future<SurveySchedule> rescheduleSurvey(
    @Path('consultationId') String consultationId,
    @Body() CreateSurveyScheduleRequest body,
  );

  @POST(ApiEndpoints.surveyComplete)
  Future<void> completeSurvey(@Path('consultationId') String consultationId);

  @GET(ApiEndpoints.surveyByConsultation)
  Future<List<SurveySchedule>> getSurveySchedules(
    @Path('consultationId') String consultationId,
  );
}

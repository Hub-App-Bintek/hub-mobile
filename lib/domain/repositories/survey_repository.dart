import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/survey/survey_network_data_source.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';
import 'package:pkp_hub/data/models/response/survey_response.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';

abstract class SurveyRepository {
  Future<Result<SurveyResponse, Failure>> createSurveySchedule(
    String consultationId,
    CreateSurveyScheduleRequest request,
  );
  Future<Result<SurveySchedule, Failure>> approveSurveySchedule(
    String consultationId,
  );
  Future<Result<SurveySchedule, Failure>> rejectSurveySchedule(
    String consultationId, {
    String? notes,
  });
  Future<Result<SurveySchedule, Failure>> rescheduleSurvey(
    String consultationId,
    CreateSurveyScheduleRequest request,
  );
  Future<Result<void, Failure>> completeSurvey(String consultationId);
  Future<Result<List<SurveySchedule>, Failure>> getSurveySchedules(
    String consultationId,
  );
}

class SurveyRepositoryImpl implements SurveyRepository {
  final SurveyNetworkDataSource _ds;
  SurveyRepositoryImpl(this._ds);

  @override
  Future<Result<SurveyResponse, Failure>> createSurveySchedule(
    String consultationId,
    CreateSurveyScheduleRequest request,
  ) => _ds.createSurveySchedule(consultationId, request);

  @override
  Future<Result<SurveySchedule, Failure>> approveSurveySchedule(
    String consultationId,
  ) => _ds.approveSurveySchedule(consultationId);

  @override
  Future<Result<SurveySchedule, Failure>> rejectSurveySchedule(
    String consultationId, {
    String? notes,
  }) => _ds.rejectSurveySchedule(consultationId, notes: notes);

  @override
  Future<Result<SurveySchedule, Failure>> rescheduleSurvey(
    String consultationId,
    CreateSurveyScheduleRequest request,
  ) => _ds.rescheduleSurvey(consultationId, request);

  @override
  Future<Result<void, Failure>> completeSurvey(String consultationId) =>
      _ds.completeSurvey(consultationId);

  @override
  Future<Result<List<SurveySchedule>, Failure>> getSurveySchedules(
    String consultationId,
  ) => _ds.getSurveySchedules(consultationId);
}

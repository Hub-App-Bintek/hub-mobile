import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/survey_api_service.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';
import 'package:pkp_hub/data/models/response/survey_response.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';

abstract class SurveyNetworkDataSource {
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

class SurveyNetworkDataSourceImpl implements SurveyNetworkDataSource {
  final ApiClient _apiClient;
  final SurveyApiService _surveyApi;

  SurveyNetworkDataSourceImpl(this._apiClient, this._surveyApi);

  @override
  Future<Result<SurveyResponse, Failure>> createSurveySchedule(
    String consultationId,
    CreateSurveyScheduleRequest request,
  ) async {
    try {
      final response = await _surveyApi.createSurveySchedule(
        consultationId,
        request,
      );
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse create survey schedule: $e'),
      );
    }
  }

  @override
  Future<Result<SurveySchedule, Failure>> approveSurveySchedule(
    String consultationId,
  ) async {
    try {
      final response = await _surveyApi.approveSurveySchedule(consultationId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse approve survey schedule: $e'),
      );
    }
  }

  @override
  Future<Result<SurveySchedule, Failure>> rejectSurveySchedule(
    String consultationId, {
    String? notes,
  }) async {
    try {
      final response = await _surveyApi.rejectSurveySchedule(
        consultationId,
        notes == null ? <String, dynamic>{} : {'notes': notes},
      );
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse reject survey schedule: $e'),
      );
    }
  }

  @override
  Future<Result<SurveySchedule, Failure>> rescheduleSurvey(
    String consultationId,
    CreateSurveyScheduleRequest request,
  ) async {
    try {
      final response = await _surveyApi.rescheduleSurvey(
        consultationId,
        request,
      );
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse reschedule survey: $e'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> completeSurvey(String consultationId) async {
    try {
      await _surveyApi.completeSurvey(consultationId);
      return const Success(null);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(ServerFailure(message: 'Failed to complete survey: $e'));
    }
  }

  @override
  Future<Result<List<SurveySchedule>, Failure>> getSurveySchedules(
    String consultationId,
  ) async {
    try {
      final response = await _surveyApi.getSurveySchedules(consultationId);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse survey schedules: $e'),
      );
    }
  }
}

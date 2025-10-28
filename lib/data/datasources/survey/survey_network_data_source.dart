import 'package:dio/dio.dart';
import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';

abstract class SurveyNetworkDataSource {
  Future<Result<SurveySchedule, Failure>> createSurveySchedule(
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

  SurveyNetworkDataSourceImpl(this._apiClient);

  @override
  Future<Result<SurveySchedule, Failure>> createSurveySchedule(
    String consultationId,
    CreateSurveyScheduleRequest request,
  ) async {
    try {
      final res = await _apiClient.dio.post(
        ApiEndpoints.surveyByConsultation.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
        data: request.toJson(),
      );
      return Success(SurveySchedule.fromJson(res.data as Map<String, dynamic>));
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
      final res = await _apiClient.dio.post(
        ApiEndpoints.surveyApprove.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
      );
      return Success(SurveySchedule.fromJson(res.data as Map<String, dynamic>));
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
      final res = await _apiClient.dio.post(
        ApiEndpoints.surveyReject.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
        data: notes == null ? null : {'notes': notes},
      );
      return Success(SurveySchedule.fromJson(res.data as Map<String, dynamic>));
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
      final res = await _apiClient.dio.post(
        ApiEndpoints.surveyReschedule.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
        data: request.toJson(),
      );
      return Success(SurveySchedule.fromJson(res.data as Map<String, dynamic>));
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
      await _apiClient.dio.post(
        ApiEndpoints.surveyComplete.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
      );
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
      final res = await _apiClient.dio.get(
        ApiEndpoints.surveyByConsultation.replaceFirst(
          '{consultationId}',
          consultationId,
        ),
      );
      final data = res.data as List<dynamic>;
      return Success(
        data
            .map((e) => SurveySchedule.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse survey schedules: $e'),
      );
    }
  }
}

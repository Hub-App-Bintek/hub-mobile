// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/survey/create_survey_schedule_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';
import 'package:pkp_hub/domain/repositories/survey_repository.dart';

class CreateSurveyScheduleParams {
  final String consultationId;
  final CreateSurveyScheduleRequest request;
  CreateSurveyScheduleParams({
    required this.consultationId,
    required this.request,
  });
}

class CreateSurveyScheduleUseCase
    extends UseCase<SurveySchedule, CreateSurveyScheduleParams> {
  final SurveyRepository _repository;
  CreateSurveyScheduleUseCase(this._repository);

  @override
  Future<Result<SurveySchedule, Failure>> call(
    CreateSurveyScheduleParams params,
  ) {
    return _repository.createSurveySchedule(
      params.consultationId,
      params.request,
    );
  }
}

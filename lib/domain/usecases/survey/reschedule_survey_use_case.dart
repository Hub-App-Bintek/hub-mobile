// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/survey/reschedule_survey_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/request/create_survey_schedule_request.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';
import 'package:pkp_hub/domain/repositories/survey_repository.dart';

class RescheduleSurveyParams {
  final String consultationId;
  final CreateSurveyScheduleRequest request;
  RescheduleSurveyParams({required this.consultationId, required this.request});
}

class RescheduleSurveyUseCase
    extends UseCase<SurveySchedule, RescheduleSurveyParams> {
  final SurveyRepository _repository;
  RescheduleSurveyUseCase(this._repository);

  @override
  Future<Result<SurveySchedule, Failure>> call(RescheduleSurveyParams params) {
    return _repository.rescheduleSurvey(params.consultationId, params.request);
  }
}

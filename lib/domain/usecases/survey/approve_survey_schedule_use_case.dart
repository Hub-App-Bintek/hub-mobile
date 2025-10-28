// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/survey/approve_survey_schedule_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';
import 'package:pkp_hub/domain/repositories/survey_repository.dart';

class ApproveSurveyScheduleUseCase extends UseCase<SurveySchedule, String> {
  final SurveyRepository _repository;
  ApproveSurveyScheduleUseCase(this._repository);

  @override
  Future<Result<SurveySchedule, Failure>> call(String consultationId) {
    return _repository.approveSurveySchedule(consultationId);
  }
}

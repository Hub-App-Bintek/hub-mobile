// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/survey/reject_survey_schedule_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/data/models/survey_schedule.dart';
import 'package:pkp_hub/domain/repositories/survey_repository.dart';

class RejectSurveyScheduleParams {
  final String consultationId;
  final String? notes;
  RejectSurveyScheduleParams({required this.consultationId, this.notes});
}

class RejectSurveyScheduleUseCase
    extends UseCase<SurveySchedule, RejectSurveyScheduleParams> {
  final SurveyRepository _repository;
  RejectSurveyScheduleUseCase(this._repository);

  @override
  Future<Result<SurveySchedule, Failure>> call(
    RejectSurveyScheduleParams params,
  ) {
    return _repository.rejectSurveySchedule(
      params.consultationId,
      notes: params.notes,
    );
  }
}

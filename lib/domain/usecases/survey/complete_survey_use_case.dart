// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/domain/usecases/survey/complete_survey_use_case.dart
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/usecases/use_case.dart';
import 'package:pkp_hub/domain/repositories/survey_repository.dart';

class CompleteSurveyUseCase extends UseCase<void, String> {
  final SurveyRepository _repository;
  CompleteSurveyUseCase(this._repository);

  @override
  Future<Result<void, Failure>> call(String consultationId) {
    return _repository.completeSurvey(consultationId);
  }
}

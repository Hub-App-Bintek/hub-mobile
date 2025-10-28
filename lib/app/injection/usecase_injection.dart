// filepath: /Users/ibnutriyardi/StudioProjects/hub-mobile/lib/app/injection/usecase_injection.dart
import 'package:get/get.dart';
import 'package:pkp_hub/domain/usecases/survey/create_survey_schedule_use_case.dart';
import 'package:pkp_hub/domain/repositories/survey_repository.dart';

class UseCaseInjection {
  UseCaseInjection._();

  static void init() {
    Get.lazyPut<CreateSurveyScheduleUseCase>(
      () => CreateSurveyScheduleUseCase(Get.find<SurveyRepository>()),
      fenix: true,
    );
  }
}

import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/repositories/consultation_repository.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';
import 'package:pkp_hub/domain/usecases/consultation/create_consultation_use_case.dart';
import 'package:pkp_hub/features/project/controllers/location_details_controller.dart';

class LocationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProjectUseCase>(
      () => CreateProjectUseCase(Get.find<ProjectRepository>()),
    );

    Get.lazyPut<CreateConsultationUseCase>(
      () => CreateConsultationUseCase(Get.find<ConsultationRepository>()),
    );

    Get.lazyPut<LocationDetailsController>(() {
      final args = Get.arguments as Map<String, dynamic>?;
      return LocationDetailsController(
        Get.find<CreateProjectUseCase>(),
        Get.find<CreateConsultationUseCase>(),
        args?['consultantId'] as String?,
        args?['isPaidConsultation'] as bool? ?? false,
        args?['type'] as String?,
      );
    });
  }
}

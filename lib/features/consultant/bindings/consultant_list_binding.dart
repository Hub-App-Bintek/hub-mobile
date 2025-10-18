import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';
import 'package:pkp_hub/features/consultant/controllers/consultant_list_controller.dart';

class ConsultantListBinding extends Bindings {
  @override
  void dependencies() {
    // Register use case using the repository already provided by RepositoryInjection
    Get.lazyPut<GetConsultantsUseCase>(
      () => GetConsultantsUseCase(Get.find<ConsultantRepository>()),
    );

    Get.lazyPut<ConsultantListController>(
      () => ConsultantListController(Get.find<GetConsultantsUseCase>()),
    );
  }
}

import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';
import 'package:pkp_hub/features/consultation/controllers/consultants_controller.dart';

class ConsultantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetConsultantsUseCase>(
      () => GetConsultantsUseCase(Get.find<ConsultantRepository>()),
      fenix: true,
    );

    Get.lazyPut<ConsultantsController>(
      () => ConsultantsController(
        Get.find<GetConsultantsUseCase>(),
        Get.find<UserStorage>(),
      ),
      fenix: true,
    );
  }
}

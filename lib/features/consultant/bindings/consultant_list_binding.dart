import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';
import 'package:pkp_hub/features/consultant/controllers/consultants_controller.dart';

class ConsultantListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetConsultantsUseCase>(
      () => GetConsultantsUseCase(Get.find<ConsultantRepository>()),
    );

    Get.lazyPut<ConsultantsController>(() {
      final args = Get.arguments as Map<String, dynamic>?;
      return ConsultantsController(
        Get.find<GetConsultantsUseCase>(),
        args?['projectId'] ?? '',
        (args?['lat'] as num?)?.toDouble() ?? 0.0,
        (args?['long'] as num?)?.toDouble() ?? 0.0,
        args?['type'] ?? '',
      );
    });
  }
}

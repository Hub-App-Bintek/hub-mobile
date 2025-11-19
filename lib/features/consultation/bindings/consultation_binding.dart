import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_controller.dart';

class ConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetConsultantsUseCase>(
      () => GetConsultantsUseCase(Get.find<ConsultantRepository>()),
    );

    Get.lazyPut<ConsultationController>(() {
      final args = Get.arguments as Map<String, dynamic>?;
      final projectIdArg = args?['projectId'];
      final projectId = projectIdArg?.toString() ?? '';
      return ConsultationController(
        Get.find<GetConsultantsUseCase>(),
        Get.find<UserStorage>(),
        projectId,
        (args?['lat'] as num?)?.toDouble() ?? 0.0,
        (args?['long'] as num?)?.toDouble() ?? 0.0,
        args?['sortBy'] as String?,
        args?['showCreateCta'] as bool? ?? false,
        args?['requireLoginForAction'] as bool? ?? false,
        args?['type'] as String? ?? '',
      )..selectedSort.value = (args?['sortBy'] as String?) ?? '';
    }, fenix: true);
  }
}

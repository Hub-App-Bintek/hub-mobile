import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/consultant_repository.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultants_use_case.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_controller.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';

class ConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetConsultantsUseCase>(
      () => GetConsultantsUseCase(Get.find<ConsultantRepository>()),
    );

    Get.lazyPut<ConsultationController>(() {
      final rawArgs = Get.arguments;
      ConsultationArgs args;
      if (rawArgs is ConsultationArgs) {
        args = rawArgs;
      } else if (rawArgs is Map<String, dynamic>) {
        args = ConsultationArgs(
          projectId: (rawArgs['projectId'] ?? '').toString(),
          lat: (rawArgs['lat'] as num?)?.toDouble() ?? 0.0,
          long: (rawArgs['long'] as num?)?.toDouble() ?? 0.0,
          sortBy: rawArgs['sortBy'] as String?,
          showCreateCta: rawArgs['showCreateCta'] as bool? ?? false,
          requireLoginForAction:
              rawArgs['requireLoginForAction'] as bool? ?? false,
          type: rawArgs['type'] as String?,
        );
      } else {
        args = const ConsultationArgs(projectId: '');
      }
      return ConsultationController(
        Get.find<GetConsultantsUseCase>(),
        Get.find<UserStorage>(),
        args.projectId,
        args.lat,
        args.long,
        args.sortBy,
        args.showCreateCta,
        args.requireLoginForAction,
        args.type ?? '',
      )..selectedSort.value = args.sortBy ?? '';
    }, fenix: true);
  }
}

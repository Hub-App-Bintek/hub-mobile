import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/enums/project_type.dart';
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

    Get.lazyPut<ConsultantsController>(() {
      final rawArgs = Get.arguments;
      ConsultantsArgs args;
      if (rawArgs is ConsultantsArgs) {
        args = rawArgs;
      } else if (rawArgs is Map<String, dynamic>) {
        args = ConsultantsArgs(
          projectId: (rawArgs['projectId'] ?? '').toString(),
          lat: (rawArgs['lat'] as num?)?.toDouble() ?? 0.0,
          long: (rawArgs['long'] as num?)?.toDouble() ?? 0.0,
          sortBy: rawArgs['sortBy'] as String?,
          showCreateCta: rawArgs['showCreateCta'] as bool? ?? false,
          requireLoginForAction:
              rawArgs['requireLoginForAction'] as bool? ?? false,
          type: rawArgs['type'] as String? ?? consultation.name,
        );
      } else {
        args = ConsultantsArgs(projectId: '', type: consultation.name);
      }
      return ConsultantsController(
        Get.find<GetConsultantsUseCase>(),
        Get.find<UserStorage>(),
        args.projectId,
        args.lat,
        args.long,
        args.sortBy,
        args.showCreateCta,
        args.requireLoginForAction,
      )..selectedSort.value = args.sortBy ?? '';
    }, fenix: true);
  }
}

import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/repositories/location_repository.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';
import 'package:pkp_hub/features/monitoring/controllers/monitoring_form_controller.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';

class MonitoringFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProjectUseCase>(
      () => CreateProjectUseCase(Get.find<ProjectRepository>()),
    );
    Get.lazyPut<GetProvincesUseCase>(
      () => GetProvincesUseCase(Get.find<LocationRepository>()),
    );
    Get.lazyPut<GetRegenciesUseCase>(
      () => GetRegenciesUseCase(Get.find<LocationRepository>()),
    );
    Get.lazyPut<GetDistrictsUseCase>(
      () => GetDistrictsUseCase(Get.find<LocationRepository>()),
    );
    Get.lazyPut<GetVillagesUseCase>(
      () => GetVillagesUseCase(Get.find<LocationRepository>()),
    );

    Get.lazyPut<MonitoringFormController>(() {
      final rawArgs = Get.arguments;
      LocationDetailsArgs args;
      if (rawArgs is LocationDetailsArgs) {
        args = rawArgs;
      } else if (rawArgs is Map<String, dynamic>) {
        args = LocationDetailsArgs(
          consultantId: rawArgs['consultantId'] as String?,
          isPaidConsultation: rawArgs['isPaidConsultation'] as bool? ?? false,
          type: rawArgs['type'] as String?,
        );
      } else {
        args = const LocationDetailsArgs();
      }
      return MonitoringFormController(
        Get.find<CreateProjectUseCase>(),
        Get.find<GetProvincesUseCase>(),
        Get.find<GetRegenciesUseCase>(),
        Get.find<GetDistrictsUseCase>(),
        Get.find<GetVillagesUseCase>(),
        args.type,
      );
    }, fenix: true);
  }
}

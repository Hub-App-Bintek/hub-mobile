import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/location_repository.dart';
import 'package:pkp_hub/domain/repositories/project_repository.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';
import 'package:pkp_hub/features/monitoring/controllers/monitoring_form_controller.dart';

class MonitoringFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProjectUseCase>(
      () => CreateProjectUseCase(Get.find<ProjectRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetProvincesUseCase>(
      () => GetProvincesUseCase(Get.find<LocationRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetRegenciesUseCase>(
      () => GetRegenciesUseCase(Get.find<LocationRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetDistrictsUseCase>(
      () => GetDistrictsUseCase(Get.find<LocationRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetVillagesUseCase>(
      () => GetVillagesUseCase(Get.find<LocationRepository>()),
      fenix: true,
    );

    Get.lazyPut<MonitoringFormController>(
      () => MonitoringFormController(
        Get.find<CreateProjectUseCase>(),
        Get.find<GetProvincesUseCase>(),
        Get.find<GetRegenciesUseCase>(),
        Get.find<GetDistrictsUseCase>(),
        Get.find<GetVillagesUseCase>(),
      ),
      fenix: true,
    );
  }
}

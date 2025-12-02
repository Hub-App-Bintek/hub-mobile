// lib/features/licensing/bindings/licensing_location_details_binding.dart

import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/location_repository.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';
import 'package:pkp_hub/features/licensing/controllers/licensing_location_details_controller.dart';

class LicensingLocationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // Assumes ProjectRepository is already registered globally or in a parent binding
    Get.lazyPut(() => CreateProjectUseCase(Get.find()));

    // Pass the use case into the controller
    Get.lazyPut(
      () => LicensingLocationDetailsController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
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

    // ... other dependencies for this binding ...
  }
}

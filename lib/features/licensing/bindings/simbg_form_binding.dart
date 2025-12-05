// lib/features/licensing/bindings/simbg_form_binding.dart

import 'package:get/get.dart';
import 'package:pkp_hub/app/widgets/controllers/location_selector_controller.dart';
import 'package:pkp_hub/domain/repositories/location_repository.dart';
import 'package:pkp_hub/domain/repositories/permit_repository.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';
import 'package:pkp_hub/domain/usecases/permit/submit_simbg_form_use_case.dart';
import 'package:pkp_hub/features/licensing/controllers/simbg_form_controller.dart';

// You might need to import the repository if it's not globally available
// import 'package:pkp_hub/domain/repositories/permit_repository.dart';
// import 'package:pkp_hub/data/repositories/permit_repository_impl.dart';
// import 'package:pkp_hub/data/datasources/permit/permit_remote_data_source.dart';

class SimbgFormBinding extends Bindings {
  @override
  void dependencies() {
    // This assumes PermitRepository is already registered. If not, you must register it first.
    // Example of full chain if not registered elsewhere:
    // Get.lazyPut<PermitRemoteDataSource>(() => PermitRemoteDataSourceImpl(Get.find()));
    // Get.lazyPut<PermitRepository>(() => PermitRepositoryImpl(Get.find()));

    const locationTag = 'simbgForm';

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

    Get.lazyPut<LocationSelectorController>(
          () => LocationSelectorController(
        Get.find<GetProvincesUseCase>(),
        Get.find<GetRegenciesUseCase>(),
        Get.find<GetDistrictsUseCase>(),
        Get.find<GetVillagesUseCase>(),
      ),
      tag: locationTag, // Use the unique tag
    );

    Get.lazyPut<SubmitSimbgFormUseCase>(
      () => SubmitSimbgFormUseCase(Get.find<PermitRepository>()),
    );
    Get.lazyPut(
      () => SIMBGFormController(
        Get.find<SubmitSimbgFormUseCase>(),
        Get.find<LocationSelectorController>(tag: locationTag),
      ),
    );
  }
}

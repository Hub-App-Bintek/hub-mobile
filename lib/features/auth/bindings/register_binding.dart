import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/auth_repository.dart';
import 'package:pkp_hub/domain/repositories/location_repository.dart';
import 'package:pkp_hub/domain/usecases/auth/register_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';
import 'package:pkp_hub/features/auth/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUseCase>(
      () => RegisterUseCase(Get.find<AuthRepository>()),
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

    Get.lazyPut<RegisterController>(
      () => RegisterController(
        Get.find<RegisterUseCase>(),
        Get.find<GetProvincesUseCase>(),
        Get.find<GetRegenciesUseCase>(),
        Get.find<GetDistrictsUseCase>(),
        Get.find<GetVillagesUseCase>(),
      ),
      fenix: true,
    );
  }
}

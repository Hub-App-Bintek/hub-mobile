// import 'package:get/get.dart';
// import 'package:get/get_instance/src/bindings_interface.dart';
// import 'package:pkp_hub/app/widgets/controllers/location_selector_controller.dart';
// import 'package:pkp_hub/domain/repositories/location_repository.dart';
// import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
// import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
// import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
// import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';
//
// class LocationSelectorBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<GetProvincesUseCase>(
//       () => GetProvincesUseCase(Get.find<LocationRepository>()),
//     );
//     Get.lazyPut<GetRegenciesUseCase>(
//       () => GetRegenciesUseCase(Get.find<LocationRepository>()),
//     );
//     Get.lazyPut<GetDistrictsUseCase>(
//       () => GetDistrictsUseCase(Get.find<LocationRepository>()),
//     );
//     Get.lazyPut<GetVillagesUseCase>(
//       () => GetVillagesUseCase(Get.find<LocationRepository>()),
//     );
//
//     Get.lazyPut(
//       () => LocationSelectorController(
//         Get.find<GetProvincesUseCase>(),
//         Get.find<GetRegenciesUseCase>(),
//         Get.find<GetDistrictsUseCase>(),
//         Get.find<GetVillagesUseCase>(),
//       ),
//     );
//   }
// }

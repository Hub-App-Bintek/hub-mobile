// lib/features/licensing/bindings/licensing_binding.dart
import 'package:get/get.dart';
import 'package:pkp_hub/domain/usecases/project/get_project_list_use_case.dart';
import 'package:pkp_hub/features/licensing/controllers/licensing_controller.dart';

class LicensingBinding extends Bindings {
  @override
  void dependencies() {
    // Assuming the repository is already injected elsewhere
    Get.lazyPut(() => GetProjectsUseCase(Get.find()));
    Get.lazyPut(() => LicensingController(Get.find<GetProjectsUseCase>()));
  }
}

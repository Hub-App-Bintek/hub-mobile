// lib/features/licensing/bindings/licensing_location_details_binding.dart

import 'package:get/get.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';
import 'package:pkp_hub/features/licensing/controllers/licensing_location_details_controller.dart';

class LicensingLocationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // Assumes ProjectRepository is already registered globally or in a parent binding
    Get.lazyPut(() => CreateProjectUseCase(Get.find()));

    // Pass the use case into the controller
    Get.lazyPut(() => LicensingLocationDetailsController(Get.find()));

    // ... other dependencies for this binding ...
  }
}

// lib/features/licensing/bindings/licensing_details_binding.dart

import 'package:get/get.dart';
import 'package:pkp_hub/domain/usecases/permit/get_permit_status_use_case.dart';
import 'package:pkp_hub/features/licensing/controllers/licensing_details_controller.dart';

class LicensingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // This assumes PermitRepository is already registered in a higher-level binding
    // (like RepositoryInjection or AppBinding) as per your guidelines.
    Get.lazyPut(() => GetPermitStatusUseCase(Get.find()), fenix: true);

    // The controller now requires the use case in its constructor.
    Get.lazyPut(() => LicensingDetailsController(Get.find()), fenix: true);
  }
}

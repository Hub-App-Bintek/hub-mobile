// lib/features/licensing/bindings/simbg_form_binding.dart

import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/permit_repository.dart';
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

    Get.lazyPut<SubmitSimbgFormUseCase>(
      () => SubmitSimbgFormUseCase(Get.find<PermitRepository>()),
    );
    Get.lazyPut(() => SIMBGFormController(Get.find<SubmitSimbgFormUseCase>()));
  }
}

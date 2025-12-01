import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/design_repository.dart';
import 'package:pkp_hub/domain/usecases/design/download_prototype_design_use_case.dart';
import 'package:pkp_hub/domain/usecases/design/get_prototype_designs_use_case.dart';
import 'package:pkp_hub/features/project/controllers/prototype_designs_controller.dart';

class PrototypeDesignsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetPrototypeDesignsUseCase>(
      () => GetPrototypeDesignsUseCase(Get.find<DesignRepository>()),
    );
    Get.lazyPut<DownloadPrototypeDesignUseCase>(
      () => DownloadPrototypeDesignUseCase(Get.find<DesignRepository>()),
    );
    Get.lazyPut(
      () => PrototypeDesignsController(
        Get.find<GetPrototypeDesignsUseCase>(),
        Get.find<DownloadPrototypeDesignUseCase>(),
      ),
      fenix: true,
    );
  }
}

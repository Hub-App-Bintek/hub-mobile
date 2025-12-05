import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/design_repository.dart';
import 'package:pkp_hub/domain/usecases/design/download_prototype_design_use_case.dart';
import 'package:pkp_hub/domain/usecases/design/get_prototype_design_detail_use_case.dart';
import 'package:pkp_hub/features/project/controllers/prototype_design_details_controller.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';

class PrototypeDesignDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetPrototypeDesignDetailUseCase>(
      () => GetPrototypeDesignDetailUseCase(Get.find<DesignRepository>()),
      fenix: true,
    );
    Get.lazyPut<DownloadPrototypeDesignUseCase>(
      () => DownloadPrototypeDesignUseCase(Get.find<DesignRepository>()),
      fenix: true,
    );

    Get.lazyPut<PrototypeDesignDetailsController>(() {
      final rawArgs = Get.arguments;
      PrototypeDesign? design;
      String designId = '';

      if (rawArgs is PrototypeDesignDetailsArgs) {
        design = rawArgs.design;
        designId = rawArgs.designId;
      } else if (rawArgs is Map<String, dynamic>) {
        design = rawArgs['design'] as PrototypeDesign?;
        designId = (rawArgs['designId'] ?? rawArgs['id'] ?? '').toString();
      }
      designId = designId.isEmpty ? (design?.id ?? '') : designId;

      return PrototypeDesignDetailsController(
        Get.find<GetPrototypeDesignDetailUseCase>(),
        Get.find<DownloadPrototypeDesignUseCase>(),
        designId,
        initialDesign: design,
      );
    }, fenix: true);
  }
}

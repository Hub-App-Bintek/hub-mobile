import 'package:get/get.dart';
import 'package:pkp_hub/features/project/controllers/prototype_design_details_controller.dart';
import 'package:pkp_hub/features/project/models/prototype_design.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';

class PrototypeDesignDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrototypeDesignDetailsController>(() {
      final rawArgs = Get.arguments;
      PrototypeDesign? design;
      String? imageUrl;
      if (rawArgs is PrototypeDesignDetailsArgs) {
        design = rawArgs.design as PrototypeDesign?;
        imageUrl = rawArgs.imageUrl;
      } else if (rawArgs is Map<String, dynamic>) {
        design = rawArgs['design'] as PrototypeDesign?;
        imageUrl = rawArgs['imageUrl'] as String?;
      }
      design ??= const PrototypeDesign(
        title: 'Tipe 22/72',
        landArea: '72m²',
        buildingArea: '22m²',
        subtitle: 'Desain rumah minimalis untuk lahan terbatas',
      );
      imageUrl ??=
          'https://www.figma.com/api/mcp/asset/d8f0086a-3cb3-4e51-a574-1dac309704c5';
      return PrototypeDesignDetailsController(design, imageUrl);
    });
  }
}

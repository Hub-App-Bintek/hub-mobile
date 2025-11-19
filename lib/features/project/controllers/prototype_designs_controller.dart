import 'package:get/get.dart';
import 'package:pkp_hub/features/project/models/prototype_design.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';

class PrototypeDesignsController extends GetxController {
  final designs = <PrototypeDesign>[
    const PrototypeDesign(
      title: 'Tipe 22/72',
      buildingArea: '22m²',
      landArea: '72m²',
      subtitle: 'Desain rumah minimalis untuk lahan terbatas',
    ),
    const PrototypeDesign(
      title: 'Tipe 30/60',
      buildingArea: '30m²',
      landArea: '60m²',
      subtitle: 'Desain kompak dengan ruang yang efisien',
    ),
    const PrototypeDesign(
      title: 'Tipe 30/72',
      buildingArea: '30m²',
      landArea: '72m²',
      subtitle: 'Rumah modern dengan taman depan',
    ),
    const PrototypeDesign(
      title: 'Tipe 32/66',
      buildingArea: '33m²',
      landArea: '66m²',
      subtitle: 'Desain fungsional untuk keluarga kecil',
    ),
    const PrototypeDesign(
      title: 'Tipe 32/72',
      buildingArea: '33m²',
      landArea: '72m²',
      subtitle: 'Rumah nyaman dengan 2 kamar tidur',
    ),
    const PrototypeDesign(
      title: 'Tipe 32/72 (Alternatif 1)',
      buildingArea: '33m²',
      landArea: '72m²',
      subtitle: 'Varian dengan dapur terbuka',
    ),
    const PrototypeDesign(
      title: 'Tipe 32/72 (Alternatif 2)',
      buildingArea: '33m²',
      landArea: '72m²',
      subtitle: 'Varian dengan ruang keluarga luas',
    ),
    const PrototypeDesign(
      title: 'Tipe 32/72 (Alternatif 3)',
      buildingArea: '33m²',
      landArea: '72m²',
      subtitle: 'Varian dengan teras belakang',
    ),
  ];

  Future<void> onOpenDetails(PrototypeDesign design) async {
    final result = await Get.toNamed(
      AppRoutes.prototypeDesignDetails,
      arguments: {'design': design},
    );
    if (result is PrototypeDesign) {
      Get.back(result: result);
    }
  }

  void onDownload(PrototypeDesign design) {
    Get.back(result: design);
  }
}

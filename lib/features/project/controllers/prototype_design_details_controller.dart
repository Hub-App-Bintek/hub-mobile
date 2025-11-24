import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/utils/location_permission_helper.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/data/models/project_type.dart';
import 'package:pkp_hub/features/project/models/prototype_design.dart';

class PrototypeDesignDetailsController extends GetxController {
  PrototypeDesignDetailsController(this.design, this.imageUrl);

  final PrototypeDesign design;
  final String imageUrl;

  final List<String> features = const [
    'Ruang tamu minimalis',
    'Kamar tidur dengan lemari built-in',
    'Dapur compact dengan area penyimpanan',
    'Kamar mandi standar',
    'Teras kecil',
  ];

  final Map<String, String> specs = const {
    'Luas Tanah:': '6m x 12m (72m²)',
    'Luas Bangunan:': '22m²',
    'Kamar Tidur:': '1',
    'Kamar Mandi:': '1',
    'Carport:': '1 mobil',
  };

  void onDownloadPressed() {
    // In a full implementation, trigger actual download.
    Get.snackbar('Unduh Dokumen', 'Dokumen desain akan diunduh.');
  }

  void onSelectDesign() {
    () async {
      final hasPermission =
          await LocationPermissionHelper.ensureLocationPermission();
      if (!hasPermission) return;

      Get.toNamed(
        AppRoutes.createProject,
        arguments: LocationDetailsArgs(type: prototype.id),
      );
    }();
  }
}

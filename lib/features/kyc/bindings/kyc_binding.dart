import 'package:get/get.dart';
import 'package:pkp_hub/features/kyc/controllers/kyc_controller.dart';

class KycBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KycController>(() => KycController(), fenix: true);
  }
}

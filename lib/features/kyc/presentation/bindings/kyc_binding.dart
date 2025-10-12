import 'package:get/get.dart';
import 'package:pkp_hub/features/kyc/presentation/controller/kyc_controller.dart';

class KycBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KycController>(() => KycController());
  }
}

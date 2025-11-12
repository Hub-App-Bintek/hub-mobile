import 'package:get/get.dart';
import 'package:pkp_hub/features/payment/controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    // Use fenix: true to keep the controller alive even if the QR page is pushed on top
    Get.lazyPut(() => PaymentController(), fenix: true);
  }
}
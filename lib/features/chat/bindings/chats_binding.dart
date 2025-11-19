import 'package:get/get.dart';
import 'package:pkp_hub/features/chat/controllers/chats_controller.dart';

class ChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatsController>(() => ChatsController());
  }
}

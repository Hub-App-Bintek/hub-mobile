import 'package:get/get.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';
import 'package:pkp_hub/domain/usecases/chat/get_chat_room_detail_use_case.dart';
import 'package:pkp_hub/features/chat/controllers/chat_controller.dart';
import 'package:pkp_hub/features/chat/services/chat_websocket_service.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatWebSocketService>(
      () => ChatWebSocketService(),
      fenix: true,
    );

    Get.lazyPut<GetChatRoomDetailUseCase>(
      () => GetChatRoomDetailUseCase(Get.find<ChatRepository>()),
      fenix: true,
    );

    Get.lazyPut<ChatController>(
      () => ChatController(
        Get.find<ChatWebSocketService>(),
        Get.find<UserStorage>(),
        Get.find<GetChatRoomDetailUseCase>(),
      ),
      fenix: true,
    );
  }
}

import 'package:get/get.dart';
import 'package:pkp_hub/domain/repositories/chat_repository.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/chat/get_incoming_chats_use_case.dart';
import 'package:pkp_hub/features/chat/controllers/chats_controller.dart';

class ChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateDirectChatRoomUseCase>(
      () => CreateDirectChatRoomUseCase(Get.find<ChatRepository>()),
      fenix: true,
    );
    Get.lazyPut<GetIncomingChatsUseCase>(
      () => GetIncomingChatsUseCase(Get.find<ChatRepository>()),
      fenix: true,
    );
    Get.lazyPut<ChatsController>(
      () => ChatsController(
        Get.find<CreateDirectChatRoomUseCase>(),
        Get.find<GetIncomingChatsUseCase>(),
      ),
      fenix: true,
    );
  }
}

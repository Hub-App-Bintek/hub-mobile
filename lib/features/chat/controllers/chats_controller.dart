import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/chat_data.dart';
import 'package:pkp_hub/data/models/response/incoming_chat_response.dart';
import 'package:pkp_hub/data/models/response/create_chat_room_response.dart';
import 'package:pkp_hub/domain/usecases/chat/create_direct_chat_room_use_case.dart';
import 'package:pkp_hub/domain/usecases/chat/get_incoming_chats_use_case.dart';

class InboxItem {
  InboxItem({
    required this.name,
    required this.preview,
    required this.roomId,
    this.targetUserId,
    this.avatarUrl,
  });

  final String name;
  final String preview;
  final String roomId;
  final int? targetUserId;
  final String? avatarUrl;
}

class ChatsController extends BaseController {
  ChatsController(
    this._createDirectChatRoomUseCase,
    this._getIncomingChatsUseCase,
  );

  final CreateDirectChatRoomUseCase _createDirectChatRoomUseCase;
  final GetIncomingChatsUseCase _getIncomingChatsUseCase;

  final items = <InboxItem>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isRefreshing = false.obs;
  final RxBool isCreatingRoom = false.obs;
  final Rxn<Failure> error = Rxn<Failure>();

  @override
  void onInit() {
    super.onInit();
    fetchChats();
  }

  @override
  void onResumed() {
    super.onResumed();
    fetchChats();
  }

  Future<void> fetchChats() async {
    if (isLoading.value) return;
    isLoading.value = true;
    error.value = null;
    await _loadIncomingChats();
    isLoading.value = false;
  }

  Future<void> refreshChats() async {
    if (isRefreshing.value) return;
    isRefreshing.value = true;
    await _loadIncomingChats();
    isRefreshing.value = false;
  }

  Future<void> _loadIncomingChats() async {
    await handleAsync<IncomingChatResponse>(
      () => _getIncomingChatsUseCase(
        GetIncomingChatsParams(page: 1, limit: 20, sortOrder: 'desc'),
      ),
      onSuccess: (response) {
        items.assignAll(
          (response.data)
              .map(_mapIncomingToInbox)
              .whereType<InboxItem>()
              .toList(),
        );
      },
      onFailure: (failure) {
        error.value = failure;
        showError(failure);
      },
    );
  }

  InboxItem? _mapIncomingToInbox(ChatData item) {
    final senderName = item.sender?.name?.trim();
    final roomId = item.roomId?.trim() ?? '';
    if (roomId.isEmpty) return null;
    return InboxItem(
      name: senderName?.isNotEmpty == true ? senderName! : 'Pengguna',
      preview: item.messagePreview ?? '-',
      roomId: roomId,
      targetUserId: item.sender?.id,
      avatarUrl: item.sender?.avatarUrl,
    );
  }

  Future<void> openChat(InboxItem item) async {
    if (item.roomId.isNotEmpty) {
      await Get.toNamed(
        AppRoutes.chat,
        arguments: ChatArgs(
          name: item.name,
          roomId: item.roomId,
          receiverId: item.targetUserId,
        ),
      );
      await fetchChats();
      return;
    }

    final targetId = item.targetUserId;
    if (targetId == null) {
      showError(const ServerFailure(message: 'Tidak dapat membuka chat'));
      return;
    }

    if (isCreatingRoom.value) return;
    isCreatingRoom.value = true;
    await handleAsync<CreateChatRoomResponse>(
      () => _createDirectChatRoomUseCase(targetId),
      onSuccess: (room) {
        Get.toNamed(
          AppRoutes.chat,
          arguments: ChatArgs(name: item.name, roomId: room.id),
        )?.then((_) => fetchChats());
      },
      onFailure: showError,
    );
    isCreatingRoom.value = false;
  }
}

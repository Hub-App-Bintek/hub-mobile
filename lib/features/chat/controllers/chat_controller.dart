import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/storage/user_storage.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/entity/user.dart';
import 'package:pkp_hub/data/models/chat_details.dart';
import 'package:pkp_hub/data/models/chat_message.dart';
import 'package:pkp_hub/data/models/participant.dart';
import 'package:pkp_hub/data/models/response/chat_room_details_response.dart';
import 'package:pkp_hub/domain/usecases/chat/get_chat_room_detail_use_case.dart';
import 'package:pkp_hub/features/chat/services/chat_websocket_service.dart';

class ChatUiMessage {
  ChatUiMessage({
    required this.text,
    required this.isMine,
    this.id,
    this.createdAt,
  });

  final String? id;
  final String text;
  final bool isMine;
  final String? createdAt;
}

class ChatController extends BaseController {
  ChatController(
    this._wsService,
    this._userStorage,
    this._getChatRoomDetailUseCase,
  );

  final ChatWebSocketService _wsService;
  final UserStorage _userStorage;
  final GetChatRoomDetailUseCase _getChatRoomDetailUseCase;

  final messages = <ChatUiMessage>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isSending = false.obs;

  final TextEditingController composerController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final RxBool wsConnecting = false.obs;
  final RxBool wsConnected = false.obs;

  late final String roomId;
  late final String _topic;
  late final String _destination;
  int? _currentUserId;
  int? _recipientId;

  @override
  void onInit() {
    super.onInit();
    roomId = _resolveRoomId();
    _topic = '/topic/chat/$roomId';
    _destination = '/app/chat/$roomId/send';
    _hydrateRecipientFromArgs();
    _init();
  }

  Future<void> _init() async {
    if (roomId.isEmpty) {
      showError(const ServerFailure(message: 'Chat room tidak ditemukan'));
      return;
    }
    await _loadUser();
    await _loadHistory();
    await _connect();
  }

  String _resolveRoomId() {
    final args = Get.arguments;
    String? id;
    if (args is ChatArgs) {
      id = args.roomId;
    } else if (args is Map<String, dynamic>) {
      id = (args['roomId'] ?? args['room_id'])?.toString();
    }
    id = id?.trim();
    return (id != null && id.isNotEmpty) ? id : '';
  }

  Future<void> _loadUser() async {
    final user = await _userStorage.getUser();
    _hydrateCurrentUser(user);
  }

  void _hydrateCurrentUser(User? user) {
    _currentUserId = user?.userId;
  }

  Future<void> _loadHistory() async {
    if (roomId.isEmpty) {
      showError(const ServerFailure(message: 'Chat room tidak ditemukan'));
      return;
    }

    isLoading.value = true;
    await handleAsync<ChatRoomDetailsResponse>(
      () => _getChatRoomDetailUseCase(
        ChatRoomDetailParams(roomId: roomId, limit: 50),
      ),
      onSuccess: (detail) {
        _hydrateRecipient(detail.data?.chatDetails);
        final data = detail.data;
        final messagesList = data?.messages ?? const <ChatMessage>[];
        final newMessages = messagesList
            .map(_mapDtoToUi)
            .whereType<ChatUiMessage>()
            .toList();
        _hydrateRecipientFromMessages(messagesList);
        messages.assignAll(newMessages);
        scrollToBottom();
      },
      onFailure: showError,
    );
    isLoading.value = false;
  }

  Future<void> _connect() async {
    if (roomId.isEmpty) return;
    final token = await _userStorage.getToken() ?? '';
    if (token.isEmpty) {
      showError(const ServerFailure(message: 'Token tidak ditemukan'));
      return;
    }

    final socketUrl = _buildSocketUrl();
    wsConnecting.value = true;
    debugPrint('[CHAT-WS] connecting to $socketUrl for room $roomId');

    _wsService.connect(
      url: socketUrl,
      token: token,
      topic: _topic,
      onConnected: () {
        wsConnected.value = true;
        wsConnecting.value = false;
        debugPrint('[CHAT-WS] connected & ready');
      },
      onDisconnected: () {
        wsConnected.value = false;
        wsConnecting.value = false;
        debugPrint('[CHAT-WS] disconnected');
      },
      onError: (error) {
        wsConnecting.value = false;
        wsConnected.value = false;
        debugPrint('[CHAT-WS] error: $error');
        showError(ServerFailure(message: error.toString()));
      },
      onMessage: _handleIncoming,
    );
  }

  Future<void> sendMessage() async {
    final text = composerController.text.trim();
    if (text.isEmpty) return;

    if (!wsConnected.value) {
      showError(const ServerFailure(message: 'Koneksi chat belum siap'));
      return;
    }

    isSending.value = true;
    final receiverId = _recipientId;
    _wsService.send(
      destination: _destination,
      body: {
        'consultationId': roomId,
        'roomId': roomId,
        'messageType': 'TEXT',
        'messageContent': text,
        'senderId': _currentUserId,
        'receiverId': receiverId,
        'fileUrl': null,
      },
    );
    composerController.clear();
    scrollToBottom();
    isSending.value = false;
  }

  void _handleIncoming(Map<String, dynamic> payload) {
    debugPrint('[CHAT-WS] incoming: $payload');
    final content =
        (payload['content'] ??
                payload['messageContent'] ??
                payload['message'] ??
                '')
            .toString();
    if (content.isEmpty) return;

    final senderId = (payload['sender_id'] ?? payload['senderId'] ?? '')
        .toString();
    final message = ChatMessage(
      id: payload['id']?.toString(),
      senderId: int.tryParse(senderId),
      messageContent: content,
      createdAt: Formatters.tryParseIso(
        (payload['createdAt'] ?? payload['timestamp'])?.toString(),
      ),
      messageType: (payload['messageType'] ?? payload['type'])?.toString(),
    );
    final mapped = _mapDtoToUi(message);
    if (mapped != null) {
      _addMessage(mapped);
    }
    if (_recipientId == null && !_isMine(message.senderId)) {
      _recipientId = message.senderId;
    }
    scrollToBottom();
  }

  ChatUiMessage? _mapDtoToUi(ChatMessage message) {
    final text = message.messageContent ?? '';
    if (text.isEmpty) return null;

    final isMine = _isMine(message.senderId);
    return ChatUiMessage(
      id: message.id,
      text: text,
      isMine: isMine,
      createdAt: message.createdAt != null
          ? Formatters.formatDateTime(message.createdAt ?? DateTime.now())
          : '',
    );
  }

  bool _isMine(int? senderId) {
    if (_currentUserId != null && senderId != null) {
      return _currentUserId == senderId;
    }
    return false;
  }

  void _hydrateRecipient(ChatDetails? details) {
    if (details == null || details.participants == null) return;
    final meId = _currentUserId;
    final other = details.participants?.firstWhere(
      (p) => meId == null || p.id != meId,
      orElse: () =>
          details.participants?.firstOrNull ??
          const Participant(id: null, name: null, email: null, avatarUrl: null),
    );
    _recipientId = other?.id;
  }

  void _hydrateRecipientFromMessages(List<ChatMessage> messages) {
    if (_recipientId != null) return;
    final meId = _currentUserId;
    for (final msg in messages) {
      final sender = msg.senderId;
      if (sender != null && sender != meId) {
        _recipientId = int.tryParse(sender.toString());
        break;
      }
    }
  }

  void _hydrateRecipientFromArgs() {
    final args = Get.arguments;
    int? receiver;
    if (args is ChatArgs) {
      receiver = args.receiverId;
    } else if (args is Map<String, dynamic>) {
      final raw = args['receiverId'] ?? args['receiver_id'];
      if (raw != null) {
        receiver = int.tryParse(raw.toString());
      }
    }
    _recipientId = receiver ?? _recipientId;
  }

  void _addMessage(ChatUiMessage message) {
    messages.add(message);
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 60,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _buildSocketUrl() {
    final base = Environment.instance.apiBaseUrl;
    if (base.isEmpty) return 'https://hub-dev.editnest.online/ws/chat';
    final uri = Uri.tryParse(base);
    if (uri == null) return '$base/ws/chat';
    final segments = [...uri.pathSegments];
    if (segments.isNotEmpty && segments.last == 'api') {
      segments.removeLast();
    }
    segments.addAll(['ws', 'chat']);
    return uri
        .replace(
          pathSegments: segments,
          queryParameters: {
            't': DateTime.now().millisecondsSinceEpoch.toString(),
          },
        )
        .toString();
  }

  @override
  void onClose() {
    _wsService.disconnect();
    composerController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}

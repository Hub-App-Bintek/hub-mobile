import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

class ChatMessage {
  ChatMessage({required this.text, required this.isMine});

  final String text;
  final bool isMine;
}

class ChatController extends BaseController {
  final messages = <ChatMessage>[
    ChatMessage(text: 'Hey Lucas!', isMine: false),
    ChatMessage(text: 'How’s your project going?', isMine: false),
    ChatMessage(text: 'Hi Brooke!', isMine: true),
    ChatMessage(text: 'It’s going well. Thanks for asking!', isMine: true),
    ChatMessage(
      text: 'No worries. Let me know if you need any help 😊',
      isMine: false,
    ),
    ChatMessage(text: 'You’re the best!', isMine: true),
  ].obs;

  final TextEditingController composerController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendMessage() {
    final text = composerController.text.trim();
    if (text.isEmpty) return;
    messages.add(ChatMessage(text: text, isMine: true));
    composerController.clear();
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

  @override
  void onClose() {
    composerController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}

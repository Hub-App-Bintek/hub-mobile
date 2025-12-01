import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/features/chat/controllers/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    String? chatTitle;
    if (args is ChatArgs) {
      chatTitle = args.name?.trim();
    } else if (args is Map<String, dynamic>) {
      chatTitle = (args['name'] as String?)?.trim();
    }

    return Scaffold(
      appBar: PkpAppBar(
        title: chatTitle?.isNotEmpty == true ? chatTitle! : 'Chat',
      ),
      body: Column(
        children: [
          Obx(
            () => _ConnectionBanner(
              isConnecting: controller.wsConnecting.value,
              isConnected: controller.wsConnected.value,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              final items = controller.messages;
              if (items.isEmpty) {
                return const Center(
                  child: Text('Belum ada pesan.\nMulai percakapan.'),
                );
              }
              return ListView.builder(
                controller: controller.scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final message = items[index];
                  return _MessageBubble(message: message);
                },
              );
            }),
          ),
          _Composer(
            controller: controller.composerController,
            onSend: controller.sendMessage,
            isConnected: controller.wsConnected,
            isConnecting: controller.wsConnecting,
            isSending: controller.isSending,
            onTap: controller.scrollToBottom,
          ),
        ],
      ),
    );
  }
}

class _ConnectionBanner extends StatelessWidget {
  const _ConnectionBanner({
    required this.isConnecting,
    required this.isConnected,
  });

  final bool isConnecting;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    if (isConnecting) {
      return const LinearProgressIndicator(
        minHeight: 2,
        color: AppColors.primaryDark,
        backgroundColor: AppColors.primaryLightest,
      );
    }
    if (!isConnected) {
      return Container(
        width: double.infinity,
        color: AppColors.errorLight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          'Menghubungkan ke server chat...',
          style: AppTextStyles.bodyXS.copyWith(color: AppColors.errorDark),
          textAlign: TextAlign.center,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final ChatUiMessage message;

  @override
  Widget build(BuildContext context) {
    final alignment = message.isMine
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    final color = message.isMine
        ? AppColors.primaryDarkest
        : AppColors.primaryLightest;
    final textColor = message.isMine
        ? AppColors.white
        : AppColors.neutralDarkest;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          const SizedBox(height: 4),
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              message.text,
              style: AppTextStyles.bodyS.copyWith(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _Composer extends StatelessWidget {
  const _Composer({
    required this.controller,
    required this.onSend,
    required this.isConnected,
    required this.isConnecting,
    required this.isSending,
    required this.onTap,
  });

  final TextEditingController controller;
  final Future<void> Function() onSend;
  final RxBool isConnected;
  final RxBool isConnecting;
  final RxBool isSending;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.neutralLight, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            Obx(() {
              final connected = isConnected.value;
              final connecting = isConnecting.value;
              final sending = isSending.value;
              final enabled = connected && !connecting && !sending;
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightest.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 36,
                            maxHeight: 140,
                          ),
                          child: TextField(
                            controller: controller,
                            enabled: enabled,
                            minLines: 1,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: enabled
                                  ? 'Type a message...'
                                  : 'Menghubungkan...',
                              hintStyle: AppTextStyles.bodyS.copyWith(
                                color: AppColors.neutralMedium,
                              ),
                              border: InputBorder.none,
                            ),
                            textInputAction: TextInputAction.newline,
                            onTap: onTap,
                            onSubmitted: (_) => enabled ? onSend() : null,
                          ),
                        ),
                      ),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: enabled
                              ? AppColors.primaryDarkest
                              : AppColors.neutralLight,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.send_rounded,
                            color: enabled
                                ? AppColors.white
                                : AppColors.neutralMedium,
                            size: 18,
                          ),
                          onPressed: enabled ? () => onSend() : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

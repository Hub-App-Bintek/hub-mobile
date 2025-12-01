import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/features/chat/controllers/chats_controller.dart';

class ChatsScreen extends GetView<ChatsController> {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: 'Chat'),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final items = controller.items;
        if (items.isEmpty) {
          return const Center(child: Text('Belum ada chat.'));
        }
        return RefreshIndicator(
          onRefresh: controller.refreshChats,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                leading: _Avatar(avatarUrl: item.avatarUrl),
                title: Text(
                  item.name,
                  style: AppTextStyles.bodyM.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutralDarkest,
                  ),
                ),
                subtitle: Text(
                  item.preview,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyS.copyWith(
                    color: AppColors.neutralMediumDark,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                onTap: () => controller.openChat(item),
              );
            },
          ),
        );
      }),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({this.avatarUrl});

  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: AppColors.primaryLightest,
      backgroundImage: (avatarUrl != null && avatarUrl!.isNotEmpty)
          ? NetworkImage(avatarUrl!)
          : null,
      child: avatarUrl == null || avatarUrl!.isEmpty
          ? const Icon(Icons.person, color: AppColors.primaryLight)
          : null,
    );
  }
}

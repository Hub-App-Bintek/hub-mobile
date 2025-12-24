import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/features/inbox/controllers/inbox_controller.dart';

class InboxScreen extends GetView<InboxController> {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(
        title: 'Inbox',
        backgroundColor: AppColors.primaryDark,
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value && controller.notifications.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: controller.refresh,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollEndNotification &&
                    notification.metrics.pixels >=
                        notification.metrics.maxScrollExtent - 100) {
                  controller.loadMore();
                }
                return false;
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount:
                    controller.notifications.length +
                    (controller.isLoadingMore.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= controller.notifications.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final item = controller.notifications[index];
                  return _InboxCard(
                    title: item.title ?? '-',
                    message: item.message ?? '-',
                    time: controller.formattedDate(item.createdAt),
                    isRead: item.isRead,
                    onTap: () => controller.markAsRead(item.id ?? ''),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _InboxCard extends StatelessWidget {
  const _InboxCard({
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    required this.onTap,
  });

  final String title;
  final String message;
  final String time;
  final bool isRead;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cardColor = isRead ? AppColors.white : const Color(0xFFF1F6FF);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: cardColor,
          border: const Border(
            bottom: BorderSide(color: AppColors.inputBorder, width: 0.6),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(
                isRead ? Icons.mark_email_read_outlined : Icons.mail_outline,
                color: isRead ? AppColors.neutralMedium : AppColors.primaryDark,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.neutralDarkest,
                          ),
                        ),
                      ),
                      if (!isRead)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF006FFD),
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: AppTextStyles.bodyL.copyWith(
                      color: AppColors.neutralMediumLight,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: AppTextStyles.bodyS.copyWith(
                      color: AppColors.neutralMediumLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

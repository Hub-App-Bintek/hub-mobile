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
        child: ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            final item = controller.items[index];
            return _InboxCard(item: item);
          },
        ),
      ),
    );
  }
}

class _InboxCard extends StatelessWidget {
  const _InboxCard({required this.item});

  final InboxItem item;

  @override
  Widget build(BuildContext context) {
    final cardColor = item.backgroundColor ?? AppColors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: cardColor,
        border: Border(
          bottom: BorderSide(color: AppColors.inputBorder, width: 0.6),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Icon(item.icon, color: item.iconColor, size: 20),
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
                        item.title,
                        style: AppTextStyles.h4.copyWith(
                          color: item.backgroundColor != null
                              ? AppColors.neutralDarkest
                              : AppColors.neutralDarkest.withOpacity(0.8),
                        ),
                      ),
                    ),
                    if (item.showDot)
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
                  item.message,
                  style: AppTextStyles.bodyL.copyWith(
                    color: AppColors.neutralMediumLight,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.timeAgo,
                  style: AppTextStyles.bodyS.copyWith(
                    color: AppColors.neutralMediumLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

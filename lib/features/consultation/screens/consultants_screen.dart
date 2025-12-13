import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/consultant_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';
import 'package:pkp_hub/features/consultation/controllers/consultants_controller.dart';

class ConsultantsScreen extends GetView<ConsultantsController> {
  const ConsultantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PkpAppBar(
        title: 'Pilih Konsultan',
        actions: [
          PkpAppBarAction(
            icon: Icons.swap_vert,
            color: AppColors.white,
            onPressed: () => _showSortSheet(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primaryDarkest,
        onRefresh: controller.refreshList,
        child: Obx(() {
          final items = controller.consultants.toList();
          final isLoading = controller.isLoading.value;
          final hasMore = controller.hasMore.value;

          if (isLoading && items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (items.isEmpty) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 160),
                Icon(
                  Icons.group_outlined,
                  size: 56,
                  color: AppColors.neutralDarkest.withOpacity(0.35),
                ),
                const SizedBox(height: 12),
                Text(
                  'Tidak ada konsultan',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.neutralDarkest,
                  ),
                ),
              ],
            );
          }

          final childCount = items.length + (hasMore ? 1 : 0);

          return CustomScrollView(
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 230,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index >= items.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    final consultant = items[index];
                    return ConsultantCard(
                      consultant: consultant,
                      onTap: () => controller.goToPortfolio(consultant),
                    );
                  }, childCount: childCount),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          );
        }),
      ),
    );
  }

  void _showSortSheet(BuildContext context) {
    final options = [
      (label: 'Nama', value: 'name'),
      (label: 'Rating', value: 'rating'),
      (label: 'Harga', value: 'price'),
      (label: 'Jarak', value: 'distance'),
    ];
    final current = controller.selectedSort.value;
    String tempValue = current;

    controller.showBottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return SafeArea(
            top: false,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: PkpAppBar(
                      title: 'Urutkan Berdasarkan',
                      leading: Icons.close,
                      leadingColor: AppColors.primaryDarkest,
                      backgroundColor: AppColors.white,
                      titleTextColor: AppColors.primaryDarkest,
                      onLeadingPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  ...options.map(
                    (option) => RadioListTile<String>(
                      value: option.value,
                      groupValue: tempValue,
                      onChanged: (val) {
                        setState(() => tempValue = val ?? '');
                      },
                      activeColor: AppColors.primaryDark,
                      title: Text(
                        option.label,
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.neutralDarkest,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, color: AppColors.inputBorder),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: PkpOutlinedButton(
                            text: 'Reset',
                            onPressed: () {
                              controller.updateSort('');
                              Get.back();
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: PkpElevatedButton(
                            text: 'Terapkan',
                            onPressed: () {
                              controller.updateSort(tempValue);
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

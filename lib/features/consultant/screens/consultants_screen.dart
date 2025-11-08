import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/consultant_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/consultant/controllers/consultants_controller.dart';

class ConsultantsScreen extends GetView<ConsultantsController> {
  const ConsultantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PkpAppBar(
        title: 'Konsultan',
        actions: [
          PkpAppBarAction(
            icon: Icons.sort,
            onPressed: () => controller.showBottomSheet(
              _SortBottomSheet(
                initialSort: controller.selectedSort.value,
                onApply: controller.updateSort,
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshList,
        color: AppColors.primaryDarkest,
        child: Obx(() {
          final items = controller.consultants;
          final isLoading = controller.isLoading.value;
          final hasMore = controller.hasMore.value;

          // Show a big spinner only for the very first load
          final initialLoading = isLoading && items.isEmpty;
          if (initialLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Empty state
          if (!isLoading && items.isEmpty) {
            return _EmptyState(onRetry: controller.refreshList);
          }

          final showLoaderTile = hasMore || isLoading;

          return GridView.builder(
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            cacheExtent: 1200,
            // small look-ahead for smoother scrolling
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.92,
            ),
            itemCount: items.length + (showLoaderTile ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= items.length) {
                return const _LoaderTile();
              }

              final item = items[index];
              return ConsultantCard(
                key: ValueKey(item.id ?? index),
                consultant: item,
                onTap: () => controller.goToPortfolio(
                  item.id.toString(),
                  item.hourlyRate ?? 0.0,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class _LoaderTile extends StatelessWidget {
  const _LoaderTile();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onRetry});

  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 120),
        Icon(
          Icons.group_outlined,
          size: 56,
          color: AppColors.neutralDarkest.withOpacity(0.35),
        ),
        const SizedBox(height: 12),
        Text(
          'No consultants found',
          textAlign: TextAlign.center,
          style: AppTextStyles.h4.copyWith(color: AppColors.neutralDarkest),
        ),
        const SizedBox(height: 6),
        Text(
          'Pull to refresh or try again.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyS.copyWith(
            color: AppColors.neutralDarkest.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: OutlinedButton(
            onPressed: onRetry,
            child: const Text(AppStrings.retryButton),
          ),
        ),
      ],
    );
  }
}

class _SortBottomSheet extends StatefulWidget {
  const _SortBottomSheet({required this.initialSort, required this.onApply});

  final String initialSort;
  final ValueChanged<String> onApply;

  @override
  State<_SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<_SortBottomSheet> {
  late String _selectedSort;

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.initialSort;
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      (label: 'Nama', value: 'name'),
      (label: 'Rating', value: 'rating'),
      (label: 'Harga', value: 'price'),
      (label: 'Jarak', value: 'distance'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.consultantSortLabel, style: AppTextStyles.h3),
          const SizedBox(height: 16),
          ...options.map(
            (option) => ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(option.label, style: AppTextStyles.bodyM),
              trailing: _selectedSort == option.value
                  ? const Icon(Icons.check, color: AppColors.primaryDarkest)
                  : null,
              onTap: () => setState(() => _selectedSort = option.value),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: PkpOutlinedButton(
                  text: 'Reset',
                  onPressed: () {
                    setState(() => _selectedSort = '');
                    widget.onApply('');
                    Get.back();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PkpElevatedButton(
                  text: 'Terapkan',
                  onPressed: () {
                    widget.onApply(_selectedSort);
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

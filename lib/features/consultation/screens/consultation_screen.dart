import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/consultant_card.dart';
import 'package:pkp_hub/app/widgets/pkp_outlined_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_controller.dart';

class ConsultationScreen extends GetView<ConsultationController> {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: AppStrings.menuConsultation),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refreshList,
          color: AppColors.primaryDarkest,
          child: Obx(() {
            final items = controller.consultants.toList();
            final isLoading = controller.isLoading.value;
            final hasMore = controller.hasMore.value;

            final initialLoading = isLoading && items.isEmpty;
            if (initialLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!isLoading && items.isEmpty) {
              return _EmptyState(onRetry: controller.refreshList);
            }

            final sortedItems = items.toList()
              ..sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
            final showLoaderTile = hasMore || isLoading;

            return CustomScrollView(
              controller: controller.scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                    child: _CreateConsultationBanner(
                      onPressed: controller.onCreatePressed,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      AppStrings.recommendationTitle,
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.neutralDarkest,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 230,
                        ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index >= sortedItems.length) {
                          return const _LoaderTile();
                        }

                        final item = sortedItems[index];
                        return ConsultantCard(
                          key: ValueKey(item.id ?? index),
                          consultant: item,
                          onTap: () => controller.goToPortfolio(item),
                        );
                      },
                      childCount: sortedItems.length + (showLoaderTile ? 1 : 0),
                    ),
                  ),
                ),
                // const SliverToBoxAdapter(child: SizedBox(height: 120)),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _CreateConsultationBanner extends StatelessWidget {
  const _CreateConsultationBanner({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PkpElevatedButton(
      text: AppStrings.createConsultationCta,
      onPressed: onPressed,
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
          child: PkpOutlinedButton(
            text: AppStrings.retryButton,
            onPressed: onRetry,
          ),
        ),
      ],
    );
  }
}

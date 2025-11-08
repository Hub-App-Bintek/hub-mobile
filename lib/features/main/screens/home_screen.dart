import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/consultant_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_card.dart';
import 'package:pkp_hub/app/widgets/sheets/choose_project_bottom_sheet.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PkpAppBar(
        showNavigation: false,
        actions: Icons.mail_rounded,
        onActionPressed: controller.onNotificationTapped,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              spacing: 16,
              children: [
                _buildCarouselBanner(),
                _buildBalanceCard(),
                _buildFeatureGrid(),
                _buildRoleSpecificSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselBanner() {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller.carouselController,
            onPageChanged: (index) {
              controller.currentCarouselIndex.value = index;
            },
            itemCount: controller.carouselImages.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.carouselImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: _buildCarouselIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselIndicator() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.carouselImages.length,
          (index) => Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.currentCarouselIndex.value == index
                  ? AppColors.primaryDarkest
                  : AppColors.primaryLight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Obx(() {
      final role = controller.userRole.value;
      if (role == null || role == UserRole.unknown) {
        return const SizedBox.shrink();
      }

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.primaryLightest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.neutralDarkest.withValues(alpha: 0.05),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.account_balance_wallet_outlined,
              color: AppColors.primaryDarkest,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                Formatters.currency(controller.balance.value),
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                role == UserRole.homeowner
                    ? Icons.add_circle_outline
                    : Icons.archive_rounded,
                color: AppColors.primaryDarkest,
                size: 24,
              ),
              onPressed: () {
                // TODO: Implement top-up functionality
              },
            ),
          ],
        ),
      );
    });
  }

  Widget _buildRoleSpecificSection() {
    return Obx(() {
      final role = controller.userRole.value;
      final consultants = controller.consultants.toList();
      final isConsultantLoading = controller.isConsultantLoading.value;

      if (role == UserRole.consultant) {
        return _buildConsultantSection();
      }

      return _buildConsultantGridSection(
        isLoading: isConsultantLoading,
        consultants: consultants,
      );
    });
  }

  Widget _buildFeatureGrid() {
    final featureItems = [
      (AppStrings.menuConsultation, Icons.chat_bubble_outline),
      (AppStrings.menuLicensing, Icons.receipt_long),
      (AppStrings.menuMaterial, Icons.inventory_2_outlined),
      (AppStrings.homeFeatureSupervision, Icons.visibility_outlined),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const columns = 4;
          const spacing = 16.0;
          final itemWidth =
              (constraints.maxWidth - spacing * (columns - 1)) / columns;

          return Wrap(
            spacing: spacing,
            runSpacing: 12,
            children: featureItems.map((item) {
              final (title, iconData) = item;
              return SizedBox(
                width: itemWidth,
                child: _FeatureTile(
                  label: title,
                  icon: iconData,
                  onTap: () {
                    controller.onFeatureTapped(() {
                      controller.showBottomSheet(
                        ChooseProjectBottomSheet(
                          controller.projects,
                          controller.onNewProjectFromSheet,
                          controller.onSelectProject,
                          controller.userRole.value ?? UserRole.unknown,
                        ),
                      );
                    });
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildConsultantGridSection({
    required bool isLoading,
    required List consultants,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.homeConsultantSectionTitle,
                  style: AppTextStyles.h2,
                ),
              ),
              TextButton(
                onPressed: controller.onSeeAllConsultants,
                child: const Text(AppStrings.homeConsultantSeeAll),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (consultants.isEmpty)
            _buildEmptyState(AppStrings.homeConsultantEmpty)
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.92,
              ),
              itemCount: consultants.length,
              itemBuilder: (context, index) {
                final consultant = consultants[index];
                return ConsultantCard(
                  consultant: consultant,
                  onTap: () => controller.onConsultantCardTapped(consultant),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildConsultantSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final isLoading = controller.isProjectLoading.value;
        final projects = controller.projects;
        final active = projects
            .where((project) => project.status?.toUpperCase() == 'ACTIVE')
            .toList();
        final pending = projects
            .where((project) => project.status?.toUpperCase() == 'PENDING')
            .toList();

        if (isLoading && projects.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<Widget> children = [];

        if (pending.isNotEmpty) {
          if (children.isNotEmpty) {
            children.add(const SizedBox(height: 16));
          }
          children.add(
            _buildProjectGroup(AppStrings.homeProjectsPendingTitle, pending),
          );
        }

        if (active.isNotEmpty) {
          children.add(
            _buildProjectGroup(AppStrings.homeProjectsActiveTitle, active),
          );
        }

        if (children.isEmpty && !isLoading) {
          children.add(_buildEmptyState(AppStrings.homeProjectsEmpty));
        }

        if (isLoading && projects.isNotEmpty) {
          children.add(
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        );
      }),
    );
  }

  Widget _buildProjectGroup(String title, List<Project> projects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h2),
        const SizedBox(height: 12),
        ...projects.map(_buildProjectCard),
      ],
    );
  }

  Widget _buildProjectCard(Project project) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: PkpCard(
        title: project.name ?? '-',
        subtitle: Formatters.formatTitle(project.status ?? ''),
        suffixIcon: const Icon(Icons.chevron_right),
        onTap: () => controller.onSelectProject(project),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryLightest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        message,
        style: AppTextStyles.bodyS.copyWith(color: AppColors.neutralMediumDark),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primaryDarkest),
          const SizedBox(height: 8),
          Text(label, style: AppTextStyles.bodyS, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

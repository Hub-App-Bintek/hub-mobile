import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_card.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      _buildCarouselBanner(),
      const SizedBox(height: 16),
      if (_shouldShowBalanceCard) ...[
        _buildBalanceCard(),
        const SizedBox(height: 24),
      ],
      _buildFeatureGrid(),
      _buildRoleSpecificSection(),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primaryDark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _buildAppBar(),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: controller.refresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Obx(() {
        final chatCount = controller.chatBadgeCount.value;
        final notificationCount = controller.notificationBadgeCount.value;
        final loggedIn = controller.isLoggedIn;

        return PkpAppBar(
          title: loggedIn ? 'Hai! User' : AppStrings.homeWelcomeTitle,
          showNavigation: false,
          centerTitle: false,
          backgroundColor: AppColors.primaryDark,
          actions: loggedIn
              ? [
                  PkpAppBarAction(
                    icon: Icons.notifications_none_outlined,
                    badgeCount: notificationCount,
                    onPressed: controller.onNotificationTapped,
                    color: AppColors.white,
                    iconWidget: SvgPicture.asset(
                      AppIcons.notification,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  PkpAppBarAction(
                    icon: Icons.chat_bubble_outline,
                    badgeCount: chatCount,
                    onPressed: controller.onChatTapped,
                    color: AppColors.white,
                    iconWidget: SvgPicture.asset(
                      AppIcons.chat,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ]
              : null,
        );
      }),
    );
  }

  Widget _buildCarouselBanner() {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller.carouselController,
            onPageChanged: (index) {
              controller.currentCarouselIndex.value = index;
            },
            itemCount: controller.carouselImages.length,
            itemBuilder: (context, index) {
              return ClipRect(
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(controller.carouselImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: _buildCarouselIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselIndicator() {
    return Obx(() {
      final activeIndex = controller.currentCarouselIndex.value;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(controller.carouselImages.length, (index) {
          final isActive = index == activeIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: isActive ? 24 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.white
                  : AppColors.white.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(99),
            ),
          );
        }),
      );
    });
  }

  Widget _buildBalanceCard() {
    return Obx(() {
      final role = controller.userRole.value;
      if (role == null || role == UserRole.unknown) {
        return const SizedBox.shrink();
      }

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: AppColors.primaryDarkest,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.wallet,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Saldo Dompet',
                    style: AppTextStyles.bodyL.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Formatters.currency(controller.balance.value),
                    style: AppTextStyles.h3.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
            Material(
              color: AppColors.primaryDarkest,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: () {
                  // TODO: Implement top-up functionality
                },
                customBorder: const CircleBorder(),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: SvgPicture.asset(
                      AppIcons.add,
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  bool get _shouldShowBalanceCard {
    final role = controller.userRole.value;
    if (!controller.isLoggedIn) return false;
    return role != null && role != UserRole.unknown;
  }

  Widget _buildRoleSpecificSection() {
    return Obx(() {
      final role = controller.userRole.value;

      if (role == UserRole.consultant) {
        return _buildConsultantSection();
      }

      return const SizedBox.shrink();
    });
  }

  Widget _buildFeatureGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final role = controller.userRole.value;
        final List<_FeatureItem> featureItems = [];

        if (role == UserRole.homeowner ||
            role == null ||
            role == UserRole.unknown) {
          featureItems.add(
            _FeatureItem(
              id: 'consultation',
              title: AppStrings.homeFeatureDesignConsultation,
              iconData: Icons.chat_outlined,
              iconAsset: AppIcons.consultation,
              onTap: () {
                controller.onConsultationFeatureTapped();
              },
            ),
          );
          featureItems.add(
            _FeatureItem(
              id: 'licensing',
              title: AppStrings.homeFeatureLicensingFacilities,
              iconData: Icons.description_outlined,
              iconAsset: AppIcons.licensing,
              onTap: () {
                // TODO: Navigate to LicensingScreen
              },
            ),
          );
          featureItems.add(
            _FeatureItem(
              id: 'construction',
              title: AppStrings.homeFeatureConstructionLabor,
              iconData: Icons.handyman_outlined,
              iconAsset: AppIcons.construction,
              onTap: () {
                // TODO: Show dialog
              },
            ),
          );
          featureItems.add(
            _FeatureItem(
              id: 'material',
              title: AppStrings.homeFeatureStoreMaterial,
              iconData: Icons.inventory_2_outlined,
              iconAsset: AppIcons.material,
              onTap: () {
                // TODO: Show dialog
              },
            ),
          );
          featureItems.add(
            _FeatureItem(
              id: 'financing',
              title: AppStrings.homeFeatureFinancingFacilities,
              iconData: Icons.savings_outlined,
              iconAsset: AppIcons.financing,
              onTap: () {
                // TODO: Show dialog
              },
            ),
          );
          featureItems.add(
            _FeatureItem(
              id: 'supervision',
              title: AppStrings.homeFeatureConstructionSupervision,
              iconData: Icons.remove_red_eye_outlined,
              iconAsset: AppIcons.supervision,
              onTap: () {
                // TODO: Navigate to MonitoringScreen
              },
            ),
          );
        } else {
          featureItems.add(
            _FeatureItem(
              id: 'get_pending_projects',
              title: AppStrings.homeProjectsPendingTitle,
              iconData: Icons.pending_actions_rounded,
              onTap: () {
                controller.fetchProjects('PENDING');
              },
            ),
          );
          featureItems.add(
            _FeatureItem(
              id: 'get_active_projects',
              title: AppStrings.homeProjectsActiveTitle,
              iconData: Icons.pending_actions_rounded,
              onTap: () {
                controller.fetchProjects('ACTIVE');
              },
            ),
          );
        }

        const crossAxisSpacing = 24.0;
        const mainAxisSpacing = 20.0;

        return GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: featureItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            childAspectRatio: 0.92,
          ),
          itemBuilder: (context, index) {
            final item = featureItems[index];
            return Center(
              child: FeatureCircleCard(
                label: item.title,
                icon: item.iconData,
                iconWidget: item.iconAsset == null
                    ? null
                    : SvgPicture.asset(
                        item.iconAsset!,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                labelOutside: true,
                backgroundColor: AppColors.primaryDark,
                iconColor: AppColors.white,
                labelStyle: AppTextStyles.bodyL.copyWith(
                  color: AppColors.neutralDarkest,
                  height: 1.25,
                ),
                onTap: item.onTap,
              ),
            );
          },
        );
      }),
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

class _FeatureItem {
  const _FeatureItem({
    required this.id,
    required this.title,
    required this.iconData,
    this.iconAsset,
    required this.onTap,
  });

  final String id;
  final String title;
  final IconData iconData;
  final String? iconAsset;
  final VoidCallback onTap;
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/app_route_observer.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/empty_placeholder.dart';
import 'package:pkp_hub/app/widgets/feature_circle_card.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/enums/consultation_filter_status.dart';
import 'package:pkp_hub/core/enums/user_role.dart';
import 'package:pkp_hub/core/utils/formatters.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/features/main/controllers/home_controller.dart';
import 'package:pkp_hub/features/main/widgets/project_info_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  HomeController get controller => Get.find<HomeController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null) {
      appRouteObserver.subscribe(this, route);
    }
    // Ensure badges refreshed when the screen is first attached.
    controller.refreshUnreadBadges();
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // Called when coming back to this screen; refresh unread counters.
    controller.refreshUnreadBadges();
  }

  @override
  void didPush() {
    controller.refreshUnreadBadges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refresh,
          child: Obx(() {
            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildDefaultHome(),
                  ),
                ),
                if (_shouldShowConsultations)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: _buildConsultationSliverList(),
                  ),
                if (_shouldShowConsultations &&
                    controller.consultations.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: EmptyPlaceholder(
                        iconPath: AppIcons.clock,
                        message: 'Belum ada konsultasi',
                      ),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }

  List<Widget> _buildDefaultHome() {
    return [
      _buildCarouselBanner(),
      const SizedBox(height: 16),
      if (_shouldShowBalanceCard) ...[
        // _buildBalanceCard(),
        const SizedBox(height: 16),
      ],
      _buildFeatureGrid(),
    ];
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Obx(() {
        final chatCount = controller.chatBadgeCount.value;
        final notificationCount = controller.notificationBadgeCount.value;
        final loggedIn = controller.isLoggedIn;
        final userName = controller.userDisplayName.value;

        return PkpAppBar(
          title: loggedIn ? 'Hai! $userName' : AppStrings.homeWelcomeTitle,
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

  // Widget _buildBalanceCard() {
  //   return Obx(() {
  //     final role = controller.userRole.value;
  //     if (role == null || role == UserRole.unknown) {
  //       return const SizedBox.shrink();
  //     }
  //
  //     return Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 16),
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //       decoration: BoxDecoration(
  //         color: AppColors.primaryDark,
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //       child: Row(
  //         children: [
  //           Container(
  //             width: 48,
  //             height: 48,
  //             decoration: const BoxDecoration(
  //               color: AppColors.primaryDarkest,
  //               shape: BoxShape.circle,
  //             ),
  //             child: Center(
  //               child: SvgPicture.asset(
  //                 AppIcons.wallet,
  //                 width: 24,
  //                 height: 24,
  //                 colorFilter: const ColorFilter.mode(
  //                   AppColors.white,
  //                   BlendMode.srcIn,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           const SizedBox(width: 12),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Saldo Dompet',
  //                   style: AppTextStyles.bodyL.copyWith(color: AppColors.white),
  //                 ),
  //                 const SizedBox(height: 4),
  //                 Text(
  //                   Formatters.currency(controller.balance.value),
  //                   style: AppTextStyles.h3.copyWith(color: AppColors.white),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Material(
  //             color: AppColors.primaryDarkest,
  //             shape: const CircleBorder(),
  //             child: InkWell(
  //               onTap: () {
  //                 // TODO: Implement top-up functionality
  //               },
  //               customBorder: const CircleBorder(),
  //               child: SizedBox(
  //                 width: 40,
  //                 height: 40,
  //                 child: Center(
  //                   child: SvgPicture.asset(
  //                     AppIcons.add,
  //                     width: 20,
  //                     height: 20,
  //                     colorFilter: const ColorFilter.mode(
  //                       AppColors.white,
  //                       BlendMode.srcIn,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  // }

  bool get _shouldShowBalanceCard {
    final role = controller.userRole.value;
    if (!controller.isLoggedIn) return false;
    return role != null && role != UserRole.unknown;
  }

  Widget _buildFeatureGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final role = controller.userRole.value;
        final selectedConsultationStatus = controller.consultationStatus.value;
        final projectCounts = controller.projectCounts;
        final List<Widget> featureItems = [];

        if (role == UserRole.homeowner ||
            role == null ||
            role == UserRole.unknown) {
          featureItems.add(
            _buildFilterStatus(
              label: AppStrings.homeFeatureDesignConsultation,
              iconAsset: AppIcons.consultation,
              onTap: () {
                controller.onConsultationFeatureTapped();
              },
            ),
          );
          featureItems.add(
            _buildFilterStatus(
              label: AppStrings.homeFeatureLicensingFacilities,
              iconAsset: AppIcons.licensing,
              onTap: () async {
                await _launchExternalUrl('https://simbg.pu.go.id/');
              },
            ),
          );
          featureItems.add(
            _buildFilterStatus(
              label: AppStrings.homeFeatureConstructionLabor,
              iconAsset: AppIcons.construction,
              onTap: () {
                _launchExternalUrl(
                  'https://subtle-vacherin-4c664f.netlify.app/',
                );
              },
            ),
          );
          featureItems.add(
            _buildFilterStatus(
              label: AppStrings.homeFeatureStoreMaterial,
              iconAsset: AppIcons.material,
              onTap: () {
                _launchExternalUrl(
                  'https://subtle-vacherin-4c664f.netlify.app/',
                );
              },
            ),
          );
          featureItems.add(
            _buildFilterStatus(
              label: AppStrings.homeFeatureFinancingFacilities,
              iconAsset: AppIcons.financing,
              onTap: () {
                _launchExternalUrl(
                  'https://subtle-vacherin-4c664f.netlify.app/',
                );
              },
            ),
          );
          featureItems.add(
            _buildFilterStatus(
              label: AppStrings.homeFeatureConstructionSupervision,
              iconAsset: AppIcons.supervision,
              onTap: () async {
                if (await controller.ensureLoggedIn()) {
                  controller.navigateTo(AppRoutes.monitoring);
                }
              },
            ),
          );
        } else {
          featureItems.add(
            _buildFilterStatus(
              label: AppStrings.homeProjectsPendingTitle,
              iconAsset: AppIcons.hourglass,
              badgeCount:
                  projectCounts[consultationFilterWaitingConfirmation.id],
              isSelected:
                  selectedConsultationStatus ==
                  consultationFilterWaitingConfirmation,
              applySelectionStyle: true,
              onTap: () {
                controller.fetchConsultations(
                  consultationFilterWaitingConfirmation,
                );
              },
            ),
          );
          featureItems.add(
            _buildFilterStatus(
              label: AppStrings.homeProjectsActiveTitle,
              iconAsset: AppIcons.clock,
              badgeCount: projectCounts[consultationFilterInProgress.id],
              isSelected:
                  selectedConsultationStatus == consultationFilterInProgress,
              applySelectionStyle: true,
              onTap: () {
                controller.fetchConsultations(consultationFilterInProgress);
              },
            ),
          );
        }

        const crossAxisSpacing = 24.0;
        const mainAxisSpacing = 20.0;

        return LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final itemsPerRow = role == UserRole.consultant ? 2 : 3;
            final itemWidth =
                (maxWidth - (crossAxisSpacing * (itemsPerRow - 1))) /
                itemsPerRow;

            return Wrap(
              spacing: crossAxisSpacing,
              runSpacing: mainAxisSpacing,
              children: featureItems.map((item) {
                return SizedBox(width: itemWidth, child: item);
              }).toList(),
            );
          },
        );
      }),
    );
  }

  bool get _shouldShowConsultations =>
      controller.userRole.value == UserRole.consultant;

  SliverList _buildConsultationSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final consultations = controller.consultations;
        if (index == 0) {
          final header = _headerForStatus(controller.consultationStatus.value);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(header, style: AppTextStyles.h3),
          );
        }
        final itemIndex = index - 1;
        if (itemIndex >= consultations.length) return null;
        if (itemIndex == consultations.length - 1) {
          controller.loadMoreConsultations();
        }
        return _buildProjectCard(consultations[itemIndex]);
      }, childCount: (controller.consultations.length) + 1),
    );
  }

  String _headerForStatus(ConsultationFilterStatus status) {
    switch (status) {
      case consultationFilterWaitingConfirmation:
        return consultationFilterWaitingConfirmation.name;
      case consultationFilterDone:
        return consultationFilterDone.name;
      case consultationFilterInProgress:
      default:
        return consultationFilterInProgress.name;
    }
  }

  Widget _buildProjectCard(Project project) {
    final isConsultant = controller.userRole.value == UserRole.consultant;
    final homeOwnerName =
        project.consultationInfo?.homeOwnerName?.trim() ?? '-';
    final consultantName =
        project.consultationInfo?.consultantName?.trim() ?? '-';
    final primaryName = isConsultant ? homeOwnerName : consultantName;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ProjectInfoCard(
        title: project.projectName ?? '-',
        primaryLine: ProjectInfoLine(
          icon: Icons.person_outline,
          text: primaryName,
          color: AppColors.neutralDarkest,
        ),
        secondaryLine: ProjectInfoLine(
          icon: Icons.calendar_today_outlined,
          text:
              Formatters.formatIsoDate(
                project.consultationInfo?.createdAt ?? '',
              ) ??
              '',
          color: AppColors.neutralMediumLight,
        ),
        onTap: () => controller.onSelectConsultation(project),
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

  Widget _buildFilterStatus({
    required String label,
    int? badgeCount,
    IconData? icon,
    String? iconAsset,
    required VoidCallback onTap,
    bool isSelected = false,
    bool applySelectionStyle = false,
  }) {
    final unselectedBackground = applySelectionStyle
        ? AppColors.primaryLightest
        : AppColors.primaryDark;
    const selectedBackground = AppColors.primaryDark;
    final unselectedIconColor = applySelectionStyle
        ? AppColors.inputBorder
        : AppColors.white;
    const selectedIconColor = AppColors.white;
    final labelColor = applySelectionStyle
        ? AppColors.inputBorder
        : AppColors.neutralDarkest;
    const selectedLabelColor = AppColors.neutralDarkest;
    final baseLabelStyle = AppTextStyles.bodyM.copyWith(color: labelColor);
    final activeLabelStyle = AppTextStyles.bodyM.copyWith(
      color: selectedLabelColor,
    );

    return FeatureCircleCard(
      label: label,
      icon: icon,
      iconAsset: iconAsset,
      labelOutside: true,
      labelStyle: baseLabelStyle,
      selectedLabelStyle: activeLabelStyle,
      backgroundColor: unselectedBackground,
      selectedBackgroundColor: selectedBackground,
      iconColor: unselectedIconColor,
      selectedIconColor: selectedIconColor,
      badgeValue: badgeCount?.toString(),
      showBadge: badgeCount != null && badgeCount > 0,
      badgeColor: AppColors.errorDark,
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  Future<void> _launchExternalUrl(String url) async {
    final uri = Uri.parse(url);
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      Get.snackbar(
        'Gagal membuka tautan',
        'Tautan tidak dapat dibuka saat ini.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
        colorText: AppColors.white,
      );
    }
  }
}

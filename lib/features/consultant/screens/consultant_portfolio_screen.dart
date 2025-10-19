import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/utils/formatters.dart';

import '../controllers/consultant_portfolio_controller.dart';

class ConsultantPortfolioScreen extends GetView<ConsultantPortfolioController> {
  const ConsultantPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(title: AppStrings.menuConsultation),
      body: Stack(
        children: [
          Obx(
            () => NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels >=
                        scrollInfo.metrics.maxScrollExtent - 100 &&
                    controller.hasMore.value &&
                    !controller.isLoading.value) {
                  controller.loadMore();
                }
                return false;
              },
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
                itemCount:
                    controller.portfolios.length +
                    (controller.hasMore.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= controller.portfolios.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final item = controller.portfolios[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.neutralDarkest.withOpacity(
                            0.10,
                          ), // stronger shadow
                          blurRadius: 24, // more blur for elevation
                          offset: const Offset(
                            0,
                            8,
                          ), // more offset for elevation
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Top image area
                        Container(
                          height: 140,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryLightest,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Center(
                            child:
                                item.imageUrls.isNotEmpty &&
                                    item.imageUrls[0].isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      item.imageUrls[0],
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                      errorBuilder: (c, e, s) =>
                                          _placeholderImage(),
                                    ),
                                  )
                                : _placeholderImage(),
                          ),
                        ),
                        // Info area
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.projectName,
                                style: AppTextStyles.h4.copyWith(
                                  color: AppColors.neutralDarkest,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                Formatters.currency(
                                  (item.price ?? 0).toDouble(),
                                ),
                                style: AppTextStyles.bodyM.copyWith(
                                  color: AppColors.neutralMedium,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                item.detailDescription,
                                style: AppTextStyles.bodyS.copyWith(
                                  color: AppColors.neutralMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: PkpElevatedButton(
          text: AppStrings.menuConsultation,
          enabled: true,
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _placeholderImage() {
    return const Icon(Icons.image_outlined, color: AppColors.primary, size: 48);
  }
}

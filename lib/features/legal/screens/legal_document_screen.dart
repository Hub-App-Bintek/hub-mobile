import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/features/legal/controllers/legal_document_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LegalDocumentScreen extends GetView<LegalDocumentController> {
  const LegalDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PkpAppBar(
        title: controller.title,
        actions: [
          PkpAppBarAction(
            icon: Icons.refresh,
            onPressed: controller.loadDocument,
            color: AppColors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          final hasContent = controller.htmlContent.isNotEmpty;
          final isLoading = controller.isLoading.value;

          return Stack(
            children: [
              Positioned.fill(
                child: hasContent
                    ? WebViewWidget(controller: controller.webViewController)
                    : _buildEmptyState(),
              ),
              if (isLoading)
                const Positioned.fill(
                  child: ColoredBox(
                    color: Colors.transparent,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'Konten tidak tersedia saat ini.',
          style: AppTextStyles.bodyM.copyWith(
            color: AppColors.neutralMediumDark,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

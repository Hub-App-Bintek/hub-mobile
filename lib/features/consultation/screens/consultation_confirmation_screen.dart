import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_confirmation_controller.dart';

class ConsultationConfirmationScreen
    extends GetView<ConsultationConfirmationController> {
  const ConsultationConfirmationScreen({super.key});

  static const _mapPlaceholder =
      'https://www.figma.com/api/mcp/asset/809374c9-e2d2-4c8a-9c41-eae2190e27e9';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PkpAppBar(
        title: 'Konfirmasi Konsultasi',
        backgroundColor: AppColors.primaryDark,
        showNavigation: true,
        leadingColor: AppColors.white,
        actions: [
          PkpAppBarAction(
            icon: Icons.chat_bubble_outline,
            onPressed: () {},
            color: AppColors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMap(),
                    const SizedBox(height: 16),
                    Text(
                      'Renovasi Rumah',
                      style: AppTextStyles.h1.copyWith(
                        color: AppColors.neutralDarkest,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildLabelValue('Pemilik Proyek', 'John Doe'),
                    const SizedBox(height: 16),
                    _buildLabelValueWithIcon(
                      'Lokasi Proyek',
                      'Jakarta Selatan',
                      Icons.location_on_outlined,
                    ),
                    const SizedBox(height: 16),
                    _buildLabelValue(
                      'Detail Konsultasi',
                      'Konsultasi desain untuk renovasi rumah tinggal dengan konsep minimalis modern. Membutuhkan konsultasi struktur dan arsitektur.',
                    ),
                    const SizedBox(height: 16),
                    _buildNote(),
                    const SizedBox(height: 20),
                    Text(
                      'Apakah memerlukan survey lokasi?',
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.neutralDarkest,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(
                      () => PkpTextFormField(
                        labelText: '',
                        hintText: controller.selectedSurveyOption.value,
                        type: PkpTextFormFieldType.dropdown,
                        options: controller.surveyOptions,
                        onChanged: controller.onSurveyOptionChanged,
                        filled: true,
                        labelStyle: AppTextStyles.bodyM,
                        hintStyle: AppTextStyles.bodyM.copyWith(
                          color: AppColors.neutralDarkest,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildMap() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: AspectRatio(
        aspectRatio: 393 / 220,
        child: Image.network(_mapPlaceholder, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildLabelValue(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyM.copyWith(
            color: AppColors.neutralMediumLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.h4.copyWith(color: AppColors.neutralDarkest),
        ),
      ],
    );
  }

  Widget _buildLabelValueWithIcon(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyM.copyWith(
            color: AppColors.neutralMediumLight,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(icon, size: 18, color: AppColors.primaryDark),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNote() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inputSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            'CATATAN',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.neutralMediumLight,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            'Dengan menerima konsultasi ini, Anda setuju untuk melakukan survey lokasi (opsional) dan menyediakan proposal konsultasi dalam waktu 3-5 hari kerja.',
            style: AppTextStyles.bodyM.copyWith(
              color: AppColors.neutralDarkest,
              height: 20 / 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return PkpBottomActions(
      secondaryText: 'Tolak Konsultasi',
      onSecondaryPressed: controller.onReject,
      primaryText: 'Terima Konsultasi',
      onPrimaryPressed: controller.onAccept,
    );
  }
}

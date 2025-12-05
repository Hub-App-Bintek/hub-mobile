import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_icons.dart';
import 'package:pkp_hub/data/models/response/project_details_response.dart';
import 'package:pkp_hub/features/consultation/controllers/consultation_confirmation_controller.dart';

class ConsultationConfirmationScreen
    extends GetView<ConsultationConfirmationController> {
  const ConsultationConfirmationScreen({super.key});

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
            onPressed: controller.startChatWithHomeOwner,
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
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          final project = controller.projectDetail.value;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMap(project),
                      const SizedBox(height: 16),
                      Text(
                        project?.projectName ?? '-',
                        style: AppTextStyles.h1.copyWith(
                          color: AppColors.neutralDarkest,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildLabelValue(
                        'Pemilik Proyek',
                        project?.consultationInfo?.homeOwnerName ?? '-',
                      ),
                      const SizedBox(height: 16),
                      _buildLabelValueWithIcon(
                        'Lokasi Proyek',
                        project?.projectLocation?.regencyName ?? '-',
                        Icons.location_on_outlined,
                      ),
                      const SizedBox(height: 16),
                      _buildLabelValue(
                        'Detail Lokasi',
                        project?.projectLocation?.locationDetail ?? '-',
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
                      const SizedBox(height: 12),
                      Obx(() {
                        if (!controller.requiresSurvey) {
                          return const SizedBox.shrink();
                        }

                        final dateText =
                            controller.selectedSurveyDate.value != null
                            ? DateFormat(
                                'dd MMM yyyy',
                              ).format(controller.selectedSurveyDate.value!)
                            : 'Pilih tanggal';
                        final timeText =
                            controller.selectedSurveyTime.value != null
                            ? controller.selectedSurveyTime.value!.format(
                                context,
                              )
                            : 'Pilih waktu';

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tanggal Survey',
                              style: AppTextStyles.bodyM.copyWith(
                                color: AppColors.neutralDarkest,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: controller.pickSurveyDate,
                              child: AbsorbPointer(
                                child: PkpTextFormField(
                                  hintText: dateText,
                                  type: PkpTextFormFieldType.datetime,
                                  filled: true,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Waktu Survey',
                              style: AppTextStyles.bodyM.copyWith(
                                color: AppColors.neutralDarkest,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: controller.pickSurveyTime,
                              child: AbsorbPointer(
                                child: PkpTextFormField(
                                  hintText: timeText,
                                  type: PkpTextFormFieldType.time,
                                  filled: true,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
              _buildActions(),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildMap(ProjectDetailsResponse? project) {
    const fallback = LatLng(-6.2, 106.816666);
    final lat = project?.projectLocation?.latitude;
    final lng = project?.projectLocation?.longitude;
    final target = lat != null && lng != null ? LatLng(lat, lng) : fallback;
    final markers = {
      Marker(markerId: const MarkerId('project_location'), position: target),
    };

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 220,
        child: GoogleMap(
          key: ValueKey('${target.latitude},${target.longitude}'),
          initialCameraPosition: CameraPosition(target: target, zoom: 15),
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          scrollGesturesEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          zoomGesturesEnabled: false,
          markers: markers,
        ),
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

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/utils/formatters.dart';

class ProjectInformationBottomSheet extends StatelessWidget {
  const ProjectInformationBottomSheet({
    super.key,
    required this.projectName,
    this.locationDetail,
    this.landArea,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.homeOwnerName,
  });

  final String projectName;
  final String? locationDetail;
  final double? landArea;
  final double? latitude;
  final double? longitude;
  final DateTime? createdAt;
  final String? homeOwnerName;

  bool get _hasCoordinate =>
      latitude != null && longitude != null && latitude != 0 && longitude != 0;

  @override
  Widget build(BuildContext context) {
    final coordinateText = _hasCoordinate
        ? '${latitude!.toStringAsFixed(6)}, ${longitude!.toStringAsFixed(6)}'
        : '-';
    final createdAtText = createdAt == null
        ? '-'
        : Formatters.formatDateTime(
            createdAt!,
            datePattern: 'dd MMM yyyy',
            timePattern: 'HH.mm',
            appendWib: true,
          );
    final locationText = (locationDetail?.trim().isNotEmpty ?? false)
        ? locationDetail!.trim()
        : AppStrings.projectInfoLocationEmpty;
    final landAreaText = landArea == null
        ? '-'
        : Formatters.formatLandArea(landArea);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.neutralLight,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.projectInfoTitle,
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 200,
                  child: _hasCoordinate
                      ? GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(latitude!, longitude!),
                            zoom: 16,
                          ),
                          markers: {
                            Marker(
                              markerId: const MarkerId('project-location'),
                              position: LatLng(latitude!, longitude!),
                            ),
                          },
                          zoomGesturesEnabled: false,
                          scrollGesturesEnabled: false,
                          rotateGesturesEnabled: false,
                          tiltGesturesEnabled: false,
                          mapToolbarEnabled: false,
                          myLocationButtonEnabled: false,
                          liteModeEnabled: true,
                        )
                      : Container(
                          color: AppColors.neutralLightest,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                AppStrings.projectInfoLocationEmpty,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodyS.copyWith(
                                  color: AppColors.neutralMedium,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              _InfoRow(
                label: AppStrings.projectNameLabel.replaceAll('*', ''),
                value: projectName,
                icon: Icons.badge_outlined,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                label: AppStrings.roleHomeowner,
                value: homeOwnerName ?? '',
                icon: Icons.person,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                label: AppStrings.projectInfoLocationLabel,
                value: locationText,
                icon: Icons.place_outlined,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                label: AppStrings.landAreaLabel.replaceAll('*', ''),
                value: landAreaText,
                icon: Icons.square_foot_outlined,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                label: AppStrings.projectInfoCoordinateLabel,
                value: coordinateText,
                icon: Icons.my_location_outlined,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                label: AppStrings.projectInfoCreatedAtLabel,
                value: createdAtText,
                icon: Icons.event_outlined,
              ),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.neutralMedium, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.bodyS.copyWith(
                  color: AppColors.neutralMedium,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.neutralDarkest,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

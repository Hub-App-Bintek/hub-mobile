import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/features/licensing/controllers/licensing_location_details_controller.dart';

class LicensingLocationDetailsScreen
    extends GetView<LicensingLocationDetailsController> {
  const LicensingLocationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(
        title: 'Lokasi Perizinan',
        backgroundColor: AppColors.primaryDark,
        leadingColor: AppColors.white,
        titleTextColor: AppColors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildMap(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  children: [
                    _DropdownField(
                      label: 'Provinsi *',
                      hint: 'Pilih provinsi',
                      controller: controller.provinceController,
                      options: controller.provinces,
                      onChanged: controller.selectProvince,
                      isLoading: controller.isLoadingRegions,
                    ),
                    const SizedBox(height: 16),
                    _DropdownField(
                      label: 'Kabupaten/Kota *',
                      hint: 'Pilih kabupaten/kota',
                      controller: controller.cityController,
                      options: controller.cities,
                      onChanged: controller.selectCity,
                      isLoading: controller.isLoadingRegions,
                    ),
                    const SizedBox(height: 16),
                    _DropdownField(
                      label: 'Kecamatan *',
                      hint: 'Pilih kecamatan',
                      controller: controller.subdistrictController,
                      options: controller.subdistricts,
                      onChanged: controller.selectSubdistrict,
                      isLoading: controller.isLoadingRegions,
                    ),
                    const SizedBox(height: 16),
                    _DropdownField(
                      label: 'Kelurahan *',
                      hint: 'Pilih kelurahan',
                      controller: controller.villageController,
                      options: controller.villages,
                      onChanged: controller.selectVillage,
                      isLoading: controller.isLoadingRegions,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        final enabled =
            controller.isFormValid.value && !controller.isLoadingRegions.value;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PkpElevatedButton(
              text: 'Submit',
              // Change this line to call the new method
              onPressed: enabled ? controller.submitLocationAndCreateProject : null,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMap() {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => GoogleMap(
              onMapCreated: controller.onMapCreated,
              initialCameraPosition: CameraPosition(
                target:
                    controller.selectedLocation.value ??
                    const LatLng(-6.2088, 106.8456),
                zoom: 14,
              ),
              onCameraMove: (pos) => controller.updatePosition(pos.target),
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              markers: const <Marker>{},
              padding: EdgeInsets.zero,
            ),
          ),
          const Icon(Icons.location_on, size: 40, color: AppColors.primaryDark),
          Positioned(
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'Geser peta untuk memilih lokasi',
                style: AppTextStyles.bodyS.copyWith(
                  color: AppColors.neutralDarkest,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  const _DropdownField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.options,
    required this.onChanged,
    required this.isLoading,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final RxList<String> options;
  final ValueChanged<String?> onChanged;
  final RxBool isLoading;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PkpTextFormField(
        controller: controller,
        labelText: label,
        hintText: hint,
        type: PkpTextFormFieldType.dropdown,
        options: options,
        onChanged: onChanged,
        filled: true,
        enabled: !isLoading.value,
      ),
    );
  }
}

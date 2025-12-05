import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/theme/app_text_styles.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_bottom_actions.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/project/controllers/location_details_controller.dart';

class LocationDetailsScreen extends GetView<LocationDetailsController> {
  const LocationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PkpAppBar(
        title: 'Detail Lokasi',
        backgroundColor: AppColors.primaryDark,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildMap(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(
                  () => IgnorePointer(
                    ignoring: controller.isLoadingLocation.value,
                    child: Opacity(
                      opacity: controller.isLoadingLocation.value ? 0.6 : 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          _dropdownField(
                            label: 'Provinsi*',
                            hint: 'Pilih Provinsi',
                            options: controller.provinceOptions,
                            controller: controller.provinceController,
                            enabled: controller.provinces.isNotEmpty,
                            errorText: controller.provinceError.value,
                            onChanged: controller.selectProvince,
                          ),
                          const SizedBox(height: 16),
                          _dropdownField(
                            label: 'Kabupaten/Kota*',
                            hint: 'Pilih Kabupaten/Kota',
                            options: controller.cityOptions,
                            controller: controller.cityController,
                            enabled:
                                controller.selectedProvince.value != null &&
                                controller.regencies.isNotEmpty,
                            errorText: controller.cityError.value,
                            onChanged: controller.selectCity,
                          ),
                          const SizedBox(height: 16),
                          _dropdownField(
                            label: 'Kecamatan*',
                            hint: 'Pilih Kecamatan',
                            options: controller.subdistrictOptions,
                            controller: controller.subdistrictController,
                            enabled:
                                controller.selectedCity.value != null &&
                                controller.districts.isNotEmpty,
                            errorText: controller.subdistrictError.value,
                            onChanged: controller.selectSubdistrict,
                          ),
                          const SizedBox(height: 16),
                          _dropdownField(
                            label: 'Kelurahan*',
                            hint: 'Pilih Kelurahan',
                            options: controller.villageOptions,
                            controller: controller.villageController,
                            enabled:
                                controller.selectedSubdistrict.value != null &&
                                controller.villages.isNotEmpty,
                            errorText: controller.villageError.value,
                            onChanged: controller.selectVillage,
                          ),
                          const SizedBox(height: 16),
                          PkpTextFormField(
                            controller: controller.locationDetailsController,
                            labelText: 'Detail Lokasi*',
                            hintText: 'Masukkan detail alamat lokasi proyek',
                            type: PkpTextFormFieldType.multiline,
                            errorText: controller.locationDetailsError.value,
                          ),
                          const SizedBox(height: 16),
                          PkpTextFormField(
                            controller: controller.landAreaController,
                            labelText: 'Luas Lahan (m²)*',
                            hintText: 'Masukkan luas lahan',
                            type: PkpTextFormFieldType.number,
                            errorText: controller.landAreaError.value,
                          ),
                          const SizedBox(height: 16),
                          PkpTextFormField(
                            controller: controller.incomeController,
                            labelText: 'Pendapatan (Rp)*',
                            hintText: 'Masukkan pendapatan',
                            type: PkpTextFormFieldType.currency,
                            errorText: controller.incomeError.value,
                          ),
                          const SizedBox(height: 16),
                          PkpTextFormField(
                            controller: controller.incomeProofController,
                            labelText: AppStrings.incomeProofLabel,
                            hintText: 'Pilih file PDF',
                            type: PkpTextFormFieldType.filePicker,
                            filePickerType: PkpFilePickerType.pdf,
                            onFilePicked: controller.onIncomeProofPicked,
                            filled: true,
                            errorText: controller.incomeProofError.value,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        final enabled =
            controller.isFormValid &&
            !controller.isLoadingLocation.value &&
            !controller.isRequesting.value;
        return SafeArea(
          child: PkpBottomActions(
            primaryText: 'Lanjutkan',
            primaryEnabled: enabled,
            primaryLoading: controller.isRequesting.value,
            onPrimaryPressed: controller.createProject,
          ),
        );
      }),
    );
  }

  Widget _buildMap(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Obx(() {
            if (controller.isLoadingLocation.value ||
                controller.selectedLocation.value == null) {
              return Container(color: AppColors.white);
            }
            return GoogleMap(
              onMapCreated: controller.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: controller.mapTarget,
                zoom: 16,
              ),
              onCameraMove: (pos) => controller.updatePosition(pos.target),
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              padding: EdgeInsets.zero,
              markers: const <Marker>{},
            );
          }),
          Positioned(
            top: 12,
            left: 16,
            right: 16,
            child: _buildSearchField(context),
          ),
          Transform.translate(
            offset: const Offset(0, -16),
            child: const Icon(
              Icons.location_on,
              size: 40,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: controller.searchController,
      googleAPIKey: controller.googleApiKey,
      countries: const ['id'],
      isLatLngRequired: false,
      showError: false,
      focusNode: controller.searchFocusNode,
      boxDecoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.inputBorder, width: 0.6),
      ),
      inputDecoration: InputDecoration(
        hintText: AppStrings.searchLocationHint,
        hintStyle: AppTextStyles.bodyS,
        labelStyle: AppTextStyles.bodyS,
        prefixIcon: const Icon(Icons.search, color: AppColors.primaryDark),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      textStyle: AppTextStyles.bodyS,
      itemClick: (prediction) {
        final description = prediction.description ?? '';
        controller.searchController.text = description;
        controller.searchController.selection = TextSelection.fromPosition(
          TextPosition(offset: description.length),
        );
      },
      getPlaceDetailWithLatLng: (prediction) async {
        if (prediction.lat == null || prediction.lng == null) {
          controller.selectedLocation.value = controller.mapTarget;
          return;
        }
        await controller.onPlaceSelected(prediction);
      },
    );
  }

  Widget _dropdownField({
    required String label,
    required String hint,
    required List<String> options,
    required TextEditingController controller,
    required ValueChanged<String?> onChanged,
    bool enabled = true,
    String? errorText,
  }) {
    return PkpTextFormField(
      controller: controller,
      labelText: label,
      hintText: hint,
      type: PkpTextFormFieldType.dropdown,
      options: options,
      errorText: errorText,
      filled: true,
      enabled: enabled,
      labelStyle: AppTextStyles.bodyS,
      hintStyle: AppTextStyles.bodyM,
      onChanged: onChanged,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/features/project/controllers/location_details_controller.dart';

class LocationDetailsScreen extends GetView<LocationDetailsController> {
  const LocationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PkpAppBar(title: AppStrings.landLocationTitle),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() {
              if (controller.isLoadingLocation.value) {
                return const SizedBox(
                  height: 240,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (controller.selectedLocation.value == null) {
                return const SizedBox(
                  height: 240,
                  child: Center(child: Text(AppStrings.unableToFetchLocation)),
                );
              }
              return SizedBox(
                height: 240,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: controller.selectedLocation.value!,
                        zoom: 16,
                      ),
                      onCameraMove: (position) {
                        controller.updatePosition(position.target);
                      },
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      padding: EdgeInsets.zero,
                      markers: const {},
                    ),
                    IgnorePointer(
                      child: Transform.translate(
                        offset: const Offset(0, -16), // align tip to map center
                        child: const Icon(
                          Icons.location_on,
                          size: 40,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            Obx(() {
              if (!(controller.isLocationError.value) ||
                  controller.locationErrorMessage.value == null) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  controller.locationErrorMessage.value ?? '',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.red.shade700),
                ),
              );
            }),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Obx(
                    () => IgnorePointer(
                      ignoring: controller.isLoadingLocation.value,
                      child: Opacity(
                        opacity: controller.isLoadingLocation.value ? 0.6 : 1.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            PkpTextFormField(
                              labelText: AppStrings.projectNameLabel,
                              hintText: AppStrings.projectNameHint,
                              type: PkpTextFormFieldType.text,
                              controller: controller.projectNameController,
                              errorText: controller.projectNameError.value,
                            ),
                            const SizedBox(height: 16),
                            _LocationDropdown(
                              label: AppStrings.provinceLabel,
                              hint: AppStrings.provinceHint,
                              options: controller.provinceOptions,
                              value: controller.selectedProvince.value,
                              errorText: controller.provinceError.value,
                              onChanged: controller.selectProvince,
                            ),
                            const SizedBox(height: 16),
                            _LocationDropdown(
                              label: AppStrings.cityLabel,
                              hint: AppStrings.cityHint,
                              options: controller.cityOptions,
                              value: controller.selectedCity.value,
                              errorText: controller.cityError.value,
                              onChanged: controller.selectCity,
                            ),
                            const SizedBox(height: 16),
                            _LocationDropdown(
                              label: AppStrings.subdistrictLabel,
                              hint: AppStrings.subdistrictHint,
                              options: controller.subdistrictOptions,
                              value: controller.selectedSubdistrict.value,
                              errorText: controller.subdistrictError.value,
                              onChanged: controller.selectSubdistrict,
                            ),
                            const SizedBox(height: 16),
                            _LocationDropdown(
                              label: AppStrings.villageLabel,
                              hint: AppStrings.villageHint,
                              options: controller.villageOptions,
                              value: controller.selectedVillage.value,
                              errorText: controller.villageError.value,
                              onChanged: controller.selectVillage,
                            ),
                            const SizedBox(height: 16),
                            PkpTextFormField(
                              labelText: AppStrings.locationDetailsLabel,
                              hintText: AppStrings.locationDetailsHint,
                              type: PkpTextFormFieldType.multiline,
                              controller: controller.locationDetailsController,
                              errorText: controller.locationDetailsError.value,
                            ),
                            const SizedBox(height: 16),
                            PkpTextFormField(
                              labelText: AppStrings.landAreaLabel,
                              hintText: AppStrings.landAreaHint,
                              type: PkpTextFormFieldType.number,
                              controller: controller.landAreaController,
                              errorText: controller.landAreaError.value,
                            ),
                            const SizedBox(height: 16),
                            PkpTextFormField(
                              labelText: AppStrings.incomeLabel,
                              hintText: AppStrings.incomeHint,
                              type: PkpTextFormFieldType.currency,
                              controller: controller.incomeController,
                              errorText: controller.incomeError.value,
                            ),
                            const SizedBox(height: 16),
                            _IncomeProofPicker(controller: controller),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: PkpElevatedButton(
            text: AppStrings.continueButton,
            isLoading: controller.isRequesting.value,
            onPressed:
                (controller.isFormValid &&
                    !controller.isLoadingLocation.value &&
                    !controller.isRequesting.value)
                ? controller.createProject
                : null,
            enabled:
                controller.isFormValid &&
                !controller.isLoadingLocation.value &&
                !controller.isRequesting.value,
          ),
        ),
      ),
    );
  }
}

class _LocationDropdown extends StatelessWidget {
  const _LocationDropdown({
    required this.label,
    required this.hint,
    required this.options,
    required this.onChanged,
    this.value,
    this.errorText,
  });

  final String label;
  final String hint;
  final List<String> options;
  final String? value;
  final String? errorText;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.inputBorder),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: value?.isNotEmpty == true ? value : null,
          decoration: const InputDecoration(
            hintText: '',
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ).copyWith(hintText: hint, errorText: errorText),
          items: options
              .map(
                (option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _IncomeProofPicker extends StatelessWidget {
  const _IncomeProofPicker({required this.controller});

  final LocationDetailsController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fileName = controller.incomeProofFileName.value;
    final hasFile = fileName != null && fileName.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.incomeProofLabel,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: controller.isLoadingLocation.value
              ? null
              : controller.pickIncomeProof,
          borderRadius: BorderRadius.circular(12),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.inputSurface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.inputBorder),
            ),
            child: Row(
              children: [
                const Icon(Icons.upload_file, color: AppColors.primaryDarkest),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    hasFile ? fileName : 'Pilih file PDF',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: hasFile
                          ? AppColors.neutralDarkest
                          : AppColors.neutralMedium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (hasFile) ...[
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.successDark,
                    size: 20,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

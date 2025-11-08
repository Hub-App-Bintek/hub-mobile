import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/app/widgets/pkp_app_bar.dart';
import 'package:pkp_hub/app/widgets/pkp_elevated_button.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/data/models/project_type.dart';
import 'package:pkp_hub/features/project/controllers/create_project_controller.dart';

class CreateProjectScreen extends GetView<CreateProjectController> {
  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                    ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: GoogleMap(
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
                        markers: controller.selectedLocation.value == null
                            ? {}
                            : {
                                Marker(
                                  markerId: const MarkerId('selected-location'),
                                  position: controller.selectedLocation.value!,
                                ),
                              },
                      ),
                    ),
                  ],
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
                            ),
                            const SizedBox(height: 16),
                            PkpTextFormField(
                              labelText: AppStrings.locationDetailsLabel,
                              hintText: AppStrings.locationDetailsHint,
                              type: PkpTextFormFieldType.multiline,
                              controller: controller.locationDetailsController,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              AppStrings.typeLabel,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<ProjectType>(
                              initialValue:
                                  controller.selectedProjectType.value,
                              items: projectTypeList
                                  .map(
                                    (type) => DropdownMenuItem<ProjectType>(
                                      value: type,
                                      child: Text(type.name),
                                    ),
                                  )
                                  .toList(),
                              onChanged: controller.isLoadingLocation.value
                                  ? null
                                  : controller.updateProjectType,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            PkpTextFormField(
                              labelText: AppStrings.landAreaLabel,
                              hintText: AppStrings.landAreaHint,
                              type: PkpTextFormFieldType.number,
                              controller: controller.landAreaController,
                            ),
                            const SizedBox(height: 16),
                            PkpTextFormField(
                              labelText: AppStrings.incomeLabel,
                              hintText: AppStrings.incomeHint,
                              type: PkpTextFormFieldType.currency,
                              controller: controller.incomeController,
                            ),
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
            text: 'Continue',
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

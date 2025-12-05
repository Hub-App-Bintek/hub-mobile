import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/widgets/controllers/location_selector_controller.dart';
import 'package:pkp_hub/app/widgets/pkp_text_form_field.dart';

class LocationSelectorWidget extends GetWidget<LocationSelectorController> {
  // A unique tag is crucial for reusing the widget on the same page.
  final String tag;

  const LocationSelectorWidget({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    // We must initialize the controller here with its tag.
    // Get.put() ensures it's created and available.
    Get.put(
      LocationSelectorController(
          Get.find(), Get.find(), Get.find(), Get.find()),
      tag: tag,
    );

    return Obx(() =>
        Column(
          children: [
            PkpTextFormField(
              type: PkpTextFormFieldType.dropdown,
              controller: controller.provinceController,
              labelText: 'Provinsi',
              hintText: 'Pilih provinsi',
              options: controller.provinceOptions,
              onChanged: controller.onProvinceSelected,
            ),
            const SizedBox(height: 16),
            PkpTextFormField(
              type: PkpTextFormFieldType.dropdown,
              controller: controller.cityController,
              labelText: 'Kabupaten/Kota',
              hintText: 'Pilih Kabupaten/Kota',
              options: controller.cityOptions,
              onChanged: controller.onCitySelected,
              enabled: controller.provinces.isNotEmpty,
            ),
            const SizedBox(height: 16),
            PkpTextFormField(
              type: PkpTextFormFieldType.dropdown,
              controller: controller.subdistrictController,
              labelText: 'Kecamatan',
              hintText: 'Pilih Kecamatan',
              options: controller.subdistrictOptions,
              onChanged: controller.onSubdistrictSelected,
              enabled: controller.regencies.isNotEmpty,
            ),
            const SizedBox(height: 16),
            PkpTextFormField(
              type: PkpTextFormFieldType.dropdown,
              controller: controller.villageController,
              labelText: 'Kelurahan/Desa',
              hintText: 'Pilih Kelurahan/Desa',
              options: controller.villageOptions,
              onChanged: controller.onVillageSelected,
              enabled: controller.districts.isNotEmpty,
            ),
          ],
        ));
  }
}
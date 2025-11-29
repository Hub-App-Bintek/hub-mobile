import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

class LicensingLocationDetailsController extends BaseController {
  bool isPrototype = true;
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final RxList<String> provinces = <String>[].obs;
  final RxList<String> cities = <String>[].obs;
  final RxList<String> subdistricts = <String>[].obs;
  final RxList<String> villages = <String>[].obs;
  final RxBool isLoadingRegions = false.obs;
  final RxBool isFormValid = false.obs;
  final Rxn<LatLng> selectedLocation = Rxn<LatLng>();
  GoogleMapController? mapController;
  static const LatLng _defaultLocation = LatLng(-6.2088, 106.8456);

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg is bool) {
      isPrototype = arg;
    }
    selectedLocation.value = _defaultLocation;
    _loadProvinces();
  }

  void selectProvince(String? value) {
    if (value == null) return;
    provinceController.text = value;
    cityController.clear();
    subdistrictController.clear();
    villageController.clear();
    cities.clear();
    subdistricts.clear();
    villages.clear();
    _loadCities(value);
    _updateFormValid();
  }

  void selectCity(String? value) {
    if (value == null) return;
    cityController.text = value;
    subdistrictController.clear();
    villageController.clear();
    subdistricts.clear();
    villages.clear();
    _loadSubdistricts(value);
    _updateFormValid();
  }

  void selectSubdistrict(String? value) {
    if (value == null) return;
    subdistrictController.text = value;
    villageController.clear();
    villages.clear();
    _loadVillages(value);
    _updateFormValid();
  }

  void selectVillage(String? value) {
    if (value == null) return;
    villageController.text = value;
    _updateFormValid();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void updatePosition(LatLng position) {
    selectedLocation.value = position;
    _updateFormValid();
  }

  void goToForm() {
    if (!isFormValid.value) return;
    Get.toNamed(
      AppRoutes.simbgForm,
      arguments: {
        'isPrototype': isPrototype,
        'province': provinceController.text,
        'city': cityController.text,
        'subdistrict': subdistrictController.text,
        'village': villageController.text,
        'coordinate':
            '${selectedLocation.value?.latitude}, ${selectedLocation.value?.longitude}',
      },
    );
  }

  Future<void> _loadProvinces() async {
    isLoadingRegions.value = true;
    try {
      // TODO: replace with real API call
      await Future<void>.delayed(const Duration(milliseconds: 200));
      provinces.assignAll(const ['DKI Jakarta', 'Jawa Barat', 'Jawa Tengah']);
    } finally {
      isLoadingRegions.value = false;
      _updateFormValid();
    }
  }

  Future<void> _loadCities(String province) async {
    isLoadingRegions.value = true;
    try {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      cities.assignAll(const ['Jakarta Selatan', 'Jakarta Barat']);
    } finally {
      isLoadingRegions.value = false;
      _updateFormValid();
    }
  }

  Future<void> _loadSubdistricts(String city) async {
    isLoadingRegions.value = true;
    try {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      subdistricts.assignAll(const ['Kebayoran Lama', 'Kebayoran Baru']);
    } finally {
      isLoadingRegions.value = false;
      _updateFormValid();
    }
  }

  Future<void> _loadVillages(String subdistrict) async {
    isLoadingRegions.value = true;
    try {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      villages.assignAll(const ['Gandaria Utara', 'Pondok Indah']);
    } finally {
      isLoadingRegions.value = false;
      _updateFormValid();
    }
  }

  void _updateFormValid() {
    isFormValid.value =
        provinceController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        subdistrictController.text.isNotEmpty &&
        villageController.text.isNotEmpty &&
        selectedLocation.value != null;
  }

  @override
  void onClose() {
    provinceController.dispose();
    cityController.dispose();
    subdistrictController.dispose();
    villageController.dispose();
    super.onClose();
  }
}

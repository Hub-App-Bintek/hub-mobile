import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';

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

  final CreateProjectUseCase _createProjectUseCase;

  LicensingLocationDetailsController(this._createProjectUseCase);

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

  // 2. Rename the submit method for clarity and implement the logic
  //    The old 'goToForm' is now 'submitLocationAndCreateProject'
  void submitLocationAndCreateProject() async {
    // Optional: Add a final check, though the button is disabled
    if (!isFormValid.value) return;

    // 3. Build the request object from the controller's state
    //    You need to map your selected dropdown values and LatLng to a request model.
    //    This is an example structure.
    final request = CreateProjectRequest(
      type: isPrototype ? 'PROTOTYPE' : 'NON_PROTOTYPE',
      locationDetail: '${villageController.text}, ${subdistrictController.text}, ${cityController.text}, ${provinceController.text}',
      landArea: 0,
      income: 0,
      latitude: selectedLocation.value!.latitude,
      longitude: selectedLocation.value!.longitude,
      // ... include IDs and any other required fields ...
    );



    // 4. Use handleAsync to call the use case
    await handleAsync(
          () => _createProjectUseCase.repository.createProject(request),
      onSuccess: (response) {
        // 5. On success, navigate to the SIMBG form with the new projectId
        Get.toNamed(
          AppRoutes.simbgForm,
          arguments: {
            'projectId': response.projectId, // Get projectId from the response
          },
        );
      },
      // onFailure is handled automatically by BaseController (shows an error snackbar)
    );
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

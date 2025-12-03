import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';

class LicensingLocationDetailsController extends BaseController {
  bool isPrototype = true;
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final RxBool isLoadingRegions = false.obs;
  final RxBool isFormValid = false.obs;
  final Rxn<LatLng> selectedLocation = Rxn<LatLng>();
  GoogleMapController? mapController;
  static const LatLng _defaultLocation = LatLng(-6.2088, 106.8456);

  final RxList<Province> provinces = <Province>[].obs;
  final RxList<Regency> regencies = <Regency>[].obs;
  final RxList<District> districts = <District>[].obs;
  final RxList<Village> villages = <Village>[].obs;

  final RxBool _isFormValid = false.obs;

  Rxn<Province> selectedProvince = Rxn<Province>();
  Rxn<Regency> selectedCity = Rxn<Regency>();
  Rxn<District> selectedSubdistrict = Rxn<District>();
  Rxn<Village> selectedVillage = Rxn<Village>();

  RxnString provinceError = RxnString();
  RxnString cityError = RxnString();
  RxnString subdistrictError = RxnString();
  RxnString villageError = RxnString();

  RxBool isProvinceValid = false.obs;
  RxBool isCityValid = false.obs;
  RxBool isSubdistrictValid = false.obs;
  RxBool isVillageValid = false.obs;

  final CreateProjectUseCase _createProjectUseCase;
  final GetProvincesUseCase _getProvincesUseCase;
  final GetRegenciesUseCase _getRegenciesUseCase;
  final GetDistrictsUseCase _getDistrictsUseCase;
  final GetVillagesUseCase _getVillagesUseCase;

  LicensingLocationDetailsController(
    this._createProjectUseCase,
    this._getProvincesUseCase,
    this._getRegenciesUseCase,
    this._getDistrictsUseCase,
    this._getVillagesUseCase,
  );

  List<String> get provinceOptions =>
      provinces.map((province) => province.name).toList();

  List<String> get cityOptions =>
      regencies.map((regency) => regency.name).toList();

  List<String> get subdistrictOptions =>
      districts.map((district) => district.name).toList();

  List<String> get villageOptions =>
      villages.map((village) => village.name).toList();

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg is bool) {
      isPrototype = arg;
    }
    selectedLocation.value = _defaultLocation;
    provinceController.addListener(_validateProvince);
    cityController.addListener(_validateCity);
    subdistrictController.addListener(_validateSubdistrict);
    villageController.addListener(_validateVillage);
    _fetchProvinces();
  }

  Future<void> _fetchProvinces() async {
    await handleAsync<List<Province>>(
      () => _getProvincesUseCase(),
      onSuccess: provinces.assignAll,
      onFailure: showError,
    );
  }

  Future<void> _fetchRegencies(int provinceId) async {
    _resetCitySelection();
    await handleAsync<List<Regency>>(
      () => _getRegenciesUseCase(provinceId),
      onSuccess: regencies.assignAll,
      onFailure: showError,
    );
  }

  Future<void> _fetchDistricts(int regencyId) async {
    _resetSubdistrictSelection();
    await handleAsync<List<District>>(
      () => _getDistrictsUseCase(regencyId),
      onSuccess: districts.assignAll,
      onFailure: showError,
    );
  }

  Future<void> _fetchVillages(int districtId) async {
    _resetVillageSelection();
    await handleAsync<List<Village>>(
      () => _getVillagesUseCase(districtId),
      onSuccess: villages.assignAll,
      onFailure: showError,
    );
  }

  void _updateFormValidity() {
    _isFormValid.value =
        selectedLocation.value != null &&
        isProvinceValid.value &&
        isCityValid.value &&
        isSubdistrictValid.value &&
        isVillageValid.value;

    debugPrint('Form validity updated: $_isFormValid');
  }

  void _resetCitySelection() {
    selectedCity.value = null;
    cityController.clear();
    cityError.value = null;
    isCityValid.value = false;
    regencies.clear();
    _resetSubdistrictSelection();
    _updateFormValidity();
  }

  void _resetSubdistrictSelection() {
    selectedSubdistrict.value = null;
    subdistrictController.clear();
    subdistrictError.value = null;
    isSubdistrictValid.value = false;
    districts.clear();
    _resetVillageSelection();
    _updateFormValidity();
  }

  void _resetVillageSelection() {
    selectedVillage.value = null;
    villageController.clear();
    villageError.value = null;
    isVillageValid.value = false;
    villages.clear();
    _updateFormValidity();
  }

  void _validateProvince() {
    final value = provinceController.text.trim();
    final hasSelection = selectedProvince.value != null;
    provinceError.value = value.isEmpty || !hasSelection
        ? AppStrings.provinceRequired
        : null;
    isProvinceValid.value = value.isNotEmpty && hasSelection;
    _updateFormValidity();
  }

  void _validateCity() {
    final value = cityController.text.trim();
    final hasSelection = selectedCity.value != null;
    cityError.value = value.isEmpty || !hasSelection
        ? AppStrings.cityRequired
        : null;
    isCityValid.value = value.isNotEmpty && hasSelection;
    _updateFormValidity();
  }

  void _validateSubdistrict() {
    final value = subdistrictController.text.trim();
    final hasSelection = selectedSubdistrict.value != null;
    subdistrictError.value = value.isEmpty || !hasSelection
        ? AppStrings.subdistrictRequired
        : null;
    isSubdistrictValid.value = value.isNotEmpty && hasSelection;
    _updateFormValidity();
  }

  void _validateVillage() {
    final value = villageController.text.trim();
    final hasSelection = selectedVillage.value != null;
    villageError.value = value.isEmpty || !hasSelection
        ? AppStrings.villageRequired
        : null;
    isVillageValid.value = value.isNotEmpty && hasSelection;
    _updateFormValidity();
  }

  Province? _findProvinceByName(String value) {
    final query = value.trim().toLowerCase();
    return provinces.firstWhereOrNull(
      (province) => province.name.toLowerCase() == query,
    );
  }

  Regency? _findRegencyByName(String value) {
    final query = value.trim().toLowerCase();
    return regencies.firstWhereOrNull(
      (regency) => regency.name.toLowerCase() == query,
    );
  }

  District? _findDistrictByName(String value) {
    final query = value.trim().toLowerCase();
    return districts.firstWhereOrNull(
      (district) => district.name.toLowerCase() == query,
    );
  }

  Village? _findVillageByName(String value) {
    final query = value.trim().toLowerCase();
    return villages.firstWhereOrNull(
      (village) => village.name.toLowerCase() == query,
    );
  }

  void selectProvince(String? value) async {
    if (value == null || value.isEmpty) return;
    final province = _findProvinceByName(value);
    selectedProvince.value = province;
    provinceController.text = province?.name ?? value;
    _validateProvince();
    final provinceId = province?.id;
    if (provinceId != null) {
      await _fetchRegencies(provinceId);
    } else {
      _resetCitySelection();
    }
  }

  void selectCity(String? value) async {
    if (value == null || value.isEmpty) return;
    final regency = _findRegencyByName(value);
    selectedCity.value = regency;
    cityController.text = regency?.name ?? value;
    _validateCity();
    final regencyId = regency?.id;
    if (regencyId != null) {
      await _fetchDistricts(regencyId);
    } else {
      _resetSubdistrictSelection();
    }
  }

  void selectSubdistrict(String? value) async {
    if (value == null || value.isEmpty) return;
    final district = _findDistrictByName(value);
    selectedSubdistrict.value = district;
    subdistrictController.text = district?.name ?? value;
    _validateSubdistrict();
    final districtId = district?.id;
    if (districtId != null) {
      await _fetchVillages(districtId);
    } else {
      _resetVillageSelection();
    }
  }

  void selectVillage(String? value) {
    if (value == null || value.isEmpty) return;
    final village = _findVillageByName(value);
    selectedVillage.value = village;
    villageController.text = village?.name ?? value;
    _validateVillage();
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
      locationDetail:
          '${villageController.text}, ${subdistrictController.text}, ${cityController.text}, ${provinceController.text}',
      landArea: 1,
      income: 1,
      latitude: selectedLocation.value!.latitude,
      longitude: selectedLocation.value!.longitude,
      name: 'GENERATED-Hardcoded first',
      provinceId: selectedProvince.value?.id ?? 0,
      regencyId: selectedCity.value?.id ?? 0,
      districtId: selectedSubdistrict.value?.id ?? 0,
      villageId: selectedVillage.value?.id ?? 0,
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

  void _updateFormValid() {
    isFormValid.value =
        provinceController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        subdistrictController.text.isNotEmpty &&
        villageController.text.isNotEmpty;
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

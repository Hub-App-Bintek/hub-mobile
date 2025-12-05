import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';

class LocationSelectorController extends BaseController {
  // UseCases will be injected
  final GetProvincesUseCase _getProvincesUseCase;
  final GetRegenciesUseCase _getRegenciesUseCase;
  final GetDistrictsUseCase _getDistrictsUseCase;
  final GetVillagesUseCase _getVillagesUseCase;

  LocationSelectorController(
    this._getProvincesUseCase,
    this._getRegenciesUseCase,
    this._getDistrictsUseCase,
    this._getVillagesUseCase,
  );

  // --- STATE ---
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();

  final RxList<Province> provinces = <Province>[].obs;
  final RxList<Regency> regencies = <Regency>[].obs;
  final RxList<District> districts = <District>[].obs;
  final RxList<Village> villages = <Village>[].obs;

  // --- EXPOSED DATA for the parent to read ---
  final Rxn<Province> selectedProvince = Rxn<Province>();
  final Rxn<Regency> selectedCity = Rxn<Regency>();
  final Rxn<District> selectedSubdistrict = Rxn<District>();
  final Rxn<Village> selectedVillage = Rxn<Village>();
  final RxBool isLocationFormValid = false.obs;

  // --- GETTERS for dropdown options ---
  List<String> get provinceOptions => provinces.map((p) => p.name).toList();

  List<String> get cityOptions => regencies.map((r) => r.name).toList();

  List<String> get subdistrictOptions => districts.map((d) => d.name).toList();

  List<String> get villageOptions => villages.map((v) => v.name).toList();

  @override
  void onInit() {
    super.onInit();
    _fetchProvinces();
  }

  void _updateFormValidity() {
    isLocationFormValid.value =
        selectedProvince.value != null &&
        selectedCity.value != null &&
        selectedSubdistrict.value != null &&
        selectedVillage.value != null;
  }

  // --- API Calls ---
  Future<void> _fetchProvinces() async {
    await handleAsync(
      () => _getProvincesUseCase(),
      onSuccess: provinces.assignAll,
    );
  }

  Future<void> _fetchRegencies(int provinceId) async {
    _resetCitySelection();
    await handleAsync(
      () => _getRegenciesUseCase(provinceId),
      onSuccess: regencies.assignAll,
    );
  }

  Future<void> _fetchDistricts(int regencyId) async {
    _resetSubdistrictSelection();
    await handleAsync(
      () => _getDistrictsUseCase(regencyId),
      onSuccess: districts.assignAll,
    );
  }

  Future<void> _fetchVillages(int districtId) async {
    _resetVillageSelection();
    await handleAsync(
      () => _getVillagesUseCase(districtId),
      onSuccess: villages.assignAll,
    );
  }

  // --- SELECTION LOGIC ---
  void onProvinceSelected(String? value) async {
    if (value == null) return;
    final province = provinces.firstWhereOrNull(
      (p) => p.name.toLowerCase() == value.toLowerCase(),
    );
    selectedProvince.value = province;
    provinceController.text = province?.name ?? value;
    if (province?.id != null) {
      await _fetchRegencies(province!.id);
    }
    _updateFormValidity();
  }

  void onCitySelected(String? value) async {
    if (value == null) return;
    final regency = regencies.firstWhereOrNull(
      (r) => r.name.toLowerCase() == value.toLowerCase(),
    );
    selectedCity.value = regency;
    cityController.text = regency?.name ?? value;
    if (regency?.id != null) {
      await _fetchDistricts(regency!.id);
    }
    _updateFormValidity();
  }

  void onSubdistrictSelected(String? value) async {
    if (value == null) return;
    final district = districts.firstWhereOrNull(
      (d) => d.name.toLowerCase() == value.toLowerCase(),
    );
    selectedSubdistrict.value = district;
    subdistrictController.text = district?.name ?? value;
    if (district?.id != null) {
      await _fetchVillages(district!.id);
    }
    _updateFormValidity();
  }

  void onVillageSelected(String? value) {
    if (value == null) return;
    final village = villages.firstWhereOrNull(
      (v) => v.name.toLowerCase() == value.toLowerCase(),
    );
    selectedVillage.value = village;
    villageController.text = village?.name ?? value;
    _updateFormValidity();
  }

  // --- RESET LOGIC ---
  void _resetCitySelection() {
    selectedCity.value = null;
    cityController.clear();
    regencies.clear();
    _resetSubdistrictSelection();
  }

  void _resetSubdistrictSelection() {
    selectedSubdistrict.value = null;
    subdistrictController.clear();
    districts.clear();
    _resetVillageSelection();
  }

  void _resetVillageSelection() {
    selectedVillage.value = null;
    villageController.clear();
    villages.clear();
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

import 'dart:io';
import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:pkp_hub/data/models/project_type.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';

import '../../../core/base/base_controller.dart';

class MonitoringFormController extends BaseController {
  // Form key
  final formKey = GlobalKey<FormState>();

  final CreateProjectUseCase _createProjectUseCase;
  final GetProvincesUseCase _getProvincesUseCase;
  final GetRegenciesUseCase _getRegenciesUseCase;
  final GetDistrictsUseCase _getDistrictsUseCase;
  final GetVillagesUseCase _getVillagesUseCase;
  final String? _initialProjectTypeId;

  MonitoringFormController(
    this._createProjectUseCase,
    this._getProvincesUseCase,
    this._getRegenciesUseCase,
    this._getDistrictsUseCase,
    this._getVillagesUseCase,
    this._initialProjectTypeId,
  );

  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController locationDetailsController =
      TextEditingController();
  final TextEditingController landAreaController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController incomeProofController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  RxBool isLoadingLocation = true.obs;
  RxBool isLocationError = false.obs;
  RxnString locationErrorMessage = RxnString();
  RxBool isProvinceValid = false.obs;
  RxBool isCityValid = false.obs;
  RxBool isSubdistrictValid = false.obs;
  RxBool isVillageValid = false.obs;
  RxBool isLocationDetailsValid = false.obs;
  RxBool isLandAreaValid = true.obs;
  RxBool isIncomeValid = true.obs;
  RxnString incomeProofPath = RxnString();

  Rxn<LatLng> selectedLocation = Rxn<LatLng>();
  RxnString provinceError = RxnString();
  RxnString cityError = RxnString();
  RxnString subdistrictError = RxnString();
  RxnString villageError = RxnString();
  RxnString locationDetailsError = RxnString();
  RxnString landAreaError = RxnString();
  RxnString incomeError = RxnString();

  Rxn<ProjectType> selectedProjectType = Rxn<ProjectType>(nonPrototype);

  final isPickingFile = false.obs;

  final RxBool _isFormValid = false.obs;

  bool get isFormValid => _isFormValid.value;

  RxBool isRequesting = false.obs;
  final RxList<Province> provinces = <Province>[].obs;
  final RxList<Regency> regencies = <Regency>[].obs;
  final RxList<District> districts = <District>[].obs;
  final RxList<Village> villages = <Village>[].obs;

  Rxn<Province> selectedProvince = Rxn<Province>();
  Rxn<Regency> selectedCity = Rxn<Regency>();
  Rxn<District> selectedSubdistrict = Rxn<District>();
  Rxn<Village> selectedVillage = Rxn<Village>();

  List<String> get provinceOptions =>
      provinces.map((province) => province.name).toList();

  List<String> get cityOptions =>
      regencies.map((regency) => regency.name).toList();

  List<String> get subdistrictOptions =>
      districts.map((district) => district.name).toList();

  List<String> get villageOptions =>
      villages.map((village) => village.name).toList();

  LatLng get mapTarget => selectedLocation.value ?? _defaultLocation;

  // Debounce timer for map position updates
  Timer? _positionUpdateTimer;
  static const Duration _positionUpdateDebounce = Duration(milliseconds: 500);

  // Location fetch timeout
  static const Duration _locationFetchTimeout = Duration(seconds: 15);

  // Default location fallback (Jakarta center as default)
  static const LatLng _defaultLocation = LatLng(-6.2088, 106.8456);
  GoogleMapController? _mapController;

  @override
  void onInit() {
    super.onInit();
    _getUserLocation();
    _hydrateInitialType();
    _fetchProvinces();
    provinceController.addListener(_validateProvince);
    cityController.addListener(_validateCity);
    subdistrictController.addListener(_validateSubdistrict);
    villageController.addListener(_validateVillage);
    locationDetailsController.addListener(_validateLocationDetails);
    incomeController.addListener(_validateIncome);
    landAreaController.text = '0';
    incomeController.text = '';
  }

  void _hydrateInitialType() {
    if (_initialProjectTypeId == null || _initialProjectTypeId.isEmpty) {
      return;
    }
    final match = projectTypeList.firstWhere(
      (type) => type.id.toUpperCase() == _initialProjectTypeId.toUpperCase(),
      orElse: () => prototype,
    );
    selectedProjectType.value = match;
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

  Future<File?> pickIncomeProof() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: const ['pdf'],
      );
      if (result != null && result.files.isNotEmpty) {
        final path = result.files.single.path;
        if (path != null) {
          final file = File(path);
          incomeProofPath.value = path;
          Get.snackbar(
            'Berhasil',
            'Bukti pendapatan berhasil dipilih',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
          return file;
        }
      }
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Tidak dapat memilih bukti pendapatan',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
        colorText: AppColors.white,
      );
    }
    return null;
  }

  void onIncomeProofPicked(String path) {
    incomeProofPath.value = path;
    incomeProofController.text = path.split(Platform.pathSeparator).last;
    Get.snackbar(
      'Berhasil',
      'Bukti pendapatan berhasil dipilih',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.successDark,
      colorText: AppColors.white,
    );
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

  void _validateLocationDetails() {
    final value = locationDetailsController.text.trim();
    locationDetailsError.value = value.isEmpty
        ? AppStrings.locationDetailsRequired
        : null;
    isLocationDetailsValid.value = value.isNotEmpty;

    _updateFormValidity();
  }

  void _validateIncome() {
    final value = incomeController.text.trim();
    incomeError.value = value.isEmpty ? AppStrings.incomeRequired : null;
    isIncomeValid.value = value.isNotEmpty;
    _updateFormValidity();
  }

  void _updateFormValidity() {
    _isFormValid.value =
        selectedLocation.value != null &&
        isProvinceValid.value &&
        isCityValid.value &&
        isSubdistrictValid.value &&
        isVillageValid.value &&
        isLocationDetailsValid.value &&
        isIncomeValid.value &&
        selectedProjectType.value != null &&
        !isLoadingLocation.value;

    debugPrint('Form validity updated: $_isFormValid');
  }

  @override
  void onClose() {
    provinceController.dispose();
    cityController.dispose();
    subdistrictController.dispose();
    villageController.dispose();
    locationDetailsController.dispose();
    landAreaController.dispose();
    incomeController.dispose();
    incomeProofController.dispose();
    searchController.dispose();
    searchFocusNode.dispose();
    _positionUpdateTimer?.cancel();
    super.onClose();
  }

  String get googleApiKey => Environment.instance.apiKey;

  Future<void> _getUserLocation() async {
    isLoadingLocation.value = true;
    isLocationError.value = false;
    locationErrorMessage.value = null;

    try {
      final status = await Permission.location.status;

      if (status.isGranted) {
        await _fetchLocation();
      } else if (status.isDenied) {
        final result = await Permission.location.request();
        if (result.isGranted) {
          await _fetchLocation();
        } else {
          // Permission denied, use fallback
          _setFallbackLocation(
            'Izin lokasi ditolak. Menggunakan lokasi default.',
          );
        }
      } else if (status.isPermanentlyDenied) {
        // Permission permanently denied
        _setFallbackLocation(
          'Izin lokasi dinonaktifkan. Silakan aktifkan di pengaturan aplikasi.',
        );
      }
    } catch (e) {
      // General error, use fallback
      _setFallbackLocation('Gagal memperoleh lokasi: ${e.toString()}');
    } finally {
      isLoadingLocation.value = false;
    }
  }

  Future<void> _fetchLocation() async {
    try {
      final position =
          await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            timeLimit: _locationFetchTimeout,
          ).timeout(
            _locationFetchTimeout,
            onTimeout: () {
              throw TimeoutException(
                'Location fetch timed out after ${_locationFetchTimeout.inSeconds}s',
              );
            },
          );

      selectedLocation.value = LatLng(position.latitude, position.longitude);
      _updateFormValidity();
    } on TimeoutException catch (e) {
      debugPrint('Location timeout: $e');
      _setFallbackLocation(
        'Lokasi GPS tidak responsif. Menggunakan lokasi default.',
      );
    } on LocationServiceDisabledException catch (e) {
      debugPrint('Location service disabled: $e');
      _setFallbackLocation(
        'Layanan lokasi dinonaktifkan. Menggunakan lokasi default.',
      );
    } catch (e) {
      debugPrint('Location fetch error: $e');
      _setFallbackLocation('Gagal mendapatkan lokasi: ${e.toString()}');
    }
  }

  void _setFallbackLocation(String errorMessage) {
    selectedLocation.value = _defaultLocation;
    isLocationError.value = true;
    locationErrorMessage.value = errorMessage;
    _updateFormValidity();

    // Show error notification to user
    Get.snackbar(
      'Perhatian Lokasi',
      errorMessage,
      duration: const Duration(seconds: 4),
    );

    debugPrint(
      'Fallback location set: ${_defaultLocation.latitude}, ${_defaultLocation.longitude}',
    );
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> _animateTo(LatLng target) async {
    try {
      await _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: target, zoom: 16),
        ),
      );
    } catch (e) {
      debugPrint('Failed to animate map: $e');
    }
  }

  void updatePosition(LatLng location) {
    // Don't update position while location is still loading to prevent state issues
    if (isLoadingLocation.value) {
      return;
    }

    // Cancel previous timer to debounce rapid updates
    _positionUpdateTimer?.cancel();

    // Debounce position updates to prevent excessive state changes
    _positionUpdateTimer = Timer(_positionUpdateDebounce, () {
      selectedLocation.value = location;
      _updateFormValidity();
    });
  }

  Future<void> onPlaceSelected(Prediction prediction) async {
    final lat = double.tryParse(prediction.lat ?? '');
    final lng = double.tryParse(prediction.lng ?? '');
    if (lat == null || lng == null) {
      Get.snackbar(
        AppStrings.unableToFetchLocation,
        'Koordinat lokasi tidak ditemukan.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.errorDark,
        colorText: AppColors.white,
      );
      return;
    }

    final target = LatLng(lat, lng);
    selectedLocation.value = target;
    isLoadingLocation.value = false;
    await _animateTo(target);
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

  void updateProjectType(ProjectType? value) {
    selectedProjectType.value = value;
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

  Future<void> createProject() async {
    if (!isFormValid) {
      _validateProvince();
      _validateCity();
      _validateSubdistrict();
      _validateVillage();
      _validateLocationDetails();
      _validateIncome();
      return;
    }

    final landArea = double.tryParse(landAreaController.text.trim()) ?? 0.0;
    final income =
        double.tryParse(incomeController.text.trim().replaceAll('.', '')) ??
        0.0;

    final combinedLocationDetail = [
      locationDetailsController.text.trim(),
      villageController.text.trim(),
      subdistrictController.text.trim(),
      cityController.text.trim(),
      provinceController.text.trim(),
    ].where((value) => value.isNotEmpty).join(', ');

    isRequesting.value = true;
    CreateProjectResponse? createdProject;
    try {
      await handleAsync(
        () => _createProjectUseCase(
          CreateProjectParams(
            request: CreateProjectRequest(
              locationDetail: combinedLocationDetail,
              landArea: landArea,
              income: income,
              latitude: selectedLocation.value?.latitude ?? 0.0,
              longitude: selectedLocation.value?.longitude ?? 0.0,
              type: selectedProjectType.value?.id ?? '',
              name: 'GENERATED-Hardcoded first',
              provinceId: selectedProvince.value?.id ?? 0,
              regencyId: selectedCity.value?.id ?? 0,
              districtId: selectedSubdistrict.value?.id ?? 0,
              villageId: selectedVillage.value?.id ?? 0,
            ),
          ),
        ),
        onSuccess: (response) {
          createdProject = response;
          Get.toNamed(AppRoutes.monitoringSupervisor);
        },
        onFailure: (Failure failure) {
          showError(failure);
        },
      );
    } finally {
      isRequesting.value = false;
    }
  }
}

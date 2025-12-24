import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/enums/consultation_filter_status.dart';
import 'package:pkp_hub/core/enums/consultation_type.dart';
import 'package:pkp_hub/core/enums/project_type.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/domain/usecases/consultation/create_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';

class LocationDetailsController extends BaseController {
  final CreateProjectUseCase _createProjectUseCase;
  final CreateConsultationUseCase _createConsultationUseCase;
  final GetProvincesUseCase _getProvincesUseCase;
  final GetRegenciesUseCase _getRegenciesUseCase;
  final GetDistrictsUseCase _getDistrictsUseCase;
  final GetVillagesUseCase _getVillagesUseCase;

  LocationDetailsController(
    this._createProjectUseCase,
    this._createConsultationUseCase,
    this._getProvincesUseCase,
    this._getRegenciesUseCase,
    this._getDistrictsUseCase,
    this._getVillagesUseCase,
  );

  String? _consultantId;
  bool? _isPaidConsultation = false;
  String? _initialProjectTypeId;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController locationDetailsController =
      TextEditingController();
  final TextEditingController landAreaController = TextEditingController();
  final TextEditingController buildingAreaController = TextEditingController();
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
  RxBool isLandAreaValid = false.obs;
  RxBool isBuildingAreaValid = false.obs;
  RxBool isIncomeValid = true.obs;
  RxBool isIncomeProofValid = false.obs;
  RxnString incomeProofPath = RxnString();

  Rxn<LatLng> selectedLocation = Rxn<LatLng>();
  RxnString provinceError = RxnString();
  RxnString cityError = RxnString();
  RxnString subdistrictError = RxnString();
  RxnString villageError = RxnString();
  RxnString locationDetailsError = RxnString();
  RxnString landAreaError = RxnString();
  RxnString buildingAreaError = RxnString();
  RxnString incomeError = RxnString();
  RxnString incomeProofError = RxnString();

  Rxn<ProjectType> selectedProjectType = Rxn<ProjectType>(consultation);

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
    _hydrateArgs();
    _getUserLocation();
    _hydrateInitialType();
    _fetchProvinces();
    provinceController.addListener(_validateProvince);
    cityController.addListener(_validateCity);
    subdistrictController.addListener(_validateSubdistrict);
    villageController.addListener(_validateVillage);
    locationDetailsController.addListener(_validateLocationDetails);
    incomeController.addListener(_validateIncome);
    landAreaController.addListener(_validateLandArea);
    buildingAreaController.addListener(_validateBuildingArea);
    incomeProofController.addListener(_validateIncomeProof);
    incomeController.addListener(_validateIncome);
  }

  void _hydrateArgs() {
    final rawArgs = Get.arguments;
    if (rawArgs is LocationDetailsArgs) {
      _consultantId = rawArgs.consultantId;
      _isPaidConsultation = rawArgs.isPaidConsultation;
      _initialProjectTypeId = rawArgs.type;
      return;
    }
    if (rawArgs is Map<String, dynamic>) {
      _consultantId = rawArgs['consultantId'] as String?;
      _isPaidConsultation = rawArgs['isPaidConsultation'] as bool?;
      _initialProjectTypeId = rawArgs['type'] as String?;
    }
  }

  void _hydrateInitialType() {
    if (_initialProjectTypeId == null ||
        _initialProjectTypeId?.isEmpty == true) {
      return;
    }
    final match = projectTypes.firstWhere(
      (type) => type.name == _initialProjectTypeId,
      orElse: () => consultation,
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

  void onIncomeProofPicked(String path) {
    incomeProofPath.value = path;
    incomeProofController.text = path.split(Platform.pathSeparator).last;
    _validateIncomeProof();
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

  void _validateIncomeProof() {
    final value = incomeProofController.text.trim();
    final hasPath = (incomeProofPath.value ?? '').isNotEmpty;
    incomeProofError.value = value.isEmpty && !hasPath
        ? AppStrings.incomeProofLabel
        : null;
    isIncomeProofValid.value = value.isNotEmpty || hasPath;
    _updateFormValidity();
  }

  void _validateLandArea() {
    final value = landAreaController.text.trim();
    if (value.isEmpty) {
      landAreaError.value = AppStrings.landAreaRequired;
      isLandAreaValid.value = false;
    } else {
      final parsed = double.tryParse(value.replaceAll('.', ''));
      final valid = parsed != null && parsed > 0;
      landAreaError.value = valid ? null : AppStrings.landAreaRequired;
      isLandAreaValid.value = valid;
    }
    _updateFormValidity();
  }

  void _validateBuildingArea() {
    final value = buildingAreaController.text.trim();
    if (value.isEmpty) {
      buildingAreaError.value = 'Luas bangunan wajib diisi';
      isBuildingAreaValid.value = false;
    } else {
      final parsed = double.tryParse(value.replaceAll('.', ''));
      final valid = parsed != null && parsed > 0;
      buildingAreaError.value = valid ? null : 'Luas bangunan wajib diisi';
      isBuildingAreaValid.value = valid;
    }
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
        isLandAreaValid.value &&
        isBuildingAreaValid.value &&
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
    buildingAreaController.dispose();
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

    Get.snackbar(
      'Perhatian Lokasi',
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.errorDark,
      colorText: AppColors.white,
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
    if (isLoadingLocation.value) {
      return;
    }

    _positionUpdateTimer?.cancel();
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

  bool get _shouldCreateConsultation =>
      _consultantId != null && _consultantId?.isNotEmpty == true;

  Future<void> createProject() async {
    if (!isFormValid) {
      _validateProvince();
      _validateCity();
      _validateSubdistrict();
      _validateVillage();
      _validateLocationDetails();
      _validateLandArea();
      _validateBuildingArea();
      _validateIncome();
      _validateIncomeProof();
      return;
    }

    final landArea =
        double.tryParse(landAreaController.text.trim().replaceAll('.', '')) ??
        0.0;
    final buildingArea =
        double.tryParse(
          buildingAreaController.text.trim().replaceAll('.', ''),
        ) ??
        0.0;
    if (_isPaidConsultation != null) {
      if (_isPaidConsultation == true && buildingArea < 37) {
        Get.snackbar(
          'Gagal',
          'Konsultasi gratis hanya untuk luas bangunan kurang dari 36 meter persegi',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.errorDark,
          colorText: AppColors.white,
        );
        return;
      }
    }
    final income =
        double.tryParse(incomeController.text.trim().replaceAll('.', '')) ??
        0.0;
    final projectName = locationDetailsController.text.trim();
    final incomeProofFile = (incomeProofPath.value ?? '').isNotEmpty
        ? File(incomeProofPath.value!)
        : null;

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
              buildingArea: buildingArea,
              income: income,
              latitude: selectedLocation.value?.latitude ?? 0.0,
              longitude: selectedLocation.value?.longitude ?? 0.0,
              type: 'NON_PROTOTYPE',
              name: projectName.isNotEmpty ? projectName : 'Project',
              provinceId: selectedProvince.value?.id.toString() ?? '',
              regencyId: selectedCity.value?.id.toString() ?? '',
              districtId: selectedSubdistrict.value?.id.toString() ?? '',
              villageId: selectedVillage.value?.id.toString() ?? '',
            ),
            incomeProofFile: incomeProofFile,
          ),
        ),
        onSuccess: (response) {
          createdProject = response;
        },
        onFailure: (Failure failure) {
          showError(failure);
        },
      );

      if (createdProject != null) {
        if (_shouldCreateConsultation) {
          await _createConsultationForProject(createdProject!.projectId);
        } else {
          _navigateToConsultants(createdProject!.projectId);
        }
      }
    } finally {
      isRequesting.value = false;
    }
  }

  void _navigateToConsultants(String projectId) {
    final coordinates = selectedLocation.value;
    navigateOff(
      AppRoutes.consultants,
      arguments: ConsultantsArgs(
        projectId: projectId,
        lat: coordinates?.latitude ?? 0.0,
        long: coordinates?.longitude ?? 0.0,
        type: selectedProjectType.value?.name ?? consultation.name,
        isPaidConsultation:
            _isPaidConsultation == true ||
            (int.tryParse(buildingAreaController.text.trim()) ?? 0) > 36,
      ),
    );
  }

  Future<void> _createConsultationForProject(String projectId) async {
    final consultantId = int.tryParse(_consultantId ?? '');
    if (consultantId == null) {
      showError(const ServerFailure(message: 'Invalid consultation id.'));
      _navigateToConsultants(projectId);
      return;
    }

    await handleAsync<CreateConsultationResponse>(
      () => _createConsultationUseCase(
        CreateConsultationRequest(
          consultantId: consultantId,
          projectId: projectId,
          consultationType: _isPaidConsultation == true
              ? consultationPaid.name
              : consultationFree.name,
          channel: 'CHAT',
        ),
      ),
      onSuccess: (response) {
        const mainArgs = MainNavigationArgs(
          selectedIndex: 1,
          consultationStatus: consultationFilterWaitingConfirmation,
        );
        Get.offAllNamed(AppRoutes.main, arguments: mainArgs);
      },
      onFailure: (failure) {
        showError(failure);
      },
    );
  }
}

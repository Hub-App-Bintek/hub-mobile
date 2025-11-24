import 'dart:async';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/config/environment.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/project_type.dart';
import 'package:pkp_hub/data/models/request/create_consultation_request.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/data/models/response/create_consultation_response.dart';
import 'package:pkp_hub/data/models/response/create_project_response.dart';
import 'package:pkp_hub/domain/usecases/consultation/create_consultation_use_case.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';

class LocationDetailsController extends BaseController {
  final CreateProjectUseCase _createProjectUseCase;
  final CreateConsultationUseCase _createConsultationUseCase;
  final String? _consultantId;
  final bool _isPaidConsultation;
  final String? _initialProjectTypeId;

  LocationDetailsController(
    this._createProjectUseCase,
    this._createConsultationUseCase,
    this._consultantId,
    this._isPaidConsultation,
    this._initialProjectTypeId,
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController locationDetailsController =
      TextEditingController();
  final TextEditingController landAreaController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  RxBool isLoadingLocation = true.obs;
  RxBool isLocationError = false.obs;
  RxnString locationErrorMessage = RxnString();
  RxBool isProjectNameValid = true.obs;
  RxBool isProvinceValid = false.obs;
  RxBool isCityValid = false.obs;
  RxBool isSubdistrictValid = false.obs;
  RxBool isVillageValid = false.obs;
  RxBool isLocationDetailsValid = false.obs;
  RxBool isLandAreaValid = true.obs;
  RxBool isIncomeValid = true.obs;
  RxnString incomeProofPath = RxnString();

  Rxn<LatLng> selectedLocation = Rxn<LatLng>();
  RxnString projectNameError = RxnString();
  RxnString provinceError = RxnString();
  RxnString cityError = RxnString();
  RxnString subdistrictError = RxnString();
  RxnString villageError = RxnString();
  RxnString locationDetailsError = RxnString();
  RxnString landAreaError = RxnString();
  RxnString incomeError = RxnString();

  Rxn<ProjectType> selectedProjectType = Rxn<ProjectType>(prototype);

  final RxBool _isFormValid = false.obs;

  bool get isFormValid => _isFormValid.value;

  RxBool isRequesting = false.obs;
  final List<String> provinceOptions = const [
    'DKI Jakarta',
    'Jawa Barat',
    'Jawa Tengah',
    'Jawa Timur',
  ];
  final List<String> cityOptions = const [
    'Jakarta Selatan',
    'Jakarta Barat',
    'Jakarta Timur',
    'Jakarta Utara',
  ];
  final List<String> subdistrictOptions = const [
    'Kebayoran Baru',
    'Kebayoran Lama',
    'Menteng',
    'Cilandak',
  ];
  final List<String> villageOptions = const [
    'Gandaria Utara',
    'Senayan',
    'Pulo',
    'Kemang',
  ];
  RxnString selectedProvince = RxnString();
  RxnString selectedCity = RxnString();
  RxnString selectedSubdistrict = RxnString();
  RxnString selectedVillage = RxnString();

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
    provinceController.addListener(_validateProvince);
    cityController.addListener(_validateCity);
    subdistrictController.addListener(_validateSubdistrict);
    villageController.addListener(_validateVillage);
    locationDetailsController.addListener(_validateLocationDetails);
    projectNameController.text = 'Proyek Baru';
    landAreaController.text = '0';
    incomeController.text = '0';
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

  Future<void> pickIncomeProof() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: const ['pdf'],
      );
      if (result != null && result.files.isNotEmpty) {
        final path = result.files.single.path;
        if (path != null) {
          incomeProofPath.value = path;
          Get.snackbar(
            'Berhasil',
            'Bukti pendapatan berhasil dipilih',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColors.successDark,
            colorText: AppColors.white,
          );
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
  }

  void _validateProjectName() {
    projectNameError.value = null;
    isProjectNameValid.value = true;

    _updateFormValidity();
  }

  void searchLocationByLatLng(String input) {
    final parts = input.split(',');
    if (parts.length != 2) {
      _showSnack('Format tidak valid', 'Gunakan format: -6.2,106.8');
      return;
    }
    final lat = double.tryParse(parts[0].trim());
    final lng = double.tryParse(parts[1].trim());
    if (lat == null || lng == null) {
      _showSnack('Format tidak valid', 'Gunakan format: -6.2,106.8');
      return;
    }
    final target = LatLng(lat, lng);
    selectedLocation.value = target;
    updatePosition(target);
  }

  void _showSnack(String title, String message) {
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }

  void _validateProvince() {
    final value = provinceController.text.trim();
    provinceError.value = value.isEmpty ? AppStrings.provinceRequired : null;
    isProvinceValid.value = value.isNotEmpty;
    _updateFormValidity();
  }

  void _validateCity() {
    final value = cityController.text.trim();
    cityError.value = value.isEmpty ? AppStrings.cityRequired : null;
    isCityValid.value = value.isNotEmpty;
    _updateFormValidity();
  }

  void _validateSubdistrict() {
    final value = subdistrictController.text.trim();
    subdistrictError.value = value.isEmpty
        ? AppStrings.subdistrictRequired
        : null;
    isSubdistrictValid.value = value.isNotEmpty;
    _updateFormValidity();
  }

  void _validateVillage() {
    final value = villageController.text.trim();
    villageError.value = value.isEmpty ? AppStrings.villageRequired : null;
    isVillageValid.value = value.isNotEmpty;
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

  void _validateLandArea() {
    landAreaError.value = null;
    isLandAreaValid.value = true;

    _updateFormValidity();
  }

  void _validateIncome() {
    incomeError.value = null;
    isIncomeValid.value = true;
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
        selectedProjectType.value != null &&
        !isLoadingLocation.value;

    debugPrint('Form validity updated: $_isFormValid');
  }

  @override
  void onClose() {
    projectNameController.dispose();
    provinceController.dispose();
    cityController.dispose();
    subdistrictController.dispose();
    villageController.dispose();
    locationDetailsController.dispose();
    landAreaController.dispose();
    incomeController.dispose();
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
      _showSnack(
        AppStrings.unableToFetchLocation,
        'Koordinat lokasi tidak ditemukan.',
      );
      return;
    }

    final target = LatLng(lat, lng);
    selectedLocation.value = target;
    isLoadingLocation.value = false;
    await _animateTo(target);
    _updateFormValidity();
  }

  void updateProjectType(ProjectType? value) {
    selectedProjectType.value = value;
  }

  void selectProvince(String? value) {
    if (value == null || value.isEmpty) return;
    selectedProvince.value = value;
    provinceController.text = value;
    _validateProvince();
  }

  void selectCity(String? value) {
    if (value == null || value.isEmpty) return;
    selectedCity.value = value;
    cityController.text = value;
    _validateCity();
  }

  void selectSubdistrict(String? value) {
    if (value == null || value.isEmpty) return;
    selectedSubdistrict.value = value;
    subdistrictController.text = value;
    _validateSubdistrict();
  }

  void selectVillage(String? value) {
    if (value == null || value.isEmpty) return;
    selectedVillage.value = value;
    villageController.text = value;
    _validateVillage();
  }

  bool get _shouldCreateConsultation =>
      _consultantId != null && _consultantId.isNotEmpty;

  Future<void> createProject() async {
    if (!isFormValid) {
      _validateProvince();
      _validateCity();
      _validateSubdistrict();
      _validateVillage();
      _validateLocationDetails();
      return;
    }

    final projectName = projectNameController.text.trim().isNotEmpty
        ? projectNameController.text.trim()
        : 'Proyek Baru';
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
              name: projectName,
              locationDetail: combinedLocationDetail,
              landArea: landArea,
              income: income,
              latitude: selectedLocation.value?.latitude ?? 0.0,
              longitude: selectedLocation.value?.longitude ?? 0.0,
              type: selectedProjectType.value?.id ?? '',
            ),
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
    navigateOff(AppRoutes.consultation);
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
          consultationType: _isPaidConsultation ? 'BERBAYAR' : 'GRATIS',
          channel: 'CHAT',
        ),
      ),
      onSuccess: (response) {
        navigateAndClearUntil(
          AppRoutes.projectHistory,
          untilRoute: AppRoutes.main,
          arguments: {
            'projectId': projectId,
            'homeOwnerId': response.homeOwnerId,
            'homeOwnerName': response.homeOwnerName,
            'consultantId':
                response.consultantId ?? int.tryParse(_consultantId ?? ''),
            'consultantName': response.consultantName,
          },
        );
      },
      onFailure: (failure) {
        showError(failure);
      },
    );
  }
}

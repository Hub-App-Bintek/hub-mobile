import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
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
  final Rxn<File> incomeProofFile = Rxn<File>();
  final RxnString incomeProofFileName = RxnString();

  RxBool isLoadingLocation = true.obs;
  RxBool isLocationError = false.obs;
  RxnString locationErrorMessage = RxnString();
  RxBool isProjectNameValid = false.obs;
  RxBool isProvinceValid = false.obs;
  RxBool isCityValid = false.obs;
  RxBool isSubdistrictValid = false.obs;
  RxBool isVillageValid = false.obs;
  RxBool isLocationDetailsValid = false.obs;
  RxBool isLandAreaValid = false.obs;
  RxBool isIncomeValid = false.obs;

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

  @override
  void onInit() {
    super.onInit();
    _getUserLocation();
    _hydrateInitialType();
    projectNameController.addListener(_validateProjectName);
    provinceController.addListener(_validateProvince);
    cityController.addListener(_validateCity);
    subdistrictController.addListener(_validateSubdistrict);
    villageController.addListener(_validateVillage);
    locationDetailsController.addListener(_validateLocationDetails);
    landAreaController.addListener(_validateLandArea);
    incomeController.addListener(_validateIncome);
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

  void _validateProjectName() {
    final value = projectNameController.text.trim();
    projectNameError.value = value.isEmpty
        ? AppStrings.projectNameRequired
        : null;
    isProjectNameValid.value = value.isNotEmpty;

    _updateFormValidity();
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
    final value = landAreaController.text.trim();
    landAreaError.value = value.isEmpty ? AppStrings.landAreaRequired : null;
    isLandAreaValid.value = value.isNotEmpty;

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
        isProjectNameValid.value &&
        isProvinceValid.value &&
        isCityValid.value &&
        isSubdistrictValid.value &&
        isVillageValid.value &&
        isLocationDetailsValid.value &&
        selectedProjectType.value != null &&
        isLandAreaValid.value &&
        isIncomeValid.value &&
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
    incomeController.removeListener(_validateIncome);
    incomeController.dispose();
    incomeProofFile.value = null;
    incomeProofFileName.value = null;
    _positionUpdateTimer?.cancel();
    super.onClose();
  }

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

  void onIncomeProofSelected(File file) {
    incomeProofFile.value = file;
    incomeProofFileName.value = file.uri.pathSegments.isNotEmpty
        ? file.uri.pathSegments.last
        : '';
  }

  Future<void> pickIncomeProof() async {
    final picked = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
    );
    final path = picked?.files.single.path;
    if (path == null) return;
    onIncomeProofSelected(File(path));
  }

  bool get _shouldCreateConsultation =>
      _consultantId != null && _consultantId.isNotEmpty;

  Future<void> createProject() async {
    if (!isFormValid) {
      _validateProjectName();
      _validateProvince();
      _validateCity();
      _validateSubdistrict();
      _validateVillage();
      _validateLocationDetails();
      _validateLandArea();
      return;
    }

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
              name: projectNameController.text.trim(),
              locationDetail: combinedLocationDetail,
              landArea: double.tryParse(landAreaController.text.trim()) ?? 0.0,
              income:
                  double.tryParse(
                    incomeController.text.trim().replaceAll('.', ''),
                  ) ??
                  0.0,
              latitude: selectedLocation.value?.latitude ?? 0.0,
              longitude: selectedLocation.value?.longitude ?? 0.0,
              type: selectedProjectType.value?.id ?? '',
            ),
            incomeProofFile: incomeProofFile.value,
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
          AppRoutes.projectDetails,
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

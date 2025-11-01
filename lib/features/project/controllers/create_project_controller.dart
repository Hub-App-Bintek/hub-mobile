import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/constants/app_strings.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/data/models/project_type.dart';
import 'package:pkp_hub/data/models/request/create_project_request.dart';
import 'package:pkp_hub/domain/usecases/project/create_project_use_case.dart';

class CreateProjectController extends BaseController {
  final CreateProjectUseCase _createProjectUseCase;

  CreateProjectController(this._createProjectUseCase);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController locationDetailsController =
      TextEditingController();
  final TextEditingController landAreaController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();

  RxBool isLoadingLocation = true.obs;
  RxBool isLocationError = false.obs;
  RxnString locationErrorMessage = RxnString();
  RxBool isProjectNameValid = false.obs;
  RxBool isLocationDetailsValid = false.obs;
  RxBool isLandAreaValid = false.obs;

  Rxn<LatLng> selectedLocation = Rxn<LatLng>();
  RxnString projectNameError = RxnString();
  RxnString locationDetailsError = RxnString();
  RxnString landAreaError = RxnString();

  Rxn<ProjectType> selectedProjectType = Rxn<ProjectType>(prototype);

  final RxBool _isFormValid = false.obs;

  bool get isFormValid => _isFormValid.value;

  RxBool isRequesting = false.obs;

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
    projectNameController.addListener(_validateProjectName);
    locationDetailsController.addListener(_validateLocationDetails);
    landAreaController.addListener(_validateLandArea);
  }

  void _validateProjectName() {
    final value = projectNameController.text.trim();
    projectNameError.value = value.isEmpty
        ? AppStrings.projectNameRequired
        : null;
    isProjectNameValid.value = value.isNotEmpty;

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

  void _updateFormValidity() {
    _isFormValid.value =
        selectedLocation.value != null &&
        isProjectNameValid.value &&
        isLocationDetailsValid.value &&
        selectedProjectType.value != null &&
        isLandAreaValid.value &&
        !isLoadingLocation.value;

    debugPrint('Form validity updated: $_isFormValid');
  }

  @override
  void onClose() {
    projectNameController.dispose();
    locationDetailsController.dispose();
    landAreaController.dispose();
    incomeController.dispose();
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

  Future<void> createProject() async {
    if (!isFormValid) {
      _validateProjectName();
      _validateLocationDetails();
      _validateLandArea();
      return;
    }

    isRequesting.value = true;
    try {
      await handleAsync(
        () => _createProjectUseCase(
          CreateProjectRequest(
            name: projectNameController.text.trim(),
            locationDetail: locationDetailsController.text.trim(),
            landArea: double.tryParse(landAreaController.text.trim()) ?? 0.0,
            income: double.tryParse(incomeController.text.trim()) ?? 0.0,
            latitude: selectedLocation.value?.latitude ?? 0.0,
            longitude: selectedLocation.value?.longitude ?? 0.0,
            type: selectedProjectType.value?.id ?? '',
          ),
        ),
        onSuccess: (response) {
          navigateOff(
            AppRoutes.consultants,
            arguments: {
              'projectId': response.projectId,
              'lat': selectedLocation.value?.latitude ?? 0.0,
              'long': selectedLocation.value?.longitude ?? 0.0,
              'type': selectedProjectType.value?.id ?? '',
            },
          );
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

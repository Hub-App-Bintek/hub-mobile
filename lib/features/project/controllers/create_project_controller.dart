import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
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
        isLandAreaValid.value;

    debugPrint('Form validity updated: $_isFormValid');
  }

  @override
  void onClose() {
    projectNameController.dispose();
    locationDetailsController.dispose();
    landAreaController.dispose();
    incomeController.dispose();
    super.onClose();
  }

  Future<void> _getUserLocation() async {
    isLoadingLocation.value = true;
    final status = await Permission.location.status;
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      selectedLocation.value = LatLng(position.latitude, position.longitude);
    } else if (status.isDenied) {
      final result = await Permission.location.request();
      if (result.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        selectedLocation.value = LatLng(position.latitude, position.longitude);
      }
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    isLoadingLocation.value = false;
  }

  void updatePosition(LatLng location) {
    selectedLocation.value = location;
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
          debugPrint(response.projectId.toString());
          // TODO: Redirect to consultant list page
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

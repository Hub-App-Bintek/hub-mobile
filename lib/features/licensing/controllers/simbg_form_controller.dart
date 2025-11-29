import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';

class SIMBGFormController extends BaseController {
  final RxBool isPrototype = true.obs;

  final TextEditingController docPermitController = TextEditingController();
  final TextEditingController gsbController = TextEditingController();
  final TextEditingController kdbController = TextEditingController();
  final TextEditingController klbController = TextEditingController();
  final TextEditingController kdhController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController currentConditionController =
      TextEditingController();
  final TextEditingController pbgStatusController = TextEditingController();
  final TextEditingController unitCountController = TextEditingController();
  final TextEditingController designAdjustController = TextEditingController();
  final TextEditingController coordinateController = TextEditingController();
  final TextEditingController occupantCountController = TextEditingController();
  bool locationPrefilled = false;
  bool get isLocationLocked =>
      locationPrefilled && coordinateController.text.isNotEmpty;

  // Non-prototype specific
  final TextEditingController buildingCategoryController =
      TextEditingController();
  final TextEditingController basementController = TextEditingController();
  final TextEditingController houseNameController = TextEditingController();
  final TextEditingController totalAreaController = TextEditingController();
  final TextEditingController buildingHeightController =
      TextEditingController();
  final TextEditingController floorCountController = TextEditingController();
  final TextEditingController unitTotalController = TextEditingController();
  final TextEditingController occupantEstimateController =
      TextEditingController();

  List<String> get yesNoOptions => const ['Ya', 'Tidak'];
  List<String> get provinceOptions => const ['DKI Jakarta', 'Jawa Barat'];
  List<String> get cityOptions => const ['Jakarta Selatan', 'Jakarta Barat'];
  List<String> get subdistrictOptions => const ['Kebayoran Lama', 'Cilandak'];
  List<String> get villageOptions => const ['Gandaria Utara', 'Pondok Indah'];
  List<String> get conditionOptions => const ['Baru', 'Renovasi'];
  List<String> get categoryOptions => const ['Rumah Tinggal', 'Rumah Usaha'];

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg is bool) {
      isPrototype.value = arg;
    } else if (arg is Map) {
      final isProto = arg['isPrototype'];
      if (isProto is bool) {
        isPrototype.value = isProto;
      }
      final province = arg['province'] as String?;
      final city = arg['city'] as String?;
      final subdistrict = arg['subdistrict'] as String?;
      final village = arg['village'] as String?;
      final coordinate = arg['coordinate'] as String?;
      provinceController.text = province ?? '';
      cityController.text = city ?? '';
      subdistrictController.text = subdistrict ?? '';
      villageController.text = village ?? '';
      coordinateController.text = coordinate ?? '';
      locationPrefilled =
          coordinate?.isNotEmpty == true ||
          province?.isNotEmpty == true ||
          city?.isNotEmpty == true ||
          subdistrict?.isNotEmpty == true ||
          village?.isNotEmpty == true;
    }
  }

  void togglePrototype(bool value) {
    isPrototype.value = value;
  }

  @override
  void onClose() {
    docPermitController.dispose();
    gsbController.dispose();
    kdbController.dispose();
    klbController.dispose();
    kdhController.dispose();
    provinceController.dispose();
    cityController.dispose();
    subdistrictController.dispose();
    villageController.dispose();
    addressController.dispose();
    currentConditionController.dispose();
    pbgStatusController.dispose();
    unitCountController.dispose();
    designAdjustController.dispose();
    coordinateController.dispose();
    occupantCountController.dispose();
    buildingCategoryController.dispose();
    basementController.dispose();
    houseNameController.dispose();
    totalAreaController.dispose();
    buildingHeightController.dispose();
    floorCountController.dispose();
    unitTotalController.dispose();
    occupantEstimateController.dispose();
    super.onClose();
  }
}

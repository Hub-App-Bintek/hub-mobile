import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/utils/form_validators.dart';
import 'package:pkp_hub/data/models/location/location_models.dart';
import 'package:pkp_hub/data/models/request/register_request.dart';
import 'package:pkp_hub/domain/usecases/auth/register_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_districts_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_provinces_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_regencies_use_case.dart';
import 'package:pkp_hub/domain/usecases/location/get_villages_use_case.dart';

class RegisterController extends BaseController {
  final RegisterUseCase _registerUseCase;
  final GetProvincesUseCase _getProvincesUseCase;
  final GetRegenciesUseCase _getRegenciesUseCase;
  final GetDistrictsUseCase _getDistrictsUseCase;
  final GetVillagesUseCase _getVillagesUseCase;

  RegisterController(
    this._registerUseCase,
    this._getProvincesUseCase,
    this._getRegenciesUseCase,
    this._getDistrictsUseCase,
    this._getVillagesUseCase,
  );

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController institutionTitleController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController idTypeController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController idDocumentController = TextEditingController();
  final TextEditingController selfieDocumentController =
      TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController subdistrictController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final RxnString idDocumentPath = RxnString();
  final RxnString selfieDocumentPath = RxnString();
  final RxList<Province> provinces = <Province>[].obs;
  final RxList<Regency> regencies = <Regency>[].obs;
  final RxList<District> districts = <District>[].obs;
  final RxList<Village> villages = <Village>[].obs;
  final Rxn<Province> selectedProvince = Rxn<Province>();
  final Rxn<Regency> selectedCity = Rxn<Regency>();
  final Rxn<District> selectedDistrict = Rxn<District>();
  final Rxn<Village> selectedSubdistrict = Rxn<Village>();
  List<String> get provinceOptions =>
      provinces.map((province) => province.name).toList();
  List<String> get cityOptions =>
      regencies.map((regency) => regency.name).toList();
  List<String> get districtOptions =>
      districts.map((district) => district.name).toList();
  List<String> get subdistrictOptions =>
      villages.map((village) => village.name).toList();

  final RxBool isRequesting = false.obs;
  final RxBool isEmailValid = false.obs;
  final RxBool isPasswordValid = false.obs;
  final RxBool isConfirmPasswordValid = false.obs;
  final RxBool acceptTerms = false.obs;

  final RxnString emailError = RxnString();
  final RxnString passwordError = RxnString();
  final RxnString confirmPasswordError = RxnString();

  final RxBool _isFormValid = false.obs;

  bool get isFormValid => _isFormValid.value;

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(_validateEmail);
    passwordController.addListener(_validatePassword);
    confirmPasswordController.addListener(_validateConfirmPassword);
    acceptTerms.listen((_) => _updateFormValidity());
    _fetchProvinces();
  }

  void _validateEmail() {
    final email = emailController.text.trim();
    final error = FormValidators.email(email);
    emailError.value = error;
    isEmailValid.value = error == null;
    _updateFormValidity();
  }

  void _validatePassword() {
    final password = passwordController.text;
    final error = FormValidators.password(password);
    passwordError.value = error;
    isPasswordValid.value = error == null;

    if (confirmPasswordController.text.isNotEmpty) {
      _validateConfirmPassword();
    } else {
      _updateFormValidity();
    }
  }

  void _validateConfirmPassword() {
    final confirmPassword = confirmPasswordController.text;
    final password = passwordController.text;
    final error = FormValidators.confirmPassword(confirmPassword, password);
    confirmPasswordError.value = error;
    isConfirmPasswordValid.value = error == null;
    _updateFormValidity();
  }

  void _updateFormValidity() {
    _isFormValid.value =
        isEmailValid.value &&
        isPasswordValid.value &&
        isConfirmPasswordValid.value &&
        acceptTerms.value &&
        selectedProvince.value != null &&
        selectedCity.value != null &&
        selectedDistrict.value != null &&
        selectedSubdistrict.value != null &&
        idDocumentPath.value != null &&
        selfieDocumentPath.value != null &&
        fullNameController.text.trim().isNotEmpty &&
        phoneNumberController.text.trim().isNotEmpty &&
        idTypeController.text.trim().isNotEmpty &&
        idNumberController.text.trim().isNotEmpty &&
        addressController.text.trim().isNotEmpty;
  }

  void toggleTermsAcceptance(bool? value) {
    acceptTerms.value = value ?? false;
  }

  Future<void> register() async {
    if (!isFormValid) {
      _validateEmail();
      _validatePassword();
      _validateConfirmPassword();
      return;
    }

    final title = institutionTitleController.text.trim();
    final fullName = fullNameController.text.trim();
    final idType = idTypeController.text.trim();
    final idNumber = idNumberController.text.trim();
    final address = addressController.text.trim();
    final provinceId = selectedProvince.value?.id;
    final cityId = selectedCity.value?.id;
    final districtId = selectedDistrict.value?.id;
    final subdistrictId = selectedSubdistrict.value?.id;
    final idPhotoPath = idDocumentPath.value;
    final selfiePhotoPath = selfieDocumentPath.value;
    final phone = _formatPhone(phoneNumberController.text);

    if (title.isEmpty ||
        fullName.isEmpty ||
        idType.isEmpty ||
        idNumber.isEmpty ||
        address.isEmpty ||
        provinceId == null ||
        cityId == null ||
        districtId == null ||
        subdistrictId == null ||
        idPhotoPath == null ||
        selfiePhotoPath == null ||
        phone == null) {
      showError(
        const ServerFailure(
          message:
              'Lengkapi semua data, termasuk foto identitas dan selfie, sebelum melanjutkan.',
        ),
      );
      return;
    }

    final compressedIdPath = await _ensureCompressedUnderLimit(idPhotoPath);
    final compressedSelfiePath = await _ensureCompressedUnderLimit(
      selfiePhotoPath,
    );
    if (compressedIdPath == null || compressedSelfiePath == null) {
      showError(
        const ServerFailure(
          message:
              'Gagal memproses foto. Silakan coba ambil ulang dengan resolusi lebih rendah.',
        ),
      );
      return;
    }
    idDocumentPath.value = compressedIdPath;
    selfieDocumentPath.value = compressedSelfiePath;

    isRequesting.value = true;
    try {
      final request = RegisterRequest(
        email: emailController.text.trim(),
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        title: title,
        fullName: fullName,
        phone: phone,
        idType: idType,
        idNumber: idNumber,
        provinceId: provinceId,
        cityId: cityId,
        districtId: districtId,
        subdistrictId: subdistrictId,
        address: address,
        idPhotoPath: idPhotoPath,
        selfiePhotoPath: selfiePhotoPath,
      );

      await handleAsync(
        () => _registerUseCase(request),
        onSuccess: (registerResponse) async {
          navigateTo(AppRoutes.verifyOtp, arguments: emailController.text);
        },
        onFailure: (Failure failure) {
          // For registration, we currently show all errors.
          // If a specific error code (e.g., EMAIL_ALREADY_EXISTS) needs custom
          // handling, a switch statement can be added here, just like in LoginController.
          showError(failure);
        },
      );
    } finally {
      isRequesting.value = false;
    }
  }

  String? _formatPhone(String raw) {
    var digits = raw.trim();
    if (digits.isEmpty) return null;
    digits = digits.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.startsWith('0')) {
      digits = digits.substring(1);
    }
    if (!digits.startsWith('62')) {
      digits = '62$digits';
    }
    return '+$digits';
  }

  Future<void> _fetchProvinces() async {
    await handleAsync<List<Province>>(
      () => _getProvincesUseCase(),
      onSuccess: (data) {
        provinces.assignAll(data);
      },
      onFailure: showError,
    );
  }

  Future<void> _fetchRegencies(int provinceId) async {
    regencies.clear();
    districts.clear();
    villages.clear();
    selectedCity.value = null;
    selectedDistrict.value = null;
    selectedSubdistrict.value = null;
    cityController.clear();
    districtController.clear();
    subdistrictController.clear();
    await handleAsync<List<Regency>>(
      () => _getRegenciesUseCase(provinceId),
      onSuccess: regencies.assignAll,
      onFailure: showError,
    );
  }

  Future<void> _fetchDistricts(int regencyId) async {
    districts.clear();
    villages.clear();
    selectedDistrict.value = null;
    selectedSubdistrict.value = null;
    districtController.clear();
    subdistrictController.clear();
    await handleAsync<List<District>>(
      () => _getDistrictsUseCase(regencyId),
      onSuccess: districts.assignAll,
      onFailure: showError,
    );
  }

  Future<void> _fetchVillages(int districtId) async {
    villages.clear();
    selectedSubdistrict.value = null;
    subdistrictController.clear();
    await handleAsync<List<Village>>(
      () => _getVillagesUseCase(districtId),
      onSuccess: villages.assignAll,
      onFailure: showError,
    );
  }

  void onProvinceSelected(String value) {
    final selected = provinces.firstWhereOrNull(
      (province) => province.name == value,
    );
    selectedProvince.value = selected;
    provinceController.text = selected?.name ?? value;
    if (selected != null) {
      _fetchRegencies(selected.id);
    }
    _updateFormValidity();
  }

  void onCitySelected(String value) {
    final selected = regencies.firstWhereOrNull(
      (regency) => regency.name == value,
    );
    selectedCity.value = selected;
    cityController.text = selected?.name ?? value;
    if (selected != null) {
      _fetchDistricts(selected.id);
    }
    _updateFormValidity();
  }

  void onDistrictSelected(String value) {
    final selected = districts.firstWhereOrNull(
      (district) => district.name == value,
    );
    selectedDistrict.value = selected;
    districtController.text = selected?.name ?? value;
    if (selected != null) {
      _fetchVillages(selected.id);
    }
    _updateFormValidity();
  }

  void onSubdistrictSelected(String value) {
    final selected = villages.firstWhereOrNull(
      (village) => village.name == value,
    );
    selectedSubdistrict.value = selected;
    subdistrictController.text = selected?.name ?? value;
    _updateFormValidity();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    institutionTitleController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();
    idTypeController.dispose();
    idNumberController.dispose();
    idDocumentController.dispose();
    selfieDocumentController.dispose();
    provinceController.dispose();
    cityController.dispose();
    districtController.dispose();
    subdistrictController.dispose();
    addressController.dispose();
    super.onClose();
  }

  Future<int?> _fileSize(String path) async {
    try {
      return await File(path).length();
    } catch (_) {
      return null;
    }
  }

  Future<String?> _ensureCompressedUnderLimit(String path) async {
    const maxBytes = 5 * 1024 * 1024;
    const minQuality = 30;
    const minDimension = 640;
    final original = File(path);
    if (await original.length() <= maxBytes) return path;

    final tempDir = await getTemporaryDirectory();
    String? candidatePath;
    var quality = 80;
    var dimension = 1600;

    while (dimension >= minDimension) {
      final targetPath =
          '${tempDir.path}/register_${DateTime.now().millisecondsSinceEpoch}_q${quality}_d$dimension.jpg';
      final compressed = await FlutterImageCompress.compressAndGetFile(
        path,
        targetPath,
        quality: quality,
        minWidth: dimension,
        minHeight: dimension,
        format: CompressFormat.jpeg,
        keepExif: true,
      );
      if (compressed == null) break;
      final size = await compressed.length();
      candidatePath = compressed.path;
      if (size <= maxBytes) break;

      if (quality > minQuality) {
        quality -= 10;
      } else {
        // Reset quality and reduce dimensions further.
        quality = 80;
        dimension = (dimension * 0.85).floor();
      }
    }

    return candidatePath;
  }
}

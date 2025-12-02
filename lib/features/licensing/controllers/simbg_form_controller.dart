import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/app_pages.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/request/submit_simbg_request.dart';
import 'package:pkp_hub/domain/usecases/permit/submit_simbg_form_use_case.dart';

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

  final SubmitSimbgFormUseCase _submitSimbgFormUseCase;

  SIMBGFormController(this._submitSimbgFormUseCase);

  // Example project ID passed via arguments
  late final String projectId;

  // Assuming you have TextEditingControllers for all your form fields
  final formKey = GlobalKey<FormState>();
  // ... e.g., final provinceNameController = TextEditingController();

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

    projectId = Get.arguments['projectId'] as String;
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

  // 2. The main submission method
  void submitForm() async {
    // if (!formKey.currentState!.validate()) {
    //   Get.snackbar('Error', 'Please fill all required fields correctly.');
    //   return;
    // }

    // 3. Build the request object from controller state/fields
    final request = _buildRequest();

    // 4. Call the use case with handleAsync
    await handleAsync(
      () => _submitSimbgFormUseCase(
        SubmitSimbgFormParams(projectId: projectId, request: request),
      ),
      onSuccess: (_) {
        Get.offAndToNamed(
          AppRoutes.licensingDetails, // Your route for the details screen
          arguments: {
            'projectId': projectId, // Pass the projectId from the API response
          },
        );

        Get.snackbar('Success', 'Form SIMBG has been submitted successfully.');
      },
      // onFailure is handled automatically by BaseController
    );
  }

  SubmitSimbgRequest _buildRequest() {
    if (isPrototype.value) {
      // Gather all data from prototype form fields
      const prototypeData = PrototypeForm(
        type: "PROTOTYPE",
        // Populate all fields from your TextEditControllers and state variables
        nomorDokumenIzinPemanfaatanRuang: "DOC-789012", // Example
        garisSempadanBangunanGsb: 4.0, // Example
        // ... fill all other 20+ fields
        jumlahUnitDibangun: 10,
        menyesuaikanDesainPrototype: true,
        jumlahPenghuni: 40,
        provinceName: '',
        regencyId: 0,
        regencyName: '',
        districtId: 0,
        districtName: '',
        villageId: 0,
        villageName: '',
        alamat: '',
        kondisiBangunanSaatIni: '',
        sudahMemilikiPbgImb: false,
        titikKoordinat: '',
        petaLokasiBangunanPdf: '',
        koefisienDasarBangunanKdb: 0,
        koefisienDasarBangunanKdbUnit: '',
        koefisienLantaiBangunanKlb: 0,
        koefisienLantaiBangunanKlbUnit: '',
        koefisienDasarHijauKdh: 0,
        koefisienDasarHijauKdhUnit: '',
        provinceId: 0,
      );
      return const SubmitSimbgRequest(
        type: "PROTOTYPE",
        prototypeForm: prototypeData,
      );
    } else {
      // Gather all data from non-prototype form fields
      const nonPrototypeData = NonPrototypeForm(
        type: "NON_PROTOTYPE",
        // Populate all fields from your TextEditControllers and state variables
        nomorDokumenIzinPemanfaatanRuang: "DOC-123456", // Example
        garisSempadanBangunanGsb: 5.0, // Example
        // ... fill all other 20+ fields
        kategoriBangunan: "RUMAH_TINGGAL",
        memilikiBasement: false,
        namaRumah: "Rumah Contoh A",
        luasTotalBangunanPerUnit: 120.5,
        tinggiBangunan: 10.0,
        jumlahLantai: 2,
        jumlahUnit: 1,
        estimasiJumlahPenghuni: 4,
        provinceName: '',
        regencyId: 0,
        regencyName: '',
        districtId: 0,
        districtName: '',
        villageId: 0,
        villageName: '',
        alamat: '',
        kondisiBangunanSaatIni: '',
        sudahMemilikiPbgImb: false,
        titikKoordinat: '',
        petaLokasiBangunanPdf: '',
        koefisienDasarBangunanKdb: 0,
        koefisienDasarBangunanKdbUnit: '',
        koefisienLantaiBangunanKlb: 0,
        koefisienLantaiBangunanKlbUnit: '',
        koefisienDasarHijauKdh: 0,
        koefisienDasarHijauKdhUnit: '',
        provinceId: 0,
      );
      return const SubmitSimbgRequest(
        type: "NON_PROTOTYPE",
        nonPrototypeForm: nonPrototypeData,
      );
    }
  }
}

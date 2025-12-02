// lib/data/models/request/submit_simbg_request.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_simbg_request.freezed.dart';

part 'submit_simbg_request.g.dart';

// Main request body
@freezed
class SubmitSimbgRequest with _$SubmitSimbgRequest {
  const factory SubmitSimbgRequest({
    required String type, // "PROTOTYPE" or "NON_PROTOTYPE"
    @JsonKey(includeIfNull: false) PrototypeForm? prototypeForm,
    @JsonKey(includeIfNull: false) NonPrototypeForm? nonPrototypeForm,
  }) = _SubmitSimbgRequest;

  factory SubmitSimbgRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitSimbgRequestFromJson(json);
}

// Non-prototype specific form fields
@freezed
class NonPrototypeForm with _$NonPrototypeForm {
  const factory NonPrototypeForm({
    required String type,
    required String nomorDokumenIzinPemanfaatanRuang,
    required double garisSempadanBangunanGsb,
    required double koefisienDasarBangunanKdb,
    required String koefisienDasarBangunanKdbUnit,
    required double koefisienLantaiBangunanKlb,
    required String koefisienLantaiBangunanKlbUnit,
    required double koefisienDasarHijauKdh,
    required String koefisienDasarHijauKdhUnit,
    required int provinceId,
    required String provinceName,
    required int regencyId,
    required String regencyName,
    required int districtId,
    required String districtName,
    required int villageId,
    required String villageName,
    required String alamat,
    required String kondisiBangunanSaatIni,
    required bool sudahMemilikiPbgImb,
    required String titikKoordinat,
    required String petaLokasiBangunanPdf,
    required String kategoriBangunan,
    required bool memilikiBasement,
    required String namaRumah,
    required double luasTotalBangunanPerUnit,
    required double tinggiBangunan,
    required int jumlahLantai,
    required int jumlahUnit,
    required int estimasiJumlahPenghuni,
  }) = _NonPrototypeForm;

  factory NonPrototypeForm.fromJson(Map<String, dynamic> json) =>
      _$NonPrototypeFormFromJson(json);
}

// Prototype specific form fields
@freezed
class PrototypeForm with _$PrototypeForm {
  const factory PrototypeForm({
    required String type,
    required String nomorDokumenIzinPemanfaatanRuang,
    required double garisSempadanBangunanGsb,
    required double koefisienDasarBangunanKdb,
    required String koefisienDasarBangunanKdbUnit,
    required double koefisienLantaiBangunanKlb,
    required String koefisienLantaiBangunanKlbUnit,
    required double koefisienDasarHijauKdh,
    required String koefisienDasarHijauKdhUnit,
    required int provinceId,
    required String provinceName,
    required int regencyId,
    required String regencyName,
    required int districtId,
    required String districtName,
    required int villageId,
    required String villageName,
    required String alamat,
    required String kondisiBangunanSaatIni,
    required bool sudahMemilikiPbgImb,
    required String titikKoordinat,
    required String petaLokasiBangunanPdf,
    required int jumlahUnitDibangun,
    required bool menyesuaikanDesainPrototype,
    required int jumlahPenghuni,
  }) = _PrototypeForm;

  factory PrototypeForm.fromJson(Map<String, dynamic> json) =>
      _$PrototypeFormFromJson(json);
}

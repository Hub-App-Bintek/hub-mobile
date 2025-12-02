// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_simbg_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitSimbgRequestImpl _$$SubmitSimbgRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitSimbgRequestImpl(
      type: json['type'] as String,
      prototypeForm: json['prototypeForm'] == null
          ? null
          : PrototypeForm.fromJson(
              json['prototypeForm'] as Map<String, dynamic>),
      nonPrototypeForm: json['nonPrototypeForm'] == null
          ? null
          : NonPrototypeForm.fromJson(
              json['nonPrototypeForm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubmitSimbgRequestImplToJson(
    _$SubmitSimbgRequestImpl instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prototypeForm', instance.prototypeForm);
  writeNotNull('nonPrototypeForm', instance.nonPrototypeForm);
  return val;
}

_$NonPrototypeFormImpl _$$NonPrototypeFormImplFromJson(
        Map<String, dynamic> json) =>
    _$NonPrototypeFormImpl(
      type: json['type'] as String,
      nomorDokumenIzinPemanfaatanRuang:
          json['nomorDokumenIzinPemanfaatanRuang'] as String,
      garisSempadanBangunanGsb:
          (json['garisSempadanBangunanGsb'] as num).toDouble(),
      koefisienDasarBangunanKdb:
          (json['koefisienDasarBangunanKdb'] as num).toDouble(),
      koefisienDasarBangunanKdbUnit:
          json['koefisienDasarBangunanKdbUnit'] as String,
      koefisienLantaiBangunanKlb:
          (json['koefisienLantaiBangunanKlb'] as num).toDouble(),
      koefisienLantaiBangunanKlbUnit:
          json['koefisienLantaiBangunanKlbUnit'] as String,
      koefisienDasarHijauKdh:
          (json['koefisienDasarHijauKdh'] as num).toDouble(),
      koefisienDasarHijauKdhUnit: json['koefisienDasarHijauKdhUnit'] as String,
      provinceId: (json['provinceId'] as num).toInt(),
      provinceName: json['provinceName'] as String,
      regencyId: (json['regencyId'] as num).toInt(),
      regencyName: json['regencyName'] as String,
      districtId: (json['districtId'] as num).toInt(),
      districtName: json['districtName'] as String,
      villageId: (json['villageId'] as num).toInt(),
      villageName: json['villageName'] as String,
      alamat: json['alamat'] as String,
      kondisiBangunanSaatIni: json['kondisiBangunanSaatIni'] as String,
      sudahMemilikiPbgImb: json['sudahMemilikiPbgImb'] as bool,
      titikKoordinat: json['titikKoordinat'] as String,
      petaLokasiBangunanPdf: json['petaLokasiBangunanPdf'] as String,
      kategoriBangunan: json['kategoriBangunan'] as String,
      memilikiBasement: json['memilikiBasement'] as bool,
      namaRumah: json['namaRumah'] as String,
      luasTotalBangunanPerUnit:
          (json['luasTotalBangunanPerUnit'] as num).toDouble(),
      tinggiBangunan: (json['tinggiBangunan'] as num).toDouble(),
      jumlahLantai: (json['jumlahLantai'] as num).toInt(),
      jumlahUnit: (json['jumlahUnit'] as num).toInt(),
      estimasiJumlahPenghuni: (json['estimasiJumlahPenghuni'] as num).toInt(),
    );

Map<String, dynamic> _$$NonPrototypeFormImplToJson(
        _$NonPrototypeFormImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'nomorDokumenIzinPemanfaatanRuang':
          instance.nomorDokumenIzinPemanfaatanRuang,
      'garisSempadanBangunanGsb': instance.garisSempadanBangunanGsb,
      'koefisienDasarBangunanKdb': instance.koefisienDasarBangunanKdb,
      'koefisienDasarBangunanKdbUnit': instance.koefisienDasarBangunanKdbUnit,
      'koefisienLantaiBangunanKlb': instance.koefisienLantaiBangunanKlb,
      'koefisienLantaiBangunanKlbUnit': instance.koefisienLantaiBangunanKlbUnit,
      'koefisienDasarHijauKdh': instance.koefisienDasarHijauKdh,
      'koefisienDasarHijauKdhUnit': instance.koefisienDasarHijauKdhUnit,
      'provinceId': instance.provinceId,
      'provinceName': instance.provinceName,
      'regencyId': instance.regencyId,
      'regencyName': instance.regencyName,
      'districtId': instance.districtId,
      'districtName': instance.districtName,
      'villageId': instance.villageId,
      'villageName': instance.villageName,
      'alamat': instance.alamat,
      'kondisiBangunanSaatIni': instance.kondisiBangunanSaatIni,
      'sudahMemilikiPbgImb': instance.sudahMemilikiPbgImb,
      'titikKoordinat': instance.titikKoordinat,
      'petaLokasiBangunanPdf': instance.petaLokasiBangunanPdf,
      'kategoriBangunan': instance.kategoriBangunan,
      'memilikiBasement': instance.memilikiBasement,
      'namaRumah': instance.namaRumah,
      'luasTotalBangunanPerUnit': instance.luasTotalBangunanPerUnit,
      'tinggiBangunan': instance.tinggiBangunan,
      'jumlahLantai': instance.jumlahLantai,
      'jumlahUnit': instance.jumlahUnit,
      'estimasiJumlahPenghuni': instance.estimasiJumlahPenghuni,
    };

_$PrototypeFormImpl _$$PrototypeFormImplFromJson(Map<String, dynamic> json) =>
    _$PrototypeFormImpl(
      type: json['type'] as String,
      nomorDokumenIzinPemanfaatanRuang:
          json['nomorDokumenIzinPemanfaatanRuang'] as String,
      garisSempadanBangunanGsb:
          (json['garisSempadanBangunanGsb'] as num).toDouble(),
      koefisienDasarBangunanKdb:
          (json['koefisienDasarBangunanKdb'] as num).toDouble(),
      koefisienDasarBangunanKdbUnit:
          json['koefisienDasarBangunanKdbUnit'] as String,
      koefisienLantaiBangunanKlb:
          (json['koefisienLantaiBangunanKlb'] as num).toDouble(),
      koefisienLantaiBangunanKlbUnit:
          json['koefisienLantaiBangunanKlbUnit'] as String,
      koefisienDasarHijauKdh:
          (json['koefisienDasarHijauKdh'] as num).toDouble(),
      koefisienDasarHijauKdhUnit: json['koefisienDasarHijauKdhUnit'] as String,
      provinceId: (json['provinceId'] as num).toInt(),
      provinceName: json['provinceName'] as String,
      regencyId: (json['regencyId'] as num).toInt(),
      regencyName: json['regencyName'] as String,
      districtId: (json['districtId'] as num).toInt(),
      districtName: json['districtName'] as String,
      villageId: (json['villageId'] as num).toInt(),
      villageName: json['villageName'] as String,
      alamat: json['alamat'] as String,
      kondisiBangunanSaatIni: json['kondisiBangunanSaatIni'] as String,
      sudahMemilikiPbgImb: json['sudahMemilikiPbgImb'] as bool,
      titikKoordinat: json['titikKoordinat'] as String,
      petaLokasiBangunanPdf: json['petaLokasiBangunanPdf'] as String,
      jumlahUnitDibangun: (json['jumlahUnitDibangun'] as num).toInt(),
      menyesuaikanDesainPrototype: json['menyesuaikanDesainPrototype'] as bool,
      jumlahPenghuni: (json['jumlahPenghuni'] as num).toInt(),
    );

Map<String, dynamic> _$$PrototypeFormImplToJson(_$PrototypeFormImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'nomorDokumenIzinPemanfaatanRuang':
          instance.nomorDokumenIzinPemanfaatanRuang,
      'garisSempadanBangunanGsb': instance.garisSempadanBangunanGsb,
      'koefisienDasarBangunanKdb': instance.koefisienDasarBangunanKdb,
      'koefisienDasarBangunanKdbUnit': instance.koefisienDasarBangunanKdbUnit,
      'koefisienLantaiBangunanKlb': instance.koefisienLantaiBangunanKlb,
      'koefisienLantaiBangunanKlbUnit': instance.koefisienLantaiBangunanKlbUnit,
      'koefisienDasarHijauKdh': instance.koefisienDasarHijauKdh,
      'koefisienDasarHijauKdhUnit': instance.koefisienDasarHijauKdhUnit,
      'provinceId': instance.provinceId,
      'provinceName': instance.provinceName,
      'regencyId': instance.regencyId,
      'regencyName': instance.regencyName,
      'districtId': instance.districtId,
      'districtName': instance.districtName,
      'villageId': instance.villageId,
      'villageName': instance.villageName,
      'alamat': instance.alamat,
      'kondisiBangunanSaatIni': instance.kondisiBangunanSaatIni,
      'sudahMemilikiPbgImb': instance.sudahMemilikiPbgImb,
      'titikKoordinat': instance.titikKoordinat,
      'petaLokasiBangunanPdf': instance.petaLokasiBangunanPdf,
      'jumlahUnitDibangun': instance.jumlahUnitDibangun,
      'menyesuaikanDesainPrototype': instance.menyesuaikanDesainPrototype,
      'jumlahPenghuni': instance.jumlahPenghuni,
    };

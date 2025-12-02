// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_simbg_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubmitSimbgRequest _$SubmitSimbgRequestFromJson(Map<String, dynamic> json) {
  return _SubmitSimbgRequest.fromJson(json);
}

/// @nodoc
mixin _$SubmitSimbgRequest {
  String get type =>
      throw _privateConstructorUsedError; // "PROTOTYPE" or "NON_PROTOTYPE"
  @JsonKey(includeIfNull: false)
  PrototypeForm? get prototypeForm => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  NonPrototypeForm? get nonPrototypeForm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitSimbgRequestCopyWith<SubmitSimbgRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitSimbgRequestCopyWith<$Res> {
  factory $SubmitSimbgRequestCopyWith(
    SubmitSimbgRequest value,
    $Res Function(SubmitSimbgRequest) then,
  ) = _$SubmitSimbgRequestCopyWithImpl<$Res, SubmitSimbgRequest>;
  @useResult
  $Res call({
    String type,
    @JsonKey(includeIfNull: false) PrototypeForm? prototypeForm,
    @JsonKey(includeIfNull: false) NonPrototypeForm? nonPrototypeForm,
  });

  $PrototypeFormCopyWith<$Res>? get prototypeForm;
  $NonPrototypeFormCopyWith<$Res>? get nonPrototypeForm;
}

/// @nodoc
class _$SubmitSimbgRequestCopyWithImpl<$Res, $Val extends SubmitSimbgRequest>
    implements $SubmitSimbgRequestCopyWith<$Res> {
  _$SubmitSimbgRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? prototypeForm = freezed,
    Object? nonPrototypeForm = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            prototypeForm: freezed == prototypeForm
                ? _value.prototypeForm
                : prototypeForm // ignore: cast_nullable_to_non_nullable
                      as PrototypeForm?,
            nonPrototypeForm: freezed == nonPrototypeForm
                ? _value.nonPrototypeForm
                : nonPrototypeForm // ignore: cast_nullable_to_non_nullable
                      as NonPrototypeForm?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $PrototypeFormCopyWith<$Res>? get prototypeForm {
    if (_value.prototypeForm == null) {
      return null;
    }

    return $PrototypeFormCopyWith<$Res>(_value.prototypeForm!, (value) {
      return _then(_value.copyWith(prototypeForm: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NonPrototypeFormCopyWith<$Res>? get nonPrototypeForm {
    if (_value.nonPrototypeForm == null) {
      return null;
    }

    return $NonPrototypeFormCopyWith<$Res>(_value.nonPrototypeForm!, (value) {
      return _then(_value.copyWith(nonPrototypeForm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubmitSimbgRequestImplCopyWith<$Res>
    implements $SubmitSimbgRequestCopyWith<$Res> {
  factory _$$SubmitSimbgRequestImplCopyWith(
    _$SubmitSimbgRequestImpl value,
    $Res Function(_$SubmitSimbgRequestImpl) then,
  ) = __$$SubmitSimbgRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    @JsonKey(includeIfNull: false) PrototypeForm? prototypeForm,
    @JsonKey(includeIfNull: false) NonPrototypeForm? nonPrototypeForm,
  });

  @override
  $PrototypeFormCopyWith<$Res>? get prototypeForm;
  @override
  $NonPrototypeFormCopyWith<$Res>? get nonPrototypeForm;
}

/// @nodoc
class __$$SubmitSimbgRequestImplCopyWithImpl<$Res>
    extends _$SubmitSimbgRequestCopyWithImpl<$Res, _$SubmitSimbgRequestImpl>
    implements _$$SubmitSimbgRequestImplCopyWith<$Res> {
  __$$SubmitSimbgRequestImplCopyWithImpl(
    _$SubmitSimbgRequestImpl _value,
    $Res Function(_$SubmitSimbgRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? prototypeForm = freezed,
    Object? nonPrototypeForm = freezed,
  }) {
    return _then(
      _$SubmitSimbgRequestImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        prototypeForm: freezed == prototypeForm
            ? _value.prototypeForm
            : prototypeForm // ignore: cast_nullable_to_non_nullable
                  as PrototypeForm?,
        nonPrototypeForm: freezed == nonPrototypeForm
            ? _value.nonPrototypeForm
            : nonPrototypeForm // ignore: cast_nullable_to_non_nullable
                  as NonPrototypeForm?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitSimbgRequestImpl implements _SubmitSimbgRequest {
  const _$SubmitSimbgRequestImpl({
    required this.type,
    @JsonKey(includeIfNull: false) this.prototypeForm,
    @JsonKey(includeIfNull: false) this.nonPrototypeForm,
  });

  factory _$SubmitSimbgRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitSimbgRequestImplFromJson(json);

  @override
  final String type;
  // "PROTOTYPE" or "NON_PROTOTYPE"
  @override
  @JsonKey(includeIfNull: false)
  final PrototypeForm? prototypeForm;
  @override
  @JsonKey(includeIfNull: false)
  final NonPrototypeForm? nonPrototypeForm;

  @override
  String toString() {
    return 'SubmitSimbgRequest(type: $type, prototypeForm: $prototypeForm, nonPrototypeForm: $nonPrototypeForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitSimbgRequestImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.prototypeForm, prototypeForm) ||
                other.prototypeForm == prototypeForm) &&
            (identical(other.nonPrototypeForm, nonPrototypeForm) ||
                other.nonPrototypeForm == nonPrototypeForm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, prototypeForm, nonPrototypeForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitSimbgRequestImplCopyWith<_$SubmitSimbgRequestImpl> get copyWith =>
      __$$SubmitSimbgRequestImplCopyWithImpl<_$SubmitSimbgRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitSimbgRequestImplToJson(this);
  }
}

abstract class _SubmitSimbgRequest implements SubmitSimbgRequest {
  const factory _SubmitSimbgRequest({
    required final String type,
    @JsonKey(includeIfNull: false) final PrototypeForm? prototypeForm,
    @JsonKey(includeIfNull: false) final NonPrototypeForm? nonPrototypeForm,
  }) = _$SubmitSimbgRequestImpl;

  factory _SubmitSimbgRequest.fromJson(Map<String, dynamic> json) =
      _$SubmitSimbgRequestImpl.fromJson;

  @override
  String get type;
  @override // "PROTOTYPE" or "NON_PROTOTYPE"
  @JsonKey(includeIfNull: false)
  PrototypeForm? get prototypeForm;
  @override
  @JsonKey(includeIfNull: false)
  NonPrototypeForm? get nonPrototypeForm;
  @override
  @JsonKey(ignore: true)
  _$$SubmitSimbgRequestImplCopyWith<_$SubmitSimbgRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NonPrototypeForm _$NonPrototypeFormFromJson(Map<String, dynamic> json) {
  return _NonPrototypeForm.fromJson(json);
}

/// @nodoc
mixin _$NonPrototypeForm {
  String get type => throw _privateConstructorUsedError;
  String get nomorDokumenIzinPemanfaatanRuang =>
      throw _privateConstructorUsedError;
  double get garisSempadanBangunanGsb => throw _privateConstructorUsedError;
  double get koefisienDasarBangunanKdb => throw _privateConstructorUsedError;
  String get koefisienDasarBangunanKdbUnit =>
      throw _privateConstructorUsedError;
  double get koefisienLantaiBangunanKlb => throw _privateConstructorUsedError;
  String get koefisienLantaiBangunanKlbUnit =>
      throw _privateConstructorUsedError;
  double get koefisienDasarHijauKdh => throw _privateConstructorUsedError;
  String get koefisienDasarHijauKdhUnit => throw _privateConstructorUsedError;
  int get provinceId => throw _privateConstructorUsedError;
  String get provinceName => throw _privateConstructorUsedError;
  int get regencyId => throw _privateConstructorUsedError;
  String get regencyName => throw _privateConstructorUsedError;
  int get districtId => throw _privateConstructorUsedError;
  String get districtName => throw _privateConstructorUsedError;
  int get villageId => throw _privateConstructorUsedError;
  String get villageName => throw _privateConstructorUsedError;
  String get alamat => throw _privateConstructorUsedError;
  String get kondisiBangunanSaatIni => throw _privateConstructorUsedError;
  bool get sudahMemilikiPbgImb => throw _privateConstructorUsedError;
  String get titikKoordinat => throw _privateConstructorUsedError;
  String get petaLokasiBangunanPdf => throw _privateConstructorUsedError;
  String get kategoriBangunan => throw _privateConstructorUsedError;
  bool get memilikiBasement => throw _privateConstructorUsedError;
  String get namaRumah => throw _privateConstructorUsedError;
  double get luasTotalBangunanPerUnit => throw _privateConstructorUsedError;
  double get tinggiBangunan => throw _privateConstructorUsedError;
  int get jumlahLantai => throw _privateConstructorUsedError;
  int get jumlahUnit => throw _privateConstructorUsedError;
  int get estimasiJumlahPenghuni => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NonPrototypeFormCopyWith<NonPrototypeForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonPrototypeFormCopyWith<$Res> {
  factory $NonPrototypeFormCopyWith(
    NonPrototypeForm value,
    $Res Function(NonPrototypeForm) then,
  ) = _$NonPrototypeFormCopyWithImpl<$Res, NonPrototypeForm>;
  @useResult
  $Res call({
    String type,
    String nomorDokumenIzinPemanfaatanRuang,
    double garisSempadanBangunanGsb,
    double koefisienDasarBangunanKdb,
    String koefisienDasarBangunanKdbUnit,
    double koefisienLantaiBangunanKlb,
    String koefisienLantaiBangunanKlbUnit,
    double koefisienDasarHijauKdh,
    String koefisienDasarHijauKdhUnit,
    int provinceId,
    String provinceName,
    int regencyId,
    String regencyName,
    int districtId,
    String districtName,
    int villageId,
    String villageName,
    String alamat,
    String kondisiBangunanSaatIni,
    bool sudahMemilikiPbgImb,
    String titikKoordinat,
    String petaLokasiBangunanPdf,
    String kategoriBangunan,
    bool memilikiBasement,
    String namaRumah,
    double luasTotalBangunanPerUnit,
    double tinggiBangunan,
    int jumlahLantai,
    int jumlahUnit,
    int estimasiJumlahPenghuni,
  });
}

/// @nodoc
class _$NonPrototypeFormCopyWithImpl<$Res, $Val extends NonPrototypeForm>
    implements $NonPrototypeFormCopyWith<$Res> {
  _$NonPrototypeFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? nomorDokumenIzinPemanfaatanRuang = null,
    Object? garisSempadanBangunanGsb = null,
    Object? koefisienDasarBangunanKdb = null,
    Object? koefisienDasarBangunanKdbUnit = null,
    Object? koefisienLantaiBangunanKlb = null,
    Object? koefisienLantaiBangunanKlbUnit = null,
    Object? koefisienDasarHijauKdh = null,
    Object? koefisienDasarHijauKdhUnit = null,
    Object? provinceId = null,
    Object? provinceName = null,
    Object? regencyId = null,
    Object? regencyName = null,
    Object? districtId = null,
    Object? districtName = null,
    Object? villageId = null,
    Object? villageName = null,
    Object? alamat = null,
    Object? kondisiBangunanSaatIni = null,
    Object? sudahMemilikiPbgImb = null,
    Object? titikKoordinat = null,
    Object? petaLokasiBangunanPdf = null,
    Object? kategoriBangunan = null,
    Object? memilikiBasement = null,
    Object? namaRumah = null,
    Object? luasTotalBangunanPerUnit = null,
    Object? tinggiBangunan = null,
    Object? jumlahLantai = null,
    Object? jumlahUnit = null,
    Object? estimasiJumlahPenghuni = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            nomorDokumenIzinPemanfaatanRuang:
                null == nomorDokumenIzinPemanfaatanRuang
                ? _value.nomorDokumenIzinPemanfaatanRuang
                : nomorDokumenIzinPemanfaatanRuang // ignore: cast_nullable_to_non_nullable
                      as String,
            garisSempadanBangunanGsb: null == garisSempadanBangunanGsb
                ? _value.garisSempadanBangunanGsb
                : garisSempadanBangunanGsb // ignore: cast_nullable_to_non_nullable
                      as double,
            koefisienDasarBangunanKdb: null == koefisienDasarBangunanKdb
                ? _value.koefisienDasarBangunanKdb
                : koefisienDasarBangunanKdb // ignore: cast_nullable_to_non_nullable
                      as double,
            koefisienDasarBangunanKdbUnit: null == koefisienDasarBangunanKdbUnit
                ? _value.koefisienDasarBangunanKdbUnit
                : koefisienDasarBangunanKdbUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            koefisienLantaiBangunanKlb: null == koefisienLantaiBangunanKlb
                ? _value.koefisienLantaiBangunanKlb
                : koefisienLantaiBangunanKlb // ignore: cast_nullable_to_non_nullable
                      as double,
            koefisienLantaiBangunanKlbUnit:
                null == koefisienLantaiBangunanKlbUnit
                ? _value.koefisienLantaiBangunanKlbUnit
                : koefisienLantaiBangunanKlbUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            koefisienDasarHijauKdh: null == koefisienDasarHijauKdh
                ? _value.koefisienDasarHijauKdh
                : koefisienDasarHijauKdh // ignore: cast_nullable_to_non_nullable
                      as double,
            koefisienDasarHijauKdhUnit: null == koefisienDasarHijauKdhUnit
                ? _value.koefisienDasarHijauKdhUnit
                : koefisienDasarHijauKdhUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            provinceId: null == provinceId
                ? _value.provinceId
                : provinceId // ignore: cast_nullable_to_non_nullable
                      as int,
            provinceName: null == provinceName
                ? _value.provinceName
                : provinceName // ignore: cast_nullable_to_non_nullable
                      as String,
            regencyId: null == regencyId
                ? _value.regencyId
                : regencyId // ignore: cast_nullable_to_non_nullable
                      as int,
            regencyName: null == regencyName
                ? _value.regencyName
                : regencyName // ignore: cast_nullable_to_non_nullable
                      as String,
            districtId: null == districtId
                ? _value.districtId
                : districtId // ignore: cast_nullable_to_non_nullable
                      as int,
            districtName: null == districtName
                ? _value.districtName
                : districtName // ignore: cast_nullable_to_non_nullable
                      as String,
            villageId: null == villageId
                ? _value.villageId
                : villageId // ignore: cast_nullable_to_non_nullable
                      as int,
            villageName: null == villageName
                ? _value.villageName
                : villageName // ignore: cast_nullable_to_non_nullable
                      as String,
            alamat: null == alamat
                ? _value.alamat
                : alamat // ignore: cast_nullable_to_non_nullable
                      as String,
            kondisiBangunanSaatIni: null == kondisiBangunanSaatIni
                ? _value.kondisiBangunanSaatIni
                : kondisiBangunanSaatIni // ignore: cast_nullable_to_non_nullable
                      as String,
            sudahMemilikiPbgImb: null == sudahMemilikiPbgImb
                ? _value.sudahMemilikiPbgImb
                : sudahMemilikiPbgImb // ignore: cast_nullable_to_non_nullable
                      as bool,
            titikKoordinat: null == titikKoordinat
                ? _value.titikKoordinat
                : titikKoordinat // ignore: cast_nullable_to_non_nullable
                      as String,
            petaLokasiBangunanPdf: null == petaLokasiBangunanPdf
                ? _value.petaLokasiBangunanPdf
                : petaLokasiBangunanPdf // ignore: cast_nullable_to_non_nullable
                      as String,
            kategoriBangunan: null == kategoriBangunan
                ? _value.kategoriBangunan
                : kategoriBangunan // ignore: cast_nullable_to_non_nullable
                      as String,
            memilikiBasement: null == memilikiBasement
                ? _value.memilikiBasement
                : memilikiBasement // ignore: cast_nullable_to_non_nullable
                      as bool,
            namaRumah: null == namaRumah
                ? _value.namaRumah
                : namaRumah // ignore: cast_nullable_to_non_nullable
                      as String,
            luasTotalBangunanPerUnit: null == luasTotalBangunanPerUnit
                ? _value.luasTotalBangunanPerUnit
                : luasTotalBangunanPerUnit // ignore: cast_nullable_to_non_nullable
                      as double,
            tinggiBangunan: null == tinggiBangunan
                ? _value.tinggiBangunan
                : tinggiBangunan // ignore: cast_nullable_to_non_nullable
                      as double,
            jumlahLantai: null == jumlahLantai
                ? _value.jumlahLantai
                : jumlahLantai // ignore: cast_nullable_to_non_nullable
                      as int,
            jumlahUnit: null == jumlahUnit
                ? _value.jumlahUnit
                : jumlahUnit // ignore: cast_nullable_to_non_nullable
                      as int,
            estimasiJumlahPenghuni: null == estimasiJumlahPenghuni
                ? _value.estimasiJumlahPenghuni
                : estimasiJumlahPenghuni // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NonPrototypeFormImplCopyWith<$Res>
    implements $NonPrototypeFormCopyWith<$Res> {
  factory _$$NonPrototypeFormImplCopyWith(
    _$NonPrototypeFormImpl value,
    $Res Function(_$NonPrototypeFormImpl) then,
  ) = __$$NonPrototypeFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    String nomorDokumenIzinPemanfaatanRuang,
    double garisSempadanBangunanGsb,
    double koefisienDasarBangunanKdb,
    String koefisienDasarBangunanKdbUnit,
    double koefisienLantaiBangunanKlb,
    String koefisienLantaiBangunanKlbUnit,
    double koefisienDasarHijauKdh,
    String koefisienDasarHijauKdhUnit,
    int provinceId,
    String provinceName,
    int regencyId,
    String regencyName,
    int districtId,
    String districtName,
    int villageId,
    String villageName,
    String alamat,
    String kondisiBangunanSaatIni,
    bool sudahMemilikiPbgImb,
    String titikKoordinat,
    String petaLokasiBangunanPdf,
    String kategoriBangunan,
    bool memilikiBasement,
    String namaRumah,
    double luasTotalBangunanPerUnit,
    double tinggiBangunan,
    int jumlahLantai,
    int jumlahUnit,
    int estimasiJumlahPenghuni,
  });
}

/// @nodoc
class __$$NonPrototypeFormImplCopyWithImpl<$Res>
    extends _$NonPrototypeFormCopyWithImpl<$Res, _$NonPrototypeFormImpl>
    implements _$$NonPrototypeFormImplCopyWith<$Res> {
  __$$NonPrototypeFormImplCopyWithImpl(
    _$NonPrototypeFormImpl _value,
    $Res Function(_$NonPrototypeFormImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? nomorDokumenIzinPemanfaatanRuang = null,
    Object? garisSempadanBangunanGsb = null,
    Object? koefisienDasarBangunanKdb = null,
    Object? koefisienDasarBangunanKdbUnit = null,
    Object? koefisienLantaiBangunanKlb = null,
    Object? koefisienLantaiBangunanKlbUnit = null,
    Object? koefisienDasarHijauKdh = null,
    Object? koefisienDasarHijauKdhUnit = null,
    Object? provinceId = null,
    Object? provinceName = null,
    Object? regencyId = null,
    Object? regencyName = null,
    Object? districtId = null,
    Object? districtName = null,
    Object? villageId = null,
    Object? villageName = null,
    Object? alamat = null,
    Object? kondisiBangunanSaatIni = null,
    Object? sudahMemilikiPbgImb = null,
    Object? titikKoordinat = null,
    Object? petaLokasiBangunanPdf = null,
    Object? kategoriBangunan = null,
    Object? memilikiBasement = null,
    Object? namaRumah = null,
    Object? luasTotalBangunanPerUnit = null,
    Object? tinggiBangunan = null,
    Object? jumlahLantai = null,
    Object? jumlahUnit = null,
    Object? estimasiJumlahPenghuni = null,
  }) {
    return _then(
      _$NonPrototypeFormImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        nomorDokumenIzinPemanfaatanRuang:
            null == nomorDokumenIzinPemanfaatanRuang
            ? _value.nomorDokumenIzinPemanfaatanRuang
            : nomorDokumenIzinPemanfaatanRuang // ignore: cast_nullable_to_non_nullable
                  as String,
        garisSempadanBangunanGsb: null == garisSempadanBangunanGsb
            ? _value.garisSempadanBangunanGsb
            : garisSempadanBangunanGsb // ignore: cast_nullable_to_non_nullable
                  as double,
        koefisienDasarBangunanKdb: null == koefisienDasarBangunanKdb
            ? _value.koefisienDasarBangunanKdb
            : koefisienDasarBangunanKdb // ignore: cast_nullable_to_non_nullable
                  as double,
        koefisienDasarBangunanKdbUnit: null == koefisienDasarBangunanKdbUnit
            ? _value.koefisienDasarBangunanKdbUnit
            : koefisienDasarBangunanKdbUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        koefisienLantaiBangunanKlb: null == koefisienLantaiBangunanKlb
            ? _value.koefisienLantaiBangunanKlb
            : koefisienLantaiBangunanKlb // ignore: cast_nullable_to_non_nullable
                  as double,
        koefisienLantaiBangunanKlbUnit: null == koefisienLantaiBangunanKlbUnit
            ? _value.koefisienLantaiBangunanKlbUnit
            : koefisienLantaiBangunanKlbUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        koefisienDasarHijauKdh: null == koefisienDasarHijauKdh
            ? _value.koefisienDasarHijauKdh
            : koefisienDasarHijauKdh // ignore: cast_nullable_to_non_nullable
                  as double,
        koefisienDasarHijauKdhUnit: null == koefisienDasarHijauKdhUnit
            ? _value.koefisienDasarHijauKdhUnit
            : koefisienDasarHijauKdhUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        provinceId: null == provinceId
            ? _value.provinceId
            : provinceId // ignore: cast_nullable_to_non_nullable
                  as int,
        provinceName: null == provinceName
            ? _value.provinceName
            : provinceName // ignore: cast_nullable_to_non_nullable
                  as String,
        regencyId: null == regencyId
            ? _value.regencyId
            : regencyId // ignore: cast_nullable_to_non_nullable
                  as int,
        regencyName: null == regencyName
            ? _value.regencyName
            : regencyName // ignore: cast_nullable_to_non_nullable
                  as String,
        districtId: null == districtId
            ? _value.districtId
            : districtId // ignore: cast_nullable_to_non_nullable
                  as int,
        districtName: null == districtName
            ? _value.districtName
            : districtName // ignore: cast_nullable_to_non_nullable
                  as String,
        villageId: null == villageId
            ? _value.villageId
            : villageId // ignore: cast_nullable_to_non_nullable
                  as int,
        villageName: null == villageName
            ? _value.villageName
            : villageName // ignore: cast_nullable_to_non_nullable
                  as String,
        alamat: null == alamat
            ? _value.alamat
            : alamat // ignore: cast_nullable_to_non_nullable
                  as String,
        kondisiBangunanSaatIni: null == kondisiBangunanSaatIni
            ? _value.kondisiBangunanSaatIni
            : kondisiBangunanSaatIni // ignore: cast_nullable_to_non_nullable
                  as String,
        sudahMemilikiPbgImb: null == sudahMemilikiPbgImb
            ? _value.sudahMemilikiPbgImb
            : sudahMemilikiPbgImb // ignore: cast_nullable_to_non_nullable
                  as bool,
        titikKoordinat: null == titikKoordinat
            ? _value.titikKoordinat
            : titikKoordinat // ignore: cast_nullable_to_non_nullable
                  as String,
        petaLokasiBangunanPdf: null == petaLokasiBangunanPdf
            ? _value.petaLokasiBangunanPdf
            : petaLokasiBangunanPdf // ignore: cast_nullable_to_non_nullable
                  as String,
        kategoriBangunan: null == kategoriBangunan
            ? _value.kategoriBangunan
            : kategoriBangunan // ignore: cast_nullable_to_non_nullable
                  as String,
        memilikiBasement: null == memilikiBasement
            ? _value.memilikiBasement
            : memilikiBasement // ignore: cast_nullable_to_non_nullable
                  as bool,
        namaRumah: null == namaRumah
            ? _value.namaRumah
            : namaRumah // ignore: cast_nullable_to_non_nullable
                  as String,
        luasTotalBangunanPerUnit: null == luasTotalBangunanPerUnit
            ? _value.luasTotalBangunanPerUnit
            : luasTotalBangunanPerUnit // ignore: cast_nullable_to_non_nullable
                  as double,
        tinggiBangunan: null == tinggiBangunan
            ? _value.tinggiBangunan
            : tinggiBangunan // ignore: cast_nullable_to_non_nullable
                  as double,
        jumlahLantai: null == jumlahLantai
            ? _value.jumlahLantai
            : jumlahLantai // ignore: cast_nullable_to_non_nullable
                  as int,
        jumlahUnit: null == jumlahUnit
            ? _value.jumlahUnit
            : jumlahUnit // ignore: cast_nullable_to_non_nullable
                  as int,
        estimasiJumlahPenghuni: null == estimasiJumlahPenghuni
            ? _value.estimasiJumlahPenghuni
            : estimasiJumlahPenghuni // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NonPrototypeFormImpl implements _NonPrototypeForm {
  const _$NonPrototypeFormImpl({
    required this.type,
    required this.nomorDokumenIzinPemanfaatanRuang,
    required this.garisSempadanBangunanGsb,
    required this.koefisienDasarBangunanKdb,
    required this.koefisienDasarBangunanKdbUnit,
    required this.koefisienLantaiBangunanKlb,
    required this.koefisienLantaiBangunanKlbUnit,
    required this.koefisienDasarHijauKdh,
    required this.koefisienDasarHijauKdhUnit,
    required this.provinceId,
    required this.provinceName,
    required this.regencyId,
    required this.regencyName,
    required this.districtId,
    required this.districtName,
    required this.villageId,
    required this.villageName,
    required this.alamat,
    required this.kondisiBangunanSaatIni,
    required this.sudahMemilikiPbgImb,
    required this.titikKoordinat,
    required this.petaLokasiBangunanPdf,
    required this.kategoriBangunan,
    required this.memilikiBasement,
    required this.namaRumah,
    required this.luasTotalBangunanPerUnit,
    required this.tinggiBangunan,
    required this.jumlahLantai,
    required this.jumlahUnit,
    required this.estimasiJumlahPenghuni,
  });

  factory _$NonPrototypeFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$NonPrototypeFormImplFromJson(json);

  @override
  final String type;
  @override
  final String nomorDokumenIzinPemanfaatanRuang;
  @override
  final double garisSempadanBangunanGsb;
  @override
  final double koefisienDasarBangunanKdb;
  @override
  final String koefisienDasarBangunanKdbUnit;
  @override
  final double koefisienLantaiBangunanKlb;
  @override
  final String koefisienLantaiBangunanKlbUnit;
  @override
  final double koefisienDasarHijauKdh;
  @override
  final String koefisienDasarHijauKdhUnit;
  @override
  final int provinceId;
  @override
  final String provinceName;
  @override
  final int regencyId;
  @override
  final String regencyName;
  @override
  final int districtId;
  @override
  final String districtName;
  @override
  final int villageId;
  @override
  final String villageName;
  @override
  final String alamat;
  @override
  final String kondisiBangunanSaatIni;
  @override
  final bool sudahMemilikiPbgImb;
  @override
  final String titikKoordinat;
  @override
  final String petaLokasiBangunanPdf;
  @override
  final String kategoriBangunan;
  @override
  final bool memilikiBasement;
  @override
  final String namaRumah;
  @override
  final double luasTotalBangunanPerUnit;
  @override
  final double tinggiBangunan;
  @override
  final int jumlahLantai;
  @override
  final int jumlahUnit;
  @override
  final int estimasiJumlahPenghuni;

  @override
  String toString() {
    return 'NonPrototypeForm(type: $type, nomorDokumenIzinPemanfaatanRuang: $nomorDokumenIzinPemanfaatanRuang, garisSempadanBangunanGsb: $garisSempadanBangunanGsb, koefisienDasarBangunanKdb: $koefisienDasarBangunanKdb, koefisienDasarBangunanKdbUnit: $koefisienDasarBangunanKdbUnit, koefisienLantaiBangunanKlb: $koefisienLantaiBangunanKlb, koefisienLantaiBangunanKlbUnit: $koefisienLantaiBangunanKlbUnit, koefisienDasarHijauKdh: $koefisienDasarHijauKdh, koefisienDasarHijauKdhUnit: $koefisienDasarHijauKdhUnit, provinceId: $provinceId, provinceName: $provinceName, regencyId: $regencyId, regencyName: $regencyName, districtId: $districtId, districtName: $districtName, villageId: $villageId, villageName: $villageName, alamat: $alamat, kondisiBangunanSaatIni: $kondisiBangunanSaatIni, sudahMemilikiPbgImb: $sudahMemilikiPbgImb, titikKoordinat: $titikKoordinat, petaLokasiBangunanPdf: $petaLokasiBangunanPdf, kategoriBangunan: $kategoriBangunan, memilikiBasement: $memilikiBasement, namaRumah: $namaRumah, luasTotalBangunanPerUnit: $luasTotalBangunanPerUnit, tinggiBangunan: $tinggiBangunan, jumlahLantai: $jumlahLantai, jumlahUnit: $jumlahUnit, estimasiJumlahPenghuni: $estimasiJumlahPenghuni)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonPrototypeFormImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(
                  other.nomorDokumenIzinPemanfaatanRuang,
                  nomorDokumenIzinPemanfaatanRuang,
                ) ||
                other.nomorDokumenIzinPemanfaatanRuang ==
                    nomorDokumenIzinPemanfaatanRuang) &&
            (identical(
                  other.garisSempadanBangunanGsb,
                  garisSempadanBangunanGsb,
                ) ||
                other.garisSempadanBangunanGsb == garisSempadanBangunanGsb) &&
            (identical(
                  other.koefisienDasarBangunanKdb,
                  koefisienDasarBangunanKdb,
                ) ||
                other.koefisienDasarBangunanKdb == koefisienDasarBangunanKdb) &&
            (identical(
                  other.koefisienDasarBangunanKdbUnit,
                  koefisienDasarBangunanKdbUnit,
                ) ||
                other.koefisienDasarBangunanKdbUnit ==
                    koefisienDasarBangunanKdbUnit) &&
            (identical(
                  other.koefisienLantaiBangunanKlb,
                  koefisienLantaiBangunanKlb,
                ) ||
                other.koefisienLantaiBangunanKlb ==
                    koefisienLantaiBangunanKlb) &&
            (identical(
                  other.koefisienLantaiBangunanKlbUnit,
                  koefisienLantaiBangunanKlbUnit,
                ) ||
                other.koefisienLantaiBangunanKlbUnit ==
                    koefisienLantaiBangunanKlbUnit) &&
            (identical(other.koefisienDasarHijauKdh, koefisienDasarHijauKdh) ||
                other.koefisienDasarHijauKdh == koefisienDasarHijauKdh) &&
            (identical(
                  other.koefisienDasarHijauKdhUnit,
                  koefisienDasarHijauKdhUnit,
                ) ||
                other.koefisienDasarHijauKdhUnit ==
                    koefisienDasarHijauKdhUnit) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.regencyId, regencyId) ||
                other.regencyId == regencyId) &&
            (identical(other.regencyName, regencyName) ||
                other.regencyName == regencyName) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.villageId, villageId) ||
                other.villageId == villageId) &&
            (identical(other.villageName, villageName) ||
                other.villageName == villageName) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.kondisiBangunanSaatIni, kondisiBangunanSaatIni) ||
                other.kondisiBangunanSaatIni == kondisiBangunanSaatIni) &&
            (identical(other.sudahMemilikiPbgImb, sudahMemilikiPbgImb) ||
                other.sudahMemilikiPbgImb == sudahMemilikiPbgImb) &&
            (identical(other.titikKoordinat, titikKoordinat) ||
                other.titikKoordinat == titikKoordinat) &&
            (identical(other.petaLokasiBangunanPdf, petaLokasiBangunanPdf) ||
                other.petaLokasiBangunanPdf == petaLokasiBangunanPdf) &&
            (identical(other.kategoriBangunan, kategoriBangunan) ||
                other.kategoriBangunan == kategoriBangunan) &&
            (identical(other.memilikiBasement, memilikiBasement) ||
                other.memilikiBasement == memilikiBasement) &&
            (identical(other.namaRumah, namaRumah) ||
                other.namaRumah == namaRumah) &&
            (identical(
                  other.luasTotalBangunanPerUnit,
                  luasTotalBangunanPerUnit,
                ) ||
                other.luasTotalBangunanPerUnit == luasTotalBangunanPerUnit) &&
            (identical(other.tinggiBangunan, tinggiBangunan) ||
                other.tinggiBangunan == tinggiBangunan) &&
            (identical(other.jumlahLantai, jumlahLantai) ||
                other.jumlahLantai == jumlahLantai) &&
            (identical(other.jumlahUnit, jumlahUnit) ||
                other.jumlahUnit == jumlahUnit) &&
            (identical(other.estimasiJumlahPenghuni, estimasiJumlahPenghuni) ||
                other.estimasiJumlahPenghuni == estimasiJumlahPenghuni));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    type,
    nomorDokumenIzinPemanfaatanRuang,
    garisSempadanBangunanGsb,
    koefisienDasarBangunanKdb,
    koefisienDasarBangunanKdbUnit,
    koefisienLantaiBangunanKlb,
    koefisienLantaiBangunanKlbUnit,
    koefisienDasarHijauKdh,
    koefisienDasarHijauKdhUnit,
    provinceId,
    provinceName,
    regencyId,
    regencyName,
    districtId,
    districtName,
    villageId,
    villageName,
    alamat,
    kondisiBangunanSaatIni,
    sudahMemilikiPbgImb,
    titikKoordinat,
    petaLokasiBangunanPdf,
    kategoriBangunan,
    memilikiBasement,
    namaRumah,
    luasTotalBangunanPerUnit,
    tinggiBangunan,
    jumlahLantai,
    jumlahUnit,
    estimasiJumlahPenghuni,
  ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonPrototypeFormImplCopyWith<_$NonPrototypeFormImpl> get copyWith =>
      __$$NonPrototypeFormImplCopyWithImpl<_$NonPrototypeFormImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NonPrototypeFormImplToJson(this);
  }
}

abstract class _NonPrototypeForm implements NonPrototypeForm {
  const factory _NonPrototypeForm({
    required final String type,
    required final String nomorDokumenIzinPemanfaatanRuang,
    required final double garisSempadanBangunanGsb,
    required final double koefisienDasarBangunanKdb,
    required final String koefisienDasarBangunanKdbUnit,
    required final double koefisienLantaiBangunanKlb,
    required final String koefisienLantaiBangunanKlbUnit,
    required final double koefisienDasarHijauKdh,
    required final String koefisienDasarHijauKdhUnit,
    required final int provinceId,
    required final String provinceName,
    required final int regencyId,
    required final String regencyName,
    required final int districtId,
    required final String districtName,
    required final int villageId,
    required final String villageName,
    required final String alamat,
    required final String kondisiBangunanSaatIni,
    required final bool sudahMemilikiPbgImb,
    required final String titikKoordinat,
    required final String petaLokasiBangunanPdf,
    required final String kategoriBangunan,
    required final bool memilikiBasement,
    required final String namaRumah,
    required final double luasTotalBangunanPerUnit,
    required final double tinggiBangunan,
    required final int jumlahLantai,
    required final int jumlahUnit,
    required final int estimasiJumlahPenghuni,
  }) = _$NonPrototypeFormImpl;

  factory _NonPrototypeForm.fromJson(Map<String, dynamic> json) =
      _$NonPrototypeFormImpl.fromJson;

  @override
  String get type;
  @override
  String get nomorDokumenIzinPemanfaatanRuang;
  @override
  double get garisSempadanBangunanGsb;
  @override
  double get koefisienDasarBangunanKdb;
  @override
  String get koefisienDasarBangunanKdbUnit;
  @override
  double get koefisienLantaiBangunanKlb;
  @override
  String get koefisienLantaiBangunanKlbUnit;
  @override
  double get koefisienDasarHijauKdh;
  @override
  String get koefisienDasarHijauKdhUnit;
  @override
  int get provinceId;
  @override
  String get provinceName;
  @override
  int get regencyId;
  @override
  String get regencyName;
  @override
  int get districtId;
  @override
  String get districtName;
  @override
  int get villageId;
  @override
  String get villageName;
  @override
  String get alamat;
  @override
  String get kondisiBangunanSaatIni;
  @override
  bool get sudahMemilikiPbgImb;
  @override
  String get titikKoordinat;
  @override
  String get petaLokasiBangunanPdf;
  @override
  String get kategoriBangunan;
  @override
  bool get memilikiBasement;
  @override
  String get namaRumah;
  @override
  double get luasTotalBangunanPerUnit;
  @override
  double get tinggiBangunan;
  @override
  int get jumlahLantai;
  @override
  int get jumlahUnit;
  @override
  int get estimasiJumlahPenghuni;
  @override
  @JsonKey(ignore: true)
  _$$NonPrototypeFormImplCopyWith<_$NonPrototypeFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrototypeForm _$PrototypeFormFromJson(Map<String, dynamic> json) {
  return _PrototypeForm.fromJson(json);
}

/// @nodoc
mixin _$PrototypeForm {
  String get type => throw _privateConstructorUsedError;
  String get nomorDokumenIzinPemanfaatanRuang =>
      throw _privateConstructorUsedError;
  double get garisSempadanBangunanGsb => throw _privateConstructorUsedError;
  double get koefisienDasarBangunanKdb => throw _privateConstructorUsedError;
  String get koefisienDasarBangunanKdbUnit =>
      throw _privateConstructorUsedError;
  double get koefisienLantaiBangunanKlb => throw _privateConstructorUsedError;
  String get koefisienLantaiBangunanKlbUnit =>
      throw _privateConstructorUsedError;
  double get koefisienDasarHijauKdh => throw _privateConstructorUsedError;
  String get koefisienDasarHijauKdhUnit => throw _privateConstructorUsedError;
  int get provinceId => throw _privateConstructorUsedError;
  String get provinceName => throw _privateConstructorUsedError;
  int get regencyId => throw _privateConstructorUsedError;
  String get regencyName => throw _privateConstructorUsedError;
  int get districtId => throw _privateConstructorUsedError;
  String get districtName => throw _privateConstructorUsedError;
  int get villageId => throw _privateConstructorUsedError;
  String get villageName => throw _privateConstructorUsedError;
  String get alamat => throw _privateConstructorUsedError;
  String get kondisiBangunanSaatIni => throw _privateConstructorUsedError;
  bool get sudahMemilikiPbgImb => throw _privateConstructorUsedError;
  String get titikKoordinat => throw _privateConstructorUsedError;
  String get petaLokasiBangunanPdf => throw _privateConstructorUsedError;
  int get jumlahUnitDibangun => throw _privateConstructorUsedError;
  bool get menyesuaikanDesainPrototype => throw _privateConstructorUsedError;
  int get jumlahPenghuni => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrototypeFormCopyWith<PrototypeForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrototypeFormCopyWith<$Res> {
  factory $PrototypeFormCopyWith(
    PrototypeForm value,
    $Res Function(PrototypeForm) then,
  ) = _$PrototypeFormCopyWithImpl<$Res, PrototypeForm>;
  @useResult
  $Res call({
    String type,
    String nomorDokumenIzinPemanfaatanRuang,
    double garisSempadanBangunanGsb,
    double koefisienDasarBangunanKdb,
    String koefisienDasarBangunanKdbUnit,
    double koefisienLantaiBangunanKlb,
    String koefisienLantaiBangunanKlbUnit,
    double koefisienDasarHijauKdh,
    String koefisienDasarHijauKdhUnit,
    int provinceId,
    String provinceName,
    int regencyId,
    String regencyName,
    int districtId,
    String districtName,
    int villageId,
    String villageName,
    String alamat,
    String kondisiBangunanSaatIni,
    bool sudahMemilikiPbgImb,
    String titikKoordinat,
    String petaLokasiBangunanPdf,
    int jumlahUnitDibangun,
    bool menyesuaikanDesainPrototype,
    int jumlahPenghuni,
  });
}

/// @nodoc
class _$PrototypeFormCopyWithImpl<$Res, $Val extends PrototypeForm>
    implements $PrototypeFormCopyWith<$Res> {
  _$PrototypeFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? nomorDokumenIzinPemanfaatanRuang = null,
    Object? garisSempadanBangunanGsb = null,
    Object? koefisienDasarBangunanKdb = null,
    Object? koefisienDasarBangunanKdbUnit = null,
    Object? koefisienLantaiBangunanKlb = null,
    Object? koefisienLantaiBangunanKlbUnit = null,
    Object? koefisienDasarHijauKdh = null,
    Object? koefisienDasarHijauKdhUnit = null,
    Object? provinceId = null,
    Object? provinceName = null,
    Object? regencyId = null,
    Object? regencyName = null,
    Object? districtId = null,
    Object? districtName = null,
    Object? villageId = null,
    Object? villageName = null,
    Object? alamat = null,
    Object? kondisiBangunanSaatIni = null,
    Object? sudahMemilikiPbgImb = null,
    Object? titikKoordinat = null,
    Object? petaLokasiBangunanPdf = null,
    Object? jumlahUnitDibangun = null,
    Object? menyesuaikanDesainPrototype = null,
    Object? jumlahPenghuni = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            nomorDokumenIzinPemanfaatanRuang:
                null == nomorDokumenIzinPemanfaatanRuang
                ? _value.nomorDokumenIzinPemanfaatanRuang
                : nomorDokumenIzinPemanfaatanRuang // ignore: cast_nullable_to_non_nullable
                      as String,
            garisSempadanBangunanGsb: null == garisSempadanBangunanGsb
                ? _value.garisSempadanBangunanGsb
                : garisSempadanBangunanGsb // ignore: cast_nullable_to_non_nullable
                      as double,
            koefisienDasarBangunanKdb: null == koefisienDasarBangunanKdb
                ? _value.koefisienDasarBangunanKdb
                : koefisienDasarBangunanKdb // ignore: cast_nullable_to_non_nullable
                      as double,
            koefisienDasarBangunanKdbUnit: null == koefisienDasarBangunanKdbUnit
                ? _value.koefisienDasarBangunanKdbUnit
                : koefisienDasarBangunanKdbUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            koefisienLantaiBangunanKlb: null == koefisienLantaiBangunanKlb
                ? _value.koefisienLantaiBangunanKlb
                : koefisienLantaiBangunanKlb // ignore: cast_nullable_to_non_nullable
                      as double,
            koefisienLantaiBangunanKlbUnit:
                null == koefisienLantaiBangunanKlbUnit
                ? _value.koefisienLantaiBangunanKlbUnit
                : koefisienLantaiBangunanKlbUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            koefisienDasarHijauKdh: null == koefisienDasarHijauKdh
                ? _value.koefisienDasarHijauKdh
                : koefisienDasarHijauKdh // ignore: cast_nullable_to_non_nullable
                      as double,
            koefisienDasarHijauKdhUnit: null == koefisienDasarHijauKdhUnit
                ? _value.koefisienDasarHijauKdhUnit
                : koefisienDasarHijauKdhUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            provinceId: null == provinceId
                ? _value.provinceId
                : provinceId // ignore: cast_nullable_to_non_nullable
                      as int,
            provinceName: null == provinceName
                ? _value.provinceName
                : provinceName // ignore: cast_nullable_to_non_nullable
                      as String,
            regencyId: null == regencyId
                ? _value.regencyId
                : regencyId // ignore: cast_nullable_to_non_nullable
                      as int,
            regencyName: null == regencyName
                ? _value.regencyName
                : regencyName // ignore: cast_nullable_to_non_nullable
                      as String,
            districtId: null == districtId
                ? _value.districtId
                : districtId // ignore: cast_nullable_to_non_nullable
                      as int,
            districtName: null == districtName
                ? _value.districtName
                : districtName // ignore: cast_nullable_to_non_nullable
                      as String,
            villageId: null == villageId
                ? _value.villageId
                : villageId // ignore: cast_nullable_to_non_nullable
                      as int,
            villageName: null == villageName
                ? _value.villageName
                : villageName // ignore: cast_nullable_to_non_nullable
                      as String,
            alamat: null == alamat
                ? _value.alamat
                : alamat // ignore: cast_nullable_to_non_nullable
                      as String,
            kondisiBangunanSaatIni: null == kondisiBangunanSaatIni
                ? _value.kondisiBangunanSaatIni
                : kondisiBangunanSaatIni // ignore: cast_nullable_to_non_nullable
                      as String,
            sudahMemilikiPbgImb: null == sudahMemilikiPbgImb
                ? _value.sudahMemilikiPbgImb
                : sudahMemilikiPbgImb // ignore: cast_nullable_to_non_nullable
                      as bool,
            titikKoordinat: null == titikKoordinat
                ? _value.titikKoordinat
                : titikKoordinat // ignore: cast_nullable_to_non_nullable
                      as String,
            petaLokasiBangunanPdf: null == petaLokasiBangunanPdf
                ? _value.petaLokasiBangunanPdf
                : petaLokasiBangunanPdf // ignore: cast_nullable_to_non_nullable
                      as String,
            jumlahUnitDibangun: null == jumlahUnitDibangun
                ? _value.jumlahUnitDibangun
                : jumlahUnitDibangun // ignore: cast_nullable_to_non_nullable
                      as int,
            menyesuaikanDesainPrototype: null == menyesuaikanDesainPrototype
                ? _value.menyesuaikanDesainPrototype
                : menyesuaikanDesainPrototype // ignore: cast_nullable_to_non_nullable
                      as bool,
            jumlahPenghuni: null == jumlahPenghuni
                ? _value.jumlahPenghuni
                : jumlahPenghuni // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrototypeFormImplCopyWith<$Res>
    implements $PrototypeFormCopyWith<$Res> {
  factory _$$PrototypeFormImplCopyWith(
    _$PrototypeFormImpl value,
    $Res Function(_$PrototypeFormImpl) then,
  ) = __$$PrototypeFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    String nomorDokumenIzinPemanfaatanRuang,
    double garisSempadanBangunanGsb,
    double koefisienDasarBangunanKdb,
    String koefisienDasarBangunanKdbUnit,
    double koefisienLantaiBangunanKlb,
    String koefisienLantaiBangunanKlbUnit,
    double koefisienDasarHijauKdh,
    String koefisienDasarHijauKdhUnit,
    int provinceId,
    String provinceName,
    int regencyId,
    String regencyName,
    int districtId,
    String districtName,
    int villageId,
    String villageName,
    String alamat,
    String kondisiBangunanSaatIni,
    bool sudahMemilikiPbgImb,
    String titikKoordinat,
    String petaLokasiBangunanPdf,
    int jumlahUnitDibangun,
    bool menyesuaikanDesainPrototype,
    int jumlahPenghuni,
  });
}

/// @nodoc
class __$$PrototypeFormImplCopyWithImpl<$Res>
    extends _$PrototypeFormCopyWithImpl<$Res, _$PrototypeFormImpl>
    implements _$$PrototypeFormImplCopyWith<$Res> {
  __$$PrototypeFormImplCopyWithImpl(
    _$PrototypeFormImpl _value,
    $Res Function(_$PrototypeFormImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? nomorDokumenIzinPemanfaatanRuang = null,
    Object? garisSempadanBangunanGsb = null,
    Object? koefisienDasarBangunanKdb = null,
    Object? koefisienDasarBangunanKdbUnit = null,
    Object? koefisienLantaiBangunanKlb = null,
    Object? koefisienLantaiBangunanKlbUnit = null,
    Object? koefisienDasarHijauKdh = null,
    Object? koefisienDasarHijauKdhUnit = null,
    Object? provinceId = null,
    Object? provinceName = null,
    Object? regencyId = null,
    Object? regencyName = null,
    Object? districtId = null,
    Object? districtName = null,
    Object? villageId = null,
    Object? villageName = null,
    Object? alamat = null,
    Object? kondisiBangunanSaatIni = null,
    Object? sudahMemilikiPbgImb = null,
    Object? titikKoordinat = null,
    Object? petaLokasiBangunanPdf = null,
    Object? jumlahUnitDibangun = null,
    Object? menyesuaikanDesainPrototype = null,
    Object? jumlahPenghuni = null,
  }) {
    return _then(
      _$PrototypeFormImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        nomorDokumenIzinPemanfaatanRuang:
            null == nomorDokumenIzinPemanfaatanRuang
            ? _value.nomorDokumenIzinPemanfaatanRuang
            : nomorDokumenIzinPemanfaatanRuang // ignore: cast_nullable_to_non_nullable
                  as String,
        garisSempadanBangunanGsb: null == garisSempadanBangunanGsb
            ? _value.garisSempadanBangunanGsb
            : garisSempadanBangunanGsb // ignore: cast_nullable_to_non_nullable
                  as double,
        koefisienDasarBangunanKdb: null == koefisienDasarBangunanKdb
            ? _value.koefisienDasarBangunanKdb
            : koefisienDasarBangunanKdb // ignore: cast_nullable_to_non_nullable
                  as double,
        koefisienDasarBangunanKdbUnit: null == koefisienDasarBangunanKdbUnit
            ? _value.koefisienDasarBangunanKdbUnit
            : koefisienDasarBangunanKdbUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        koefisienLantaiBangunanKlb: null == koefisienLantaiBangunanKlb
            ? _value.koefisienLantaiBangunanKlb
            : koefisienLantaiBangunanKlb // ignore: cast_nullable_to_non_nullable
                  as double,
        koefisienLantaiBangunanKlbUnit: null == koefisienLantaiBangunanKlbUnit
            ? _value.koefisienLantaiBangunanKlbUnit
            : koefisienLantaiBangunanKlbUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        koefisienDasarHijauKdh: null == koefisienDasarHijauKdh
            ? _value.koefisienDasarHijauKdh
            : koefisienDasarHijauKdh // ignore: cast_nullable_to_non_nullable
                  as double,
        koefisienDasarHijauKdhUnit: null == koefisienDasarHijauKdhUnit
            ? _value.koefisienDasarHijauKdhUnit
            : koefisienDasarHijauKdhUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        provinceId: null == provinceId
            ? _value.provinceId
            : provinceId // ignore: cast_nullable_to_non_nullable
                  as int,
        provinceName: null == provinceName
            ? _value.provinceName
            : provinceName // ignore: cast_nullable_to_non_nullable
                  as String,
        regencyId: null == regencyId
            ? _value.regencyId
            : regencyId // ignore: cast_nullable_to_non_nullable
                  as int,
        regencyName: null == regencyName
            ? _value.regencyName
            : regencyName // ignore: cast_nullable_to_non_nullable
                  as String,
        districtId: null == districtId
            ? _value.districtId
            : districtId // ignore: cast_nullable_to_non_nullable
                  as int,
        districtName: null == districtName
            ? _value.districtName
            : districtName // ignore: cast_nullable_to_non_nullable
                  as String,
        villageId: null == villageId
            ? _value.villageId
            : villageId // ignore: cast_nullable_to_non_nullable
                  as int,
        villageName: null == villageName
            ? _value.villageName
            : villageName // ignore: cast_nullable_to_non_nullable
                  as String,
        alamat: null == alamat
            ? _value.alamat
            : alamat // ignore: cast_nullable_to_non_nullable
                  as String,
        kondisiBangunanSaatIni: null == kondisiBangunanSaatIni
            ? _value.kondisiBangunanSaatIni
            : kondisiBangunanSaatIni // ignore: cast_nullable_to_non_nullable
                  as String,
        sudahMemilikiPbgImb: null == sudahMemilikiPbgImb
            ? _value.sudahMemilikiPbgImb
            : sudahMemilikiPbgImb // ignore: cast_nullable_to_non_nullable
                  as bool,
        titikKoordinat: null == titikKoordinat
            ? _value.titikKoordinat
            : titikKoordinat // ignore: cast_nullable_to_non_nullable
                  as String,
        petaLokasiBangunanPdf: null == petaLokasiBangunanPdf
            ? _value.petaLokasiBangunanPdf
            : petaLokasiBangunanPdf // ignore: cast_nullable_to_non_nullable
                  as String,
        jumlahUnitDibangun: null == jumlahUnitDibangun
            ? _value.jumlahUnitDibangun
            : jumlahUnitDibangun // ignore: cast_nullable_to_non_nullable
                  as int,
        menyesuaikanDesainPrototype: null == menyesuaikanDesainPrototype
            ? _value.menyesuaikanDesainPrototype
            : menyesuaikanDesainPrototype // ignore: cast_nullable_to_non_nullable
                  as bool,
        jumlahPenghuni: null == jumlahPenghuni
            ? _value.jumlahPenghuni
            : jumlahPenghuni // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrototypeFormImpl implements _PrototypeForm {
  const _$PrototypeFormImpl({
    required this.type,
    required this.nomorDokumenIzinPemanfaatanRuang,
    required this.garisSempadanBangunanGsb,
    required this.koefisienDasarBangunanKdb,
    required this.koefisienDasarBangunanKdbUnit,
    required this.koefisienLantaiBangunanKlb,
    required this.koefisienLantaiBangunanKlbUnit,
    required this.koefisienDasarHijauKdh,
    required this.koefisienDasarHijauKdhUnit,
    required this.provinceId,
    required this.provinceName,
    required this.regencyId,
    required this.regencyName,
    required this.districtId,
    required this.districtName,
    required this.villageId,
    required this.villageName,
    required this.alamat,
    required this.kondisiBangunanSaatIni,
    required this.sudahMemilikiPbgImb,
    required this.titikKoordinat,
    required this.petaLokasiBangunanPdf,
    required this.jumlahUnitDibangun,
    required this.menyesuaikanDesainPrototype,
    required this.jumlahPenghuni,
  });

  factory _$PrototypeFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrototypeFormImplFromJson(json);

  @override
  final String type;
  @override
  final String nomorDokumenIzinPemanfaatanRuang;
  @override
  final double garisSempadanBangunanGsb;
  @override
  final double koefisienDasarBangunanKdb;
  @override
  final String koefisienDasarBangunanKdbUnit;
  @override
  final double koefisienLantaiBangunanKlb;
  @override
  final String koefisienLantaiBangunanKlbUnit;
  @override
  final double koefisienDasarHijauKdh;
  @override
  final String koefisienDasarHijauKdhUnit;
  @override
  final int provinceId;
  @override
  final String provinceName;
  @override
  final int regencyId;
  @override
  final String regencyName;
  @override
  final int districtId;
  @override
  final String districtName;
  @override
  final int villageId;
  @override
  final String villageName;
  @override
  final String alamat;
  @override
  final String kondisiBangunanSaatIni;
  @override
  final bool sudahMemilikiPbgImb;
  @override
  final String titikKoordinat;
  @override
  final String petaLokasiBangunanPdf;
  @override
  final int jumlahUnitDibangun;
  @override
  final bool menyesuaikanDesainPrototype;
  @override
  final int jumlahPenghuni;

  @override
  String toString() {
    return 'PrototypeForm(type: $type, nomorDokumenIzinPemanfaatanRuang: $nomorDokumenIzinPemanfaatanRuang, garisSempadanBangunanGsb: $garisSempadanBangunanGsb, koefisienDasarBangunanKdb: $koefisienDasarBangunanKdb, koefisienDasarBangunanKdbUnit: $koefisienDasarBangunanKdbUnit, koefisienLantaiBangunanKlb: $koefisienLantaiBangunanKlb, koefisienLantaiBangunanKlbUnit: $koefisienLantaiBangunanKlbUnit, koefisienDasarHijauKdh: $koefisienDasarHijauKdh, koefisienDasarHijauKdhUnit: $koefisienDasarHijauKdhUnit, provinceId: $provinceId, provinceName: $provinceName, regencyId: $regencyId, regencyName: $regencyName, districtId: $districtId, districtName: $districtName, villageId: $villageId, villageName: $villageName, alamat: $alamat, kondisiBangunanSaatIni: $kondisiBangunanSaatIni, sudahMemilikiPbgImb: $sudahMemilikiPbgImb, titikKoordinat: $titikKoordinat, petaLokasiBangunanPdf: $petaLokasiBangunanPdf, jumlahUnitDibangun: $jumlahUnitDibangun, menyesuaikanDesainPrototype: $menyesuaikanDesainPrototype, jumlahPenghuni: $jumlahPenghuni)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrototypeFormImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(
                  other.nomorDokumenIzinPemanfaatanRuang,
                  nomorDokumenIzinPemanfaatanRuang,
                ) ||
                other.nomorDokumenIzinPemanfaatanRuang ==
                    nomorDokumenIzinPemanfaatanRuang) &&
            (identical(
                  other.garisSempadanBangunanGsb,
                  garisSempadanBangunanGsb,
                ) ||
                other.garisSempadanBangunanGsb == garisSempadanBangunanGsb) &&
            (identical(
                  other.koefisienDasarBangunanKdb,
                  koefisienDasarBangunanKdb,
                ) ||
                other.koefisienDasarBangunanKdb == koefisienDasarBangunanKdb) &&
            (identical(
                  other.koefisienDasarBangunanKdbUnit,
                  koefisienDasarBangunanKdbUnit,
                ) ||
                other.koefisienDasarBangunanKdbUnit ==
                    koefisienDasarBangunanKdbUnit) &&
            (identical(
                  other.koefisienLantaiBangunanKlb,
                  koefisienLantaiBangunanKlb,
                ) ||
                other.koefisienLantaiBangunanKlb ==
                    koefisienLantaiBangunanKlb) &&
            (identical(
                  other.koefisienLantaiBangunanKlbUnit,
                  koefisienLantaiBangunanKlbUnit,
                ) ||
                other.koefisienLantaiBangunanKlbUnit ==
                    koefisienLantaiBangunanKlbUnit) &&
            (identical(other.koefisienDasarHijauKdh, koefisienDasarHijauKdh) ||
                other.koefisienDasarHijauKdh == koefisienDasarHijauKdh) &&
            (identical(
                  other.koefisienDasarHijauKdhUnit,
                  koefisienDasarHijauKdhUnit,
                ) ||
                other.koefisienDasarHijauKdhUnit ==
                    koefisienDasarHijauKdhUnit) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.regencyId, regencyId) ||
                other.regencyId == regencyId) &&
            (identical(other.regencyName, regencyName) ||
                other.regencyName == regencyName) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.villageId, villageId) ||
                other.villageId == villageId) &&
            (identical(other.villageName, villageName) ||
                other.villageName == villageName) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.kondisiBangunanSaatIni, kondisiBangunanSaatIni) ||
                other.kondisiBangunanSaatIni == kondisiBangunanSaatIni) &&
            (identical(other.sudahMemilikiPbgImb, sudahMemilikiPbgImb) ||
                other.sudahMemilikiPbgImb == sudahMemilikiPbgImb) &&
            (identical(other.titikKoordinat, titikKoordinat) ||
                other.titikKoordinat == titikKoordinat) &&
            (identical(other.petaLokasiBangunanPdf, petaLokasiBangunanPdf) ||
                other.petaLokasiBangunanPdf == petaLokasiBangunanPdf) &&
            (identical(other.jumlahUnitDibangun, jumlahUnitDibangun) ||
                other.jumlahUnitDibangun == jumlahUnitDibangun) &&
            (identical(
                  other.menyesuaikanDesainPrototype,
                  menyesuaikanDesainPrototype,
                ) ||
                other.menyesuaikanDesainPrototype ==
                    menyesuaikanDesainPrototype) &&
            (identical(other.jumlahPenghuni, jumlahPenghuni) ||
                other.jumlahPenghuni == jumlahPenghuni));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    type,
    nomorDokumenIzinPemanfaatanRuang,
    garisSempadanBangunanGsb,
    koefisienDasarBangunanKdb,
    koefisienDasarBangunanKdbUnit,
    koefisienLantaiBangunanKlb,
    koefisienLantaiBangunanKlbUnit,
    koefisienDasarHijauKdh,
    koefisienDasarHijauKdhUnit,
    provinceId,
    provinceName,
    regencyId,
    regencyName,
    districtId,
    districtName,
    villageId,
    villageName,
    alamat,
    kondisiBangunanSaatIni,
    sudahMemilikiPbgImb,
    titikKoordinat,
    petaLokasiBangunanPdf,
    jumlahUnitDibangun,
    menyesuaikanDesainPrototype,
    jumlahPenghuni,
  ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrototypeFormImplCopyWith<_$PrototypeFormImpl> get copyWith =>
      __$$PrototypeFormImplCopyWithImpl<_$PrototypeFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrototypeFormImplToJson(this);
  }
}

abstract class _PrototypeForm implements PrototypeForm {
  const factory _PrototypeForm({
    required final String type,
    required final String nomorDokumenIzinPemanfaatanRuang,
    required final double garisSempadanBangunanGsb,
    required final double koefisienDasarBangunanKdb,
    required final String koefisienDasarBangunanKdbUnit,
    required final double koefisienLantaiBangunanKlb,
    required final String koefisienLantaiBangunanKlbUnit,
    required final double koefisienDasarHijauKdh,
    required final String koefisienDasarHijauKdhUnit,
    required final int provinceId,
    required final String provinceName,
    required final int regencyId,
    required final String regencyName,
    required final int districtId,
    required final String districtName,
    required final int villageId,
    required final String villageName,
    required final String alamat,
    required final String kondisiBangunanSaatIni,
    required final bool sudahMemilikiPbgImb,
    required final String titikKoordinat,
    required final String petaLokasiBangunanPdf,
    required final int jumlahUnitDibangun,
    required final bool menyesuaikanDesainPrototype,
    required final int jumlahPenghuni,
  }) = _$PrototypeFormImpl;

  factory _PrototypeForm.fromJson(Map<String, dynamic> json) =
      _$PrototypeFormImpl.fromJson;

  @override
  String get type;
  @override
  String get nomorDokumenIzinPemanfaatanRuang;
  @override
  double get garisSempadanBangunanGsb;
  @override
  double get koefisienDasarBangunanKdb;
  @override
  String get koefisienDasarBangunanKdbUnit;
  @override
  double get koefisienLantaiBangunanKlb;
  @override
  String get koefisienLantaiBangunanKlbUnit;
  @override
  double get koefisienDasarHijauKdh;
  @override
  String get koefisienDasarHijauKdhUnit;
  @override
  int get provinceId;
  @override
  String get provinceName;
  @override
  int get regencyId;
  @override
  String get regencyName;
  @override
  int get districtId;
  @override
  String get districtName;
  @override
  int get villageId;
  @override
  String get villageName;
  @override
  String get alamat;
  @override
  String get kondisiBangunanSaatIni;
  @override
  bool get sudahMemilikiPbgImb;
  @override
  String get titikKoordinat;
  @override
  String get petaLokasiBangunanPdf;
  @override
  int get jumlahUnitDibangun;
  @override
  bool get menyesuaikanDesainPrototype;
  @override
  int get jumlahPenghuni;
  @override
  @JsonKey(ignore: true)
  _$$PrototypeFormImplCopyWith<_$PrototypeFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

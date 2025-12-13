// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_contract_draft_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UploadContractRequest _$UploadContractRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UploadContractRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadContractRequest {
  double get contractValue => throw _privateConstructorUsedError;
  List<Installment> get installments => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadContractRequestCopyWith<UploadContractRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadContractRequestCopyWith<$Res> {
  factory $UploadContractRequestCopyWith(
    UploadContractRequest value,
    $Res Function(UploadContractRequest) then,
  ) = _$UploadContractRequestCopyWithImpl<$Res, UploadContractRequest>;
  @useResult
  $Res call({
    double contractValue,
    List<Installment> installments,
    String? fileUrl,
  });
}

/// @nodoc
class _$UploadContractRequestCopyWithImpl<
  $Res,
  $Val extends UploadContractRequest
>
    implements $UploadContractRequestCopyWith<$Res> {
  _$UploadContractRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractValue = null,
    Object? installments = null,
    Object? fileUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            contractValue: null == contractValue
                ? _value.contractValue
                : contractValue // ignore: cast_nullable_to_non_nullable
                      as double,
            installments: null == installments
                ? _value.installments
                : installments // ignore: cast_nullable_to_non_nullable
                      as List<Installment>,
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UploadContractRequestImplCopyWith<$Res>
    implements $UploadContractRequestCopyWith<$Res> {
  factory _$$UploadContractRequestImplCopyWith(
    _$UploadContractRequestImpl value,
    $Res Function(_$UploadContractRequestImpl) then,
  ) = __$$UploadContractRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double contractValue,
    List<Installment> installments,
    String? fileUrl,
  });
}

/// @nodoc
class __$$UploadContractRequestImplCopyWithImpl<$Res>
    extends
        _$UploadContractRequestCopyWithImpl<$Res, _$UploadContractRequestImpl>
    implements _$$UploadContractRequestImplCopyWith<$Res> {
  __$$UploadContractRequestImplCopyWithImpl(
    _$UploadContractRequestImpl _value,
    $Res Function(_$UploadContractRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractValue = null,
    Object? installments = null,
    Object? fileUrl = freezed,
  }) {
    return _then(
      _$UploadContractRequestImpl(
        contractValue: null == contractValue
            ? _value.contractValue
            : contractValue // ignore: cast_nullable_to_non_nullable
                  as double,
        installments: null == installments
            ? _value._installments
            : installments // ignore: cast_nullable_to_non_nullable
                  as List<Installment>,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadContractRequestImpl implements _UploadContractRequest {
  const _$UploadContractRequestImpl({
    required this.contractValue,
    final List<Installment> installments = const <Installment>[],
    this.fileUrl,
  }) : _installments = installments;

  factory _$UploadContractRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadContractRequestImplFromJson(json);

  @override
  final double contractValue;
  final List<Installment> _installments;
  @override
  @JsonKey()
  List<Installment> get installments {
    if (_installments is EqualUnmodifiableListView) return _installments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_installments);
  }

  @override
  final String? fileUrl;

  @override
  String toString() {
    return 'UploadContractRequest(contractValue: $contractValue, installments: $installments, fileUrl: $fileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadContractRequestImpl &&
            (identical(other.contractValue, contractValue) ||
                other.contractValue == contractValue) &&
            const DeepCollectionEquality().equals(
              other._installments,
              _installments,
            ) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    contractValue,
    const DeepCollectionEquality().hash(_installments),
    fileUrl,
  );

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadContractRequestImplCopyWith<_$UploadContractRequestImpl>
  get copyWith =>
      __$$UploadContractRequestImplCopyWithImpl<_$UploadContractRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadContractRequestImplToJson(this);
  }
}

abstract class _UploadContractRequest implements UploadContractRequest {
  const factory _UploadContractRequest({
    required final double contractValue,
    final List<Installment> installments,
    final String? fileUrl,
  }) = _$UploadContractRequestImpl;

  factory _UploadContractRequest.fromJson(Map<String, dynamic> json) =
      _$UploadContractRequestImpl.fromJson;

  @override
  double get contractValue;
  @override
  List<Installment> get installments;
  @override
  String? get fileUrl;
  @override
  @JsonKey(ignore: true)
  _$$UploadContractRequestImplCopyWith<_$UploadContractRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

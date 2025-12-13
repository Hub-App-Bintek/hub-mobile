// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_design_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApproveDesignRequest _$ApproveDesignRequestFromJson(Map<String, dynamic> json) {
  return _ApproveDesignRequest.fromJson(json);
}

/// @nodoc
mixin _$ApproveDesignRequest {
  String? get approvedVersion => throw _privateConstructorUsedError;
  String? get revisionNotes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproveDesignRequestCopyWith<ApproveDesignRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproveDesignRequestCopyWith<$Res> {
  factory $ApproveDesignRequestCopyWith(
    ApproveDesignRequest value,
    $Res Function(ApproveDesignRequest) then,
  ) = _$ApproveDesignRequestCopyWithImpl<$Res, ApproveDesignRequest>;
  @useResult
  $Res call({String? approvedVersion, String? revisionNotes});
}

/// @nodoc
class _$ApproveDesignRequestCopyWithImpl<
  $Res,
  $Val extends ApproveDesignRequest
>
    implements $ApproveDesignRequestCopyWith<$Res> {
  _$ApproveDesignRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvedVersion = freezed,
    Object? revisionNotes = freezed,
  }) {
    return _then(
      _value.copyWith(
            approvedVersion: freezed == approvedVersion
                ? _value.approvedVersion
                : approvedVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            revisionNotes: freezed == revisionNotes
                ? _value.revisionNotes
                : revisionNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApproveDesignRequestImplCopyWith<$Res>
    implements $ApproveDesignRequestCopyWith<$Res> {
  factory _$$ApproveDesignRequestImplCopyWith(
    _$ApproveDesignRequestImpl value,
    $Res Function(_$ApproveDesignRequestImpl) then,
  ) = __$$ApproveDesignRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? approvedVersion, String? revisionNotes});
}

/// @nodoc
class __$$ApproveDesignRequestImplCopyWithImpl<$Res>
    extends _$ApproveDesignRequestCopyWithImpl<$Res, _$ApproveDesignRequestImpl>
    implements _$$ApproveDesignRequestImplCopyWith<$Res> {
  __$$ApproveDesignRequestImplCopyWithImpl(
    _$ApproveDesignRequestImpl _value,
    $Res Function(_$ApproveDesignRequestImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvedVersion = freezed,
    Object? revisionNotes = freezed,
  }) {
    return _then(
      _$ApproveDesignRequestImpl(
        approvedVersion: freezed == approvedVersion
            ? _value.approvedVersion
            : approvedVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        revisionNotes: freezed == revisionNotes
            ? _value.revisionNotes
            : revisionNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ApproveDesignRequestImpl implements _ApproveDesignRequest {
  const _$ApproveDesignRequestImpl({this.approvedVersion, this.revisionNotes});

  factory _$ApproveDesignRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApproveDesignRequestImplFromJson(json);

  @override
  final String? approvedVersion;
  @override
  final String? revisionNotes;

  @override
  String toString() {
    return 'ApproveDesignRequest(approvedVersion: $approvedVersion, revisionNotes: $revisionNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveDesignRequestImpl &&
            (identical(other.approvedVersion, approvedVersion) ||
                other.approvedVersion == approvedVersion) &&
            (identical(other.revisionNotes, revisionNotes) ||
                other.revisionNotes == revisionNotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, approvedVersion, revisionNotes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveDesignRequestImplCopyWith<_$ApproveDesignRequestImpl>
  get copyWith =>
      __$$ApproveDesignRequestImplCopyWithImpl<_$ApproveDesignRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ApproveDesignRequestImplToJson(this);
  }
}

abstract class _ApproveDesignRequest implements ApproveDesignRequest {
  const factory _ApproveDesignRequest({
    final String? approvedVersion,
    final String? revisionNotes,
  }) = _$ApproveDesignRequestImpl;

  factory _ApproveDesignRequest.fromJson(Map<String, dynamic> json) =
      _$ApproveDesignRequestImpl.fromJson;

  @override
  String? get approvedVersion;
  @override
  String? get revisionNotes;
  @override
  @JsonKey(ignore: true)
  _$$ApproveDesignRequestImplCopyWith<_$ApproveDesignRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

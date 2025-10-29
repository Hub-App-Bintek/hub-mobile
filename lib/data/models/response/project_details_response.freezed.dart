// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectDetailsResponse _$ProjectDetailsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ProjectDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectDetailsResponse {
  Project? get project => throw _privateConstructorUsedError;
  Consultation? get consultation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectDetailsResponseCopyWith<ProjectDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDetailsResponseCopyWith<$Res> {
  factory $ProjectDetailsResponseCopyWith(
    ProjectDetailsResponse value,
    $Res Function(ProjectDetailsResponse) then,
  ) = _$ProjectDetailsResponseCopyWithImpl<$Res, ProjectDetailsResponse>;
  @useResult
  $Res call({Project? project, Consultation? consultation});

  $ProjectCopyWith<$Res>? get project;
  $ConsultationCopyWith<$Res>? get consultation;
}

/// @nodoc
class _$ProjectDetailsResponseCopyWithImpl<
  $Res,
  $Val extends ProjectDetailsResponse
>
    implements $ProjectDetailsResponseCopyWith<$Res> {
  _$ProjectDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? project = freezed, Object? consultation = freezed}) {
    return _then(
      _value.copyWith(
            project: freezed == project
                ? _value.project
                : project // ignore: cast_nullable_to_non_nullable
                      as Project?,
            consultation: freezed == consultation
                ? _value.consultation
                : consultation // ignore: cast_nullable_to_non_nullable
                      as Consultation?,
          )
          as $Val,
    );
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ProjectCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsultationCopyWith<$Res>? get consultation {
    if (_value.consultation == null) {
      return null;
    }

    return $ConsultationCopyWith<$Res>(_value.consultation!, (value) {
      return _then(_value.copyWith(consultation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectDetailsResponseImplCopyWith<$Res>
    implements $ProjectDetailsResponseCopyWith<$Res> {
  factory _$$ProjectDetailsResponseImplCopyWith(
    _$ProjectDetailsResponseImpl value,
    $Res Function(_$ProjectDetailsResponseImpl) then,
  ) = __$$ProjectDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Project? project, Consultation? consultation});

  @override
  $ProjectCopyWith<$Res>? get project;
  @override
  $ConsultationCopyWith<$Res>? get consultation;
}

/// @nodoc
class __$$ProjectDetailsResponseImplCopyWithImpl<$Res>
    extends
        _$ProjectDetailsResponseCopyWithImpl<$Res, _$ProjectDetailsResponseImpl>
    implements _$$ProjectDetailsResponseImplCopyWith<$Res> {
  __$$ProjectDetailsResponseImplCopyWithImpl(
    _$ProjectDetailsResponseImpl _value,
    $Res Function(_$ProjectDetailsResponseImpl) _then,
  ) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? project = freezed, Object? consultation = freezed}) {
    return _then(
      _$ProjectDetailsResponseImpl(
        project: freezed == project
            ? _value.project
            : project // ignore: cast_nullable_to_non_nullable
                  as Project?,
        consultation: freezed == consultation
            ? _value.consultation
            : consultation // ignore: cast_nullable_to_non_nullable
                  as Consultation?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectDetailsResponseImpl implements _ProjectDetailsResponse {
  const _$ProjectDetailsResponseImpl({this.project, this.consultation});

  factory _$ProjectDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectDetailsResponseImplFromJson(json);

  @override
  final Project? project;
  @override
  final Consultation? consultation;

  @override
  String toString() {
    return 'ProjectDetailsResponse(project: $project, consultation: $consultation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDetailsResponseImpl &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.consultation, consultation) ||
                other.consultation == consultation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, project, consultation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectDetailsResponseImplCopyWith<_$ProjectDetailsResponseImpl>
  get copyWith =>
      __$$ProjectDetailsResponseImplCopyWithImpl<_$ProjectDetailsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectDetailsResponseImplToJson(this);
  }
}

abstract class _ProjectDetailsResponse implements ProjectDetailsResponse {
  const factory _ProjectDetailsResponse({
    final Project? project,
    final Consultation? consultation,
  }) = _$ProjectDetailsResponseImpl;

  factory _ProjectDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$ProjectDetailsResponseImpl.fromJson;

  @override
  Project? get project;
  @override
  Consultation? get consultation;
  @override
  @JsonKey(ignore: true)
  _$$ProjectDetailsResponseImplCopyWith<_$ProjectDetailsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

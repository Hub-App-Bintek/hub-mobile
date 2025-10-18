// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_completed_portfolios_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCompletedPortfoliosResponse _$GetCompletedPortfoliosResponseFromJson(
    Map<String, dynamic> json) {
  return _GetCompletedPortfoliosResponse.fromJson(json);
}

/// @nodoc
mixin _$GetCompletedPortfoliosResponse {
  List<PortfolioData> get portfolios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCompletedPortfoliosResponseCopyWith<GetCompletedPortfoliosResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCompletedPortfoliosResponseCopyWith<$Res> {
  factory $GetCompletedPortfoliosResponseCopyWith(
          GetCompletedPortfoliosResponse value,
          $Res Function(GetCompletedPortfoliosResponse) then) =
      _$GetCompletedPortfoliosResponseCopyWithImpl<$Res,
          GetCompletedPortfoliosResponse>;
  @useResult
  $Res call({List<PortfolioData> portfolios});
}

/// @nodoc
class _$GetCompletedPortfoliosResponseCopyWithImpl<$Res,
        $Val extends GetCompletedPortfoliosResponse>
    implements $GetCompletedPortfoliosResponseCopyWith<$Res> {
  _$GetCompletedPortfoliosResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? portfolios = null,
  }) {
    return _then(_value.copyWith(
      portfolios: null == portfolios
          ? _value.portfolios
          : portfolios // ignore: cast_nullable_to_non_nullable
              as List<PortfolioData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCompletedPortfoliosResponseImplCopyWith<$Res>
    implements $GetCompletedPortfoliosResponseCopyWith<$Res> {
  factory _$$GetCompletedPortfoliosResponseImplCopyWith(
          _$GetCompletedPortfoliosResponseImpl value,
          $Res Function(_$GetCompletedPortfoliosResponseImpl) then) =
      __$$GetCompletedPortfoliosResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PortfolioData> portfolios});
}

/// @nodoc
class __$$GetCompletedPortfoliosResponseImplCopyWithImpl<$Res>
    extends _$GetCompletedPortfoliosResponseCopyWithImpl<$Res,
        _$GetCompletedPortfoliosResponseImpl>
    implements _$$GetCompletedPortfoliosResponseImplCopyWith<$Res> {
  __$$GetCompletedPortfoliosResponseImplCopyWithImpl(
      _$GetCompletedPortfoliosResponseImpl _value,
      $Res Function(_$GetCompletedPortfoliosResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? portfolios = null,
  }) {
    return _then(_$GetCompletedPortfoliosResponseImpl(
      portfolios: null == portfolios
          ? _value._portfolios
          : portfolios // ignore: cast_nullable_to_non_nullable
              as List<PortfolioData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCompletedPortfoliosResponseImpl
    implements _GetCompletedPortfoliosResponse {
  const _$GetCompletedPortfoliosResponseImpl(
      {required final List<PortfolioData> portfolios})
      : _portfolios = portfolios;

  factory _$GetCompletedPortfoliosResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetCompletedPortfoliosResponseImplFromJson(json);

  final List<PortfolioData> _portfolios;
  @override
  List<PortfolioData> get portfolios {
    if (_portfolios is EqualUnmodifiableListView) return _portfolios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_portfolios);
  }

  @override
  String toString() {
    return 'GetCompletedPortfoliosResponse(portfolios: $portfolios)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCompletedPortfoliosResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._portfolios, _portfolios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_portfolios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCompletedPortfoliosResponseImplCopyWith<
          _$GetCompletedPortfoliosResponseImpl>
      get copyWith => __$$GetCompletedPortfoliosResponseImplCopyWithImpl<
          _$GetCompletedPortfoliosResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCompletedPortfoliosResponseImplToJson(
      this,
    );
  }
}

abstract class _GetCompletedPortfoliosResponse
    implements GetCompletedPortfoliosResponse {
  const factory _GetCompletedPortfoliosResponse(
          {required final List<PortfolioData> portfolios}) =
      _$GetCompletedPortfoliosResponseImpl;

  factory _GetCompletedPortfoliosResponse.fromJson(Map<String, dynamic> json) =
      _$GetCompletedPortfoliosResponseImpl.fromJson;

  @override
  List<PortfolioData> get portfolios;
  @override
  @JsonKey(ignore: true)
  _$$GetCompletedPortfoliosResponseImplCopyWith<
          _$GetCompletedPortfoliosResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PortfolioData _$PortfolioDataFromJson(Map<String, dynamic> json) {
  return _PortfolioData.fromJson(json);
}

/// @nodoc
mixin _$PortfolioData {
  int get id => throw _privateConstructorUsedError;
  UserData get user => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get specialization => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  String? get education => throw _privateConstructorUsedError;
  String? get certifications => throw _privateConstructorUsedError;
  String? get projectSamples => throw _privateConstructorUsedError;
  String? get linkedinUrl => throw _privateConstructorUsedError;
  String? get websiteUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioDataCopyWith<PortfolioData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioDataCopyWith<$Res> {
  factory $PortfolioDataCopyWith(
          PortfolioData value, $Res Function(PortfolioData) then) =
      _$PortfolioDataCopyWithImpl<$Res, PortfolioData>;
  @useResult
  $Res call(
      {int id,
      UserData user,
      String? bio,
      String? specialization,
      String? experience,
      String? education,
      String? certifications,
      String? projectSamples,
      String? linkedinUrl,
      String? websiteUrl});

  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class _$PortfolioDataCopyWithImpl<$Res, $Val extends PortfolioData>
    implements $PortfolioDataCopyWith<$Res> {
  _$PortfolioDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? bio = freezed,
    Object? specialization = freezed,
    Object? experience = freezed,
    Object? education = freezed,
    Object? certifications = freezed,
    Object? projectSamples = freezed,
    Object? linkedinUrl = freezed,
    Object? websiteUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      certifications: freezed == certifications
          ? _value.certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as String?,
      projectSamples: freezed == projectSamples
          ? _value.projectSamples
          : projectSamples // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedinUrl: freezed == linkedinUrl
          ? _value.linkedinUrl
          : linkedinUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get user {
    return $UserDataCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PortfolioDataImplCopyWith<$Res>
    implements $PortfolioDataCopyWith<$Res> {
  factory _$$PortfolioDataImplCopyWith(
          _$PortfolioDataImpl value, $Res Function(_$PortfolioDataImpl) then) =
      __$$PortfolioDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      UserData user,
      String? bio,
      String? specialization,
      String? experience,
      String? education,
      String? certifications,
      String? projectSamples,
      String? linkedinUrl,
      String? websiteUrl});

  @override
  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class __$$PortfolioDataImplCopyWithImpl<$Res>
    extends _$PortfolioDataCopyWithImpl<$Res, _$PortfolioDataImpl>
    implements _$$PortfolioDataImplCopyWith<$Res> {
  __$$PortfolioDataImplCopyWithImpl(
      _$PortfolioDataImpl _value, $Res Function(_$PortfolioDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? bio = freezed,
    Object? specialization = freezed,
    Object? experience = freezed,
    Object? education = freezed,
    Object? certifications = freezed,
    Object? projectSamples = freezed,
    Object? linkedinUrl = freezed,
    Object? websiteUrl = freezed,
  }) {
    return _then(_$PortfolioDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      specialization: freezed == specialization
          ? _value.specialization
          : specialization // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String?,
      certifications: freezed == certifications
          ? _value.certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as String?,
      projectSamples: freezed == projectSamples
          ? _value.projectSamples
          : projectSamples // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedinUrl: freezed == linkedinUrl
          ? _value.linkedinUrl
          : linkedinUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioDataImpl implements _PortfolioData {
  const _$PortfolioDataImpl(
      {required this.id,
      required this.user,
      this.bio,
      this.specialization,
      this.experience,
      this.education,
      this.certifications,
      this.projectSamples,
      this.linkedinUrl,
      this.websiteUrl});

  factory _$PortfolioDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioDataImplFromJson(json);

  @override
  final int id;
  @override
  final UserData user;
  @override
  final String? bio;
  @override
  final String? specialization;
  @override
  final String? experience;
  @override
  final String? education;
  @override
  final String? certifications;
  @override
  final String? projectSamples;
  @override
  final String? linkedinUrl;
  @override
  final String? websiteUrl;

  @override
  String toString() {
    return 'PortfolioData(id: $id, user: $user, bio: $bio, specialization: $specialization, experience: $experience, education: $education, certifications: $certifications, projectSamples: $projectSamples, linkedinUrl: $linkedinUrl, websiteUrl: $websiteUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.certifications, certifications) ||
                other.certifications == certifications) &&
            (identical(other.projectSamples, projectSamples) ||
                other.projectSamples == projectSamples) &&
            (identical(other.linkedinUrl, linkedinUrl) ||
                other.linkedinUrl == linkedinUrl) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      bio,
      specialization,
      experience,
      education,
      certifications,
      projectSamples,
      linkedinUrl,
      websiteUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioDataImplCopyWith<_$PortfolioDataImpl> get copyWith =>
      __$$PortfolioDataImplCopyWithImpl<_$PortfolioDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioDataImplToJson(
      this,
    );
  }
}

abstract class _PortfolioData implements PortfolioData {
  const factory _PortfolioData(
      {required final int id,
      required final UserData user,
      final String? bio,
      final String? specialization,
      final String? experience,
      final String? education,
      final String? certifications,
      final String? projectSamples,
      final String? linkedinUrl,
      final String? websiteUrl}) = _$PortfolioDataImpl;

  factory _PortfolioData.fromJson(Map<String, dynamic> json) =
      _$PortfolioDataImpl.fromJson;

  @override
  int get id;
  @override
  UserData get user;
  @override
  String? get bio;
  @override
  String? get specialization;
  @override
  String? get experience;
  @override
  String? get education;
  @override
  String? get certifications;
  @override
  String? get projectSamples;
  @override
  String? get linkedinUrl;
  @override
  String? get websiteUrl;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioDataImplCopyWith<_$PortfolioDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call({int id, String email, String? name});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String email, String? name});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
  }) {
    return _then(_$UserDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl({required this.id, required this.email, this.name});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String? name;

  @override
  String toString() {
    return 'UserData(id: $id, email: $email, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {required final int id,
      required final String email,
      final String? name}) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

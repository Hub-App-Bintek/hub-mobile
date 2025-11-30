import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_models.freezed.dart';
part 'location_models.g.dart';

@freezed
class Province with _$Province {
  const factory Province({
    required int id,
    @JsonKey(name: 'nama') required String name,
    double? latitude,
    double? longitude,
    String? geojson,
    int? zoom,
    String? kodeDagri,
    String? kodeBps,
    String? kodeRkakl,
    String? createdAt,
    String? updatedAt,
  }) = _Province;

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
}

@freezed
class Regency with _$Regency {
  const factory Regency({
    required int id,
    @JsonKey(name: 'nama') required String name,
    double? latitude,
    double? longitude,
    String? geojson,
    int? zoom,
    String? kodeDagri,
    String? kodeBps,
    String? kodeRkakl,
    int? provinceId,
    int? backlog,
    int? rtlh,
    String? createdAt,
    String? updatedAt,
  }) = _Regency;

  factory Regency.fromJson(Map<String, dynamic> json) =>
      _$RegencyFromJson(json);
}

@freezed
class District with _$District {
  const factory District({
    required int id,
    @JsonKey(name: 'nama') required String name,
    @JsonKey(name: 'cityId') int? regencyId,
    String? kodeDagri,
    String? kodeBps,
    String? kodeRkakl,
    double? latitude,
    double? longitude,
    String? geojson,
    int? zoom,
    String? createdAt,
    String? updatedAt,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}

@freezed
class Village with _$Village {
  const factory Village({
    required int id,
    @JsonKey(name: 'nama') required String name,
    int? districtId,
    String? kodeDagri,
    String? kodeBps,
    String? kodeRkakl,
    double? latitude,
    double? longitude,
    String? geojson,
    int? zoom,
    String? createdAt,
    String? updatedAt,
  }) = _Village;

  factory Village.fromJson(Map<String, dynamic> json) =>
      _$VillageFromJson(json);
}

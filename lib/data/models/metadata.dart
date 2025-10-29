import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata.freezed.dart';
part 'metadata.g.dart';

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    String? dateTime,
    String? actor,
    String? status,
    String? notes,
    String? contractId,
    double? surveyCost,
    String? scheduleId,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}

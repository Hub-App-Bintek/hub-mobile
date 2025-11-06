import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/design_file_metadata.dart';

part 'metadata.freezed.dart';
part 'metadata.g.dart';

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    String? dateTime,
    String? actor,
    String? status,
    String? notes,
    double? surveyCost,
    String? surveyLocation,
    String? contractId,
    String? scheduleId,
    String? paymentId,
    double? totalPaymentAmount,
    String? documentDesignId,
    List<DesignFileMetadata>? designFiles,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}

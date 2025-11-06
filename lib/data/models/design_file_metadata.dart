import 'package:json_annotation/json_annotation.dart';

part 'design_file_metadata.g.dart';

@JsonSerializable()
class DesignFileMetadata {
  final String? fileId;
  final String? documentType;

  const DesignFileMetadata({this.fileId, this.documentType});

  factory DesignFileMetadata.fromJson(Map<String, dynamic> json) =>
      _$DesignFileMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$DesignFileMetadataToJson(this);
}

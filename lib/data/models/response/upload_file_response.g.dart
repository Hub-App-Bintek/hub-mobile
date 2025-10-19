// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadFileResponseImpl _$$UploadFileResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UploadFileResponseImpl(
  fileId: json['fileId'] as String,
  fileUrl: json['fileUrl'] as String,
  checksum: json['checksum'] as String,
);

Map<String, dynamic> _$$UploadFileResponseImplToJson(
  _$UploadFileResponseImpl instance,
) => <String, dynamic>{
  'fileId': instance.fileId,
  'fileUrl': instance.fileUrl,
  'checksum': instance.checksum,
};

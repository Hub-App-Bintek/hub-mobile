// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportDetailModelImpl _$$ReportDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportDetailModelImpl(
      id: (json['id'] as num).toInt(),
      requestId: (json['requestId'] as num).toInt(),
      title: json['title'] as String,
      summary: json['summary'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      supervisorId: (json['supervisorId'] as num).toInt(),
      supervisorName: json['supervisorName'] as String,
    );

Map<String, dynamic> _$$ReportDetailModelImplToJson(
        _$ReportDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestId': instance.requestId,
      'title': instance.title,
      'summary': instance.summary,
      'images': instance.images,
      'createdAt': instance.createdAt.toIso8601String(),
      'supervisorId': instance.supervisorId,
      'supervisorName': instance.supervisorName,
    };

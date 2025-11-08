// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultants_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultantsResponseImpl _$$ConsultantsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultantsResponseImpl(
  consultants: (json['consultants'] as List<dynamic>)
      .map((e) => Consultant.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : PaginationMeta.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ConsultantsResponseImplToJson(
  _$ConsultantsResponseImpl instance,
) => <String, dynamic>{
  'consultants': instance.consultants,
  'pagination': instance.pagination,
};

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
  _$PaginationMetaImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'page': instance.page,
  'size': instance.size,
};

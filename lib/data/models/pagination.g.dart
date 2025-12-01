// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      totalItems: (json['totalItems'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      hasNext: json['hasNext'] as bool?,
      hasPrev: json['hasPrev'] as bool?,
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'hasNext': instance.hasNext,
      'hasPrev': instance.hasPrev,
    };

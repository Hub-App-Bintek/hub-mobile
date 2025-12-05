// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_projects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationProjectsImpl _$$ConsultationProjectsImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationProjectsImpl(
  content: (json['content'] as List<dynamic>?)
      ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
      .toList(),
  pageable: json['pageable'] == null
      ? null
      : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
  totalElements: (json['totalElements'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  last: json['last'] as bool?,
  size: (json['size'] as num?)?.toInt(),
  number: (json['number'] as num?)?.toInt(),
  sort: json['sort'] == null
      ? null
      : Sort.fromJson(json['sort'] as Map<String, dynamic>),
  numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
  first: json['first'] as bool?,
  empty: json['empty'] as bool?,
);

Map<String, dynamic> _$$ConsultationProjectsImplToJson(
  _$ConsultationProjectsImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'pageable': instance.pageable,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'last': instance.last,
  'size': instance.size,
  'number': instance.number,
  'sort': instance.sort,
  'numberOfElements': instance.numberOfElements,
  'first': instance.first,
  'empty': instance.empty,
};

_$PageableImpl _$$PageableImplFromJson(Map<String, dynamic> json) =>
    _$PageableImpl(
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      offset: (json['offset'] as num?)?.toInt(),
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$$PageableImplToJson(_$PageableImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

_$SortImpl _$$SortImplFromJson(Map<String, dynamic> json) => _$SortImpl(
  sorted: json['sorted'] as bool?,
  empty: json['empty'] as bool?,
  unsorted: json['unsorted'] as bool?,
);

Map<String, dynamic> _$$SortImplToJson(_$SortImpl instance) =>
    <String, dynamic>{
      'sorted': instance.sorted,
      'empty': instance.empty,
      'unsorted': instance.unsorted,
    };

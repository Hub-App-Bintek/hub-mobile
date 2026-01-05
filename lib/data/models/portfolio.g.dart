// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortfolioImpl _$$PortfolioImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioImpl(
      id: (json['id'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      price: (json['price'] as num?)?.toInt(),
      detailDescription: json['detailDescription'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PortfolioImplToJson(_$PortfolioImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'price': instance.price,
      'detailDescription': instance.detailDescription,
      'imageUrls': instance.imageUrls,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

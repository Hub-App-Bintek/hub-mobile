// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      dateTime: json['dateTime'] as String?,
      actor: json['actor'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      surveyCost: (json['surveyCost'] as num?)?.toDouble(),
      surveyLocation: json['surveyLocation'] as String?,
      contractId: json['contractId'] as String?,
      scheduleId: json['scheduleId'] as String?,
      paymentId: json['paymentId'] as String?,
      totalPaymentAmount: (json['totalPaymentAmount'] as num?)?.toDouble(),
      documentDesignId: json['documentDesignId'] as String?,
      designFiles: (json['designFiles'] as List<dynamic>?)
          ?.map((e) => DesignFileMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
      'actor': instance.actor,
      'status': instance.status,
      'notes': instance.notes,
      'surveyCost': instance.surveyCost,
      'surveyLocation': instance.surveyLocation,
      'contractId': instance.contractId,
      'scheduleId': instance.scheduleId,
      'paymentId': instance.paymentId,
      'totalPaymentAmount': instance.totalPaymentAmount,
      'documentDesignId': instance.documentDesignId,
      'designFiles': instance.designFiles,
    };

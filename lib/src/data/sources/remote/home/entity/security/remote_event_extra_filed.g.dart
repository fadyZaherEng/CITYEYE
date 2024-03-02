// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_event_extra_filed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteExtraFieldEvents _$RemoteExtraFieldEventsFromJson(
        Map<String, dynamic> json) =>
    RemoteExtraFieldEvents(
      eventId: json['eventId'] as int?,
      eventOptionId: json['eventOptionId'] as int?,
      id: json['id'] as int?,
      controlTypeId: json['controlTypeId'] as int?,
      controlTypeCode: json['controlTypeCode'] as String?,
      lable: json['lable'] as String?,
      isRequired: json['isRequired'] as bool?,
      description: json['description'] as String?,
      choice: json['choice'] as List<dynamic>?,
      formControlsValidation: json['formControlsValidation'] as List<dynamic>?,
    );

Map<String, dynamic> _$RemoteExtraFieldEventsToJson(
        RemoteExtraFieldEvents instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'eventOptionId': instance.eventOptionId,
      'id': instance.id,
      'controlTypeId': instance.controlTypeId,
      'controlTypeCode': instance.controlTypeCode,
      'lable': instance.lable,
      'isRequired': instance.isRequired,
      'description': instance.description,
      'choice': instance.choice,
      'formControlsValidation': instance.formControlsValidation,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_extra_filed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteExtraFieldEvents _$RemoteExtraFieldEventsFromJson(
        Map<String, dynamic> json) =>
    RemoteExtraFieldEvents(
      eventId: json['eventId'] as int? ?? 0,
      eventOptionId: json['eventOptionId'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      controlTypeId: json['controlTypeId'] as int? ?? 0,
      controlTypeCode: json['controlTypeCode'] as String? ?? "",
      lable: json['lable'] as String? ?? "",
      isRequired: json['isRequired'] as bool? ?? false,
      description: json['description'] as String? ?? "",
      choice: (json['choice'] as List<dynamic>?)
              ?.map((e) => RemoteChoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      formControlsValidation:
          json['formControlsValidation'] as List<dynamic>? ?? const [],
      value: json['value'] as String? ?? "",
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
      'value': instance.value,
      'formControlsValidation': instance.formControlsValidation,
    };

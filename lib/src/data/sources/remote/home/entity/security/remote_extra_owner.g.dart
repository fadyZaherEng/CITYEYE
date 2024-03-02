// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_extra_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOwnerExtraField _$RemoteOwnerExtraFieldFromJson(
        Map<String, dynamic> json) =>
    RemoteOwnerExtraField(
      id: json['id'] as int?,
      controlTypeId: json['controlTypeId'] as int?,
      controlTypeCode: json['controlTypeCode'] as String?,
      lable: json['lable'] as String?,
      isRequired: json['isRequired'] as bool?,
      value: json['value'] as String?,
      choice: json['choice'] as List<dynamic>?,
      formControlsValidation: json['formControlsValidation'] as List<dynamic>?,
    );

Map<String, dynamic> _$RemoteOwnerExtraFieldToJson(
        RemoteOwnerExtraField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'controlTypeId': instance.controlTypeId,
      'controlTypeCode': instance.controlTypeCode,
      'lable': instance.lable,
      'isRequired': instance.isRequired,
      'value': instance.value,
      'choice': instance.choice,
      'formControlsValidation': instance.formControlsValidation,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_support_user_units.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSupportUserUnits _$RemoteSupportUserUnitsFromJson(
        Map<String, dynamic> json) =>
    RemoteSupportUserUnits(
      unitId: json['unitId'] as int? ?? 0,
      unitNumber: json['unitNumber'] as int? ?? 0,
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteSupportUserUnitsToJson(
        RemoteSupportUserUnits instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'unitNumber': instance.unitNumber,
      'name': instance.name,
    };

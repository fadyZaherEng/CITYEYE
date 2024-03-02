// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user_units.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUserUnits _$RemoteUserUnitsFromJson(Map<String, dynamic> json) =>
    RemoteUserUnits(
      id: json['id'] as int? ?? 0,
      number: json['number'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteUserUnitsToJson(RemoteUserUnits instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
    };

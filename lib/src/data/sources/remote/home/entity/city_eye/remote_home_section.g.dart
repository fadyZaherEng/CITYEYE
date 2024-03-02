// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_home_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteHomeSections _$RemoteHomeSectionsFromJson(Map<String, dynamic> json) =>
    RemoteHomeSections(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? "",
      isvisible: json['isvisible'] as bool? ?? false,
    );

Map<String, dynamic> _$RemoteHomeSectionsToJson(RemoteHomeSections instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'isvisible': instance.isvisible,
    };

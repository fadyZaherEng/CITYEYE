// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_support_tech_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSupportTechStatus _$RemoteSupportTechStatusFromJson(
        Map<String, dynamic> json) =>
    RemoteSupportTechStatus(
      statusId: json['statusId'] as int? ?? 0,
      statusName: json['statusName'] as String? ?? "",
      code: json['code'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteSupportTechStatusToJson(
        RemoteSupportTechStatus instance) =>
    <String, dynamic>{
      'statusId': instance.statusId,
      'statusName': instance.statusName,
      'code': instance.code,
    };

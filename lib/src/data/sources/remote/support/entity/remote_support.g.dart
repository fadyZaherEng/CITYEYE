// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_support.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSupport _$RemoteSupportFromJson(Map<String, dynamic> json) =>
    RemoteSupport(
      requestId: json['requestId'] as int? ?? 0,
      requestDate: json['requestDate'] as String? ?? "",
      requestDescription: json['requestDescription'] as String? ?? "",
      supportCompoundStuff: json['compoundStuff'] == null
          ? const RemoteSupportCompoundStuff()
          : RemoteSupportCompoundStuff.fromJson(
              json['compoundStuff'] as Map<String, dynamic>),
      supportUserUnits: json['userUnits'] == null
          ? const RemoteSupportUserUnits()
          : RemoteSupportUserUnits.fromJson(
              json['userUnits'] as Map<String, dynamic>),
      supportCategory: json['supportCatgeory'] == null
          ? const RemoteSupportCategory()
          : RemoteSupportCategory.fromJson(
              json['supportCatgeory'] as Map<String, dynamic>),
      supportTechStatus: json['supportTechStatus'] == null
          ? const RemoteSupportTechStatus()
          : RemoteSupportTechStatus.fromJson(
              json['supportTechStatus'] as Map<String, dynamic>),
      supportAttachments: (json['supportRequestAttachments'] as List<dynamic>?)
              ?.map((e) =>
                  RemoteSupportAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteSupportToJson(RemoteSupport instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'requestDate': instance.requestDate,
      'requestDescription': instance.requestDescription,
      'compoundStuff': instance.supportCompoundStuff?.toJson(),
      'userUnits': instance.supportUserUnits?.toJson(),
      'supportCatgeory': instance.supportCategory?.toJson(),
      'supportTechStatus': instance.supportTechStatus?.toJson(),
      'supportRequestAttachments':
          instance.supportAttachments?.map((e) => e.toJson()).toList(),
    };

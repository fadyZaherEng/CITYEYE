// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_support_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSupportAttachment _$RemoteSupportAttachmentFromJson(
        Map<String, dynamic> json) =>
    RemoteSupportAttachment(
      name: json['name'] as String? ?? "",
      pathUrl: json['pathUrl'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteSupportAttachmentToJson(
        RemoteSupportAttachment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pathUrl': instance.pathUrl,
    };

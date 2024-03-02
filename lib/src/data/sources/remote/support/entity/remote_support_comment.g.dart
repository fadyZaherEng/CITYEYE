// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_support_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSupportComment _$RemoteSupportCommentFromJson(
        Map<String, dynamic> json) =>
    RemoteSupportComment(
      id: json['id'] as int? ?? 0,
      message: json['message'] as String? ?? "",
      date: json['date'] as String? ?? "",
      isImage: json['isImage'] as bool? ?? false,
      user: json['user'] == null
          ? const RemoteUser()
          : RemoteUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteSupportCommentToJson(
        RemoteSupportComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'date': instance.date,
      'isImage': instance.isImage,
      'user': instance.user.toJson(),
    };

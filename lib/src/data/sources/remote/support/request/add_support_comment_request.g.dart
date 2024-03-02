// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_support_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSupportCommentRequest _$AddSupportCommentRequestFromJson(
        Map<String, dynamic> json) =>
    AddSupportCommentRequest(
      requestId: json['requestId'] as int,
      message: json['message'] as String,
      isImage: json['isImage'] as bool,
    );

Map<String, dynamic> _$AddSupportCommentRequestToJson(
        AddSupportCommentRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'message': instance.message,
      'isImage': instance.isImage,
    };

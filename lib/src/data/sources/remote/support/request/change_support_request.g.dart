// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_support_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeSupportRequest _$ChangeSupportRequestFromJson(
        Map<String, dynamic> json) =>
    ChangeSupportRequest(
      requestId: json['requestId'] as int,
      statusCode: json['statusCode'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ChangeSupportRequestToJson(
        ChangeSupportRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'statusCode': instance.statusCode,
      'totalAmount': instance.totalAmount,
      'description': instance.description,
    };

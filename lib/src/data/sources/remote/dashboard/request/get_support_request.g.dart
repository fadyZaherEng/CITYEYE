// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_support_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSupportRequest _$GetSupportRequestFromJson(Map<String, dynamic> json) =>
    GetSupportRequest(
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      supportStatusId: json['supportStatusId'] as int?,
    );

Map<String, dynamic> _$GetSupportRequestToJson(GetSupportRequest instance) =>
    <String, dynamic>{
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'supportStatusId': instance.supportStatusId,
    };

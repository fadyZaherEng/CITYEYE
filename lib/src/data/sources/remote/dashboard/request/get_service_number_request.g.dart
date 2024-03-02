// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_service_number_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServiceNumberRequest _$GetServiceNumberRequestFromJson(
        Map<String, dynamic> json) =>
    GetServiceNumberRequest(
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      serviceStatusId: json['serviceStatusId'] as int?,
      categoryId: json['categoryId'] as int?,
    );

Map<String, dynamic> _$GetServiceNumberRequestToJson(
        GetServiceNumberRequest instance) =>
    <String, dynamic>{
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'serviceStatusId': instance.serviceStatusId,
      'categoryId': instance.categoryId,
    };

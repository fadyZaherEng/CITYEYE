// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_support_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetSupportNumber _$RemoteGetSupportNumberFromJson(
        Map<String, dynamic> json) =>
    RemoteGetSupportNumber(
      numberOfAllSupportRequests: json['numberOfAllSupportRequests'] as int?,
      numberOfPendingRequests: json['numberOfPendingRequests'] as int?,
      numberOfProgressRequests: json['numberOfProgressRequests'] as int?,
      numberOfCompletedRequests: json['numberOfCompletedRequests'] as int?,
      numberOfCancelledRequests: json['numberOfCancelledRequests'] as int?,
      numberOfHoldRequests: json['numberOfHoldRequests'] as int?,
      numberOfNeedPaymentRequests: json['numberOfNeedPaymentRequests'] as int?,
    );

Map<String, dynamic> _$RemoteGetSupportNumberToJson(
        RemoteGetSupportNumber instance) =>
    <String, dynamic>{
      'numberOfAllSupportRequests': instance.numberOfAllSupportRequests,
      'numberOfPendingRequests': instance.numberOfPendingRequests,
      'numberOfProgressRequests': instance.numberOfProgressRequests,
      'numberOfCompletedRequests': instance.numberOfCompletedRequests,
      'numberOfCancelledRequests': instance.numberOfCancelledRequests,
      'numberOfHoldRequests': instance.numberOfHoldRequests,
      'numberOfNeedPaymentRequests': instance.numberOfNeedPaymentRequests,
    };

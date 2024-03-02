// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_offers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetOffers _$RemoteGetOffersFromJson(Map<String, dynamic> json) =>
    RemoteGetOffers(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      iSRedirectURL: json['iSRedirectURL'] as bool? ?? false,
      redirectURL: json['redirectURL'] as String? ?? "",
      startDate: json['startDate'] as String? ?? "",
      endDate: json['endDate'] as String? ?? "",
      attachment: json['attachment'] as String? ?? "",
      destinationMobilePages: json['destinationMobilePages'] ?? "",
      destinationSourceId: json['destinationSourceId'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteGetOffersToJson(RemoteGetOffers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'iSRedirectURL': instance.iSRedirectURL,
      'redirectURL': instance.redirectURL,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'attachment': instance.attachment,
      'destinationMobilePages': instance.destinationMobilePages,
      'destinationSourceId': instance.destinationSourceId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_compound_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCompoundsetting _$RemoteCompoundsettingFromJson(
        Map<String, dynamic> json) =>
    RemoteCompoundsetting(
      id: json['id'] as int?,
      name: json['name'] as String?,
      compoundType: json['compoundType'] == null
          ? null
          : RemoteCompoundType.fromJson(
              json['compoundType'] as Map<String, dynamic>),
      mobile: json['mobile'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      address: json['address'] as String?,
      logo: json['logo'] as String?,
      currency: json['currency'] == null
          ? null
          : RemoteCurrency.fromJson(json['currency'] as Map<String, dynamic>),
      aboutUs: json['aboutUs'] as String?,
      termsConditions: json['termsConditions'] as String?,
      faq: json['faq'] as String?,
      communityRules: json['communityRules'] as String?,
      isIncludeTax: json['isIncludeTax'] as bool?,
      isIncludeVat: json['isIncludeVat'] as bool?,
      otpRequestCount: json['otpRequestCount'] as int?,
      otpLimitationMinutes: json['otpLimitationMinutes'] as int?,
      badgeExpiredTime: json['badgeExpiredTime'] as int?,
    );

Map<String, dynamic> _$RemoteCompoundsettingToJson(
        RemoteCompoundsetting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'compoundType': instance.compoundType,
      'mobile': instance.mobile,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'logo': instance.logo,
      'currency': instance.currency,
      'aboutUs': instance.aboutUs,
      'termsConditions': instance.termsConditions,
      'faq': instance.faq,
      'communityRules': instance.communityRules,
      'isIncludeTax': instance.isIncludeTax,
      'isIncludeVat': instance.isIncludeVat,
      'otpRequestCount': instance.otpRequestCount,
      'otpLimitationMinutes': instance.otpLimitationMinutes,
      'badgeExpiredTime': instance.badgeExpiredTime,
    };

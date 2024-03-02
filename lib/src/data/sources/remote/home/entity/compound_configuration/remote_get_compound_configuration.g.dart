// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_compound_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetCompoundConfiguration _$RemoteGetCompoundConfigurationFromJson(
        Map<String, dynamic> json) =>
    RemoteGetCompoundConfiguration(
      vat: json['vat'] as int?,
      tax: json['tax'] as int?,
      listOfMultiMediaConfiguration:
          (json['listOfMultiMediaConfiguration'] as List<dynamic>?)
              ?.map((e) => RemoteListOfMultiMediaConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      listSocialMedia: (json['listSocialMedia'] as List<dynamic>?)
          ?.map(
              (e) => RemoteListSocialMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      listOfPageSections: (json['listOfPageSections'] as List<dynamic>?)
          ?.map((e) =>
              RemoteListOfPageSections.fromJson(e as Map<String, dynamic>))
          .toList(),
      compoundsetting: json['compoundsetting'] == null
          ? null
          : RemoteCompoundsetting.fromJson(
              json['compoundsetting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteGetCompoundConfigurationToJson(
        RemoteGetCompoundConfiguration instance) =>
    <String, dynamic>{
      'vat': instance.vat,
      'tax': instance.tax,
      'listOfMultiMediaConfiguration': instance.listOfMultiMediaConfiguration,
      'listSocialMedia': instance.listSocialMedia,
      'listOfPageSections': instance.listOfPageSections,
      'compoundsetting': instance.compoundsetting,
    };

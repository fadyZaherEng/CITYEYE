// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_compound_home_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetCompoundHomeSection _$RemoteGetCompoundHomeSectionFromJson(
        Map<String, dynamic> json) =>
    RemoteGetCompoundHomeSection(
      homeSections: (json['homeSections'] as List<dynamic>?)
              ?.map(
                  (e) => RemoteHomeSections.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      supportCategorys: (json['supportCategorys'] as List<dynamic>?)
              ?.map((e) =>
                  RemoteSupportCategorys.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      servicesCategorys: (json['servicesCategorys'] as List<dynamic>?)
              ?.map((e) =>
                  RemoteServicesCategorys.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => RemoteEvents.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      surveys: (json['surveys'] as List<dynamic>?)
              ?.map((e) => RemoteSurveys.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      extraFieldEvents: (json['extraFieldEvents'] as List<dynamic>?)
              ?.map((e) =>
                  RemoteExtraFieldEvents.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteGetCompoundHomeSectionToJson(
        RemoteGetCompoundHomeSection instance) =>
    <String, dynamic>{
      'homeSections': instance.homeSections,
      'supportCategorys': instance.supportCategorys,
      'servicesCategorys': instance.servicesCategorys,
      'events': instance.events,
      'surveys': instance.surveys,
      'extraFieldEvents': instance.extraFieldEvents,
    };

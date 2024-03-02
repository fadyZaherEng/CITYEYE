import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_events.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_extra_filed.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_home_section.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_service_category.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_support_category.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_surveys.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_home_section.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_compound_home_section.g.dart';

@JsonSerializable()
class RemoteGetCompoundHomeSection {
  final List<RemoteHomeSections>? homeSections;
  final List<RemoteSupportCategorys>? supportCategorys;
  final List<RemoteServicesCategorys>? servicesCategorys;
  final List<RemoteEvents>? events;
  final List<RemoteSurveys>? surveys;
  final List<RemoteExtraFieldEvents>? extraFieldEvents;

  const RemoteGetCompoundHomeSection({
    this.homeSections = const [],
    this.supportCategorys = const [],
    this.servicesCategorys = const [],
    this.events = const [],
    this.surveys = const [],
    this.extraFieldEvents = const [],
  });

  factory RemoteGetCompoundHomeSection.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetCompoundHomeSectionFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetCompoundHomeSectionToJson(this);
}

extension RemoteGetCompoundHomeSectionExtension
    on RemoteGetCompoundHomeSection? {
  GetCompoundHomeSection mapToDomain() => GetCompoundHomeSection(
        homeSections:
            this?.homeSections?.map((e) => e.mapToDomain()).toList() ?? [],
        supportCategorys:
            this?.supportCategorys?.map((e) => e.mapToDomain()).toList() ?? [],
        servicesCategorys:
            this?.servicesCategorys?.map((e) => e.mapToDomain()).toList() ?? [],
        events: this?.events?.map((e) => e.mapToDomain()).toList() ?? [],
        surveys: this?.surveys?.map((e) => e.mapToDomain()).toList() ?? [],
        extraFieldEvents:
            this?.extraFieldEvents?.map((e) => e.mapToDomain()).toList() ?? [],
      );
}

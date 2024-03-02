import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_compound_setting.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_list_of_multimedia_configuration.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_list_page_section.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_list_social_media.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/compound_setting.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_compound_configuration.g.dart';

@JsonSerializable()
class RemoteGetCompoundConfiguration {
  final int? vat;
  final int? tax;
  final List<RemoteListOfMultiMediaConfiguration>?
      listOfMultiMediaConfiguration;
  final List<RemoteListSocialMedia>? listSocialMedia;
  final List<RemoteListOfPageSections>? listOfPageSections;
  final RemoteCompoundsetting? compoundsetting;

  const RemoteGetCompoundConfiguration({
    this.vat,
    this.tax,
    this.listOfMultiMediaConfiguration,
    this.listSocialMedia,
    this.listOfPageSections,
    this.compoundsetting,
  });

  factory RemoteGetCompoundConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetCompoundConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetCompoundConfigurationToJson(this);
}

extension RemoteGetCompoundConfigurationExtension
    on RemoteGetCompoundConfiguration? {
  GetCompoundConfiguration toDomain() {
    return GetCompoundConfiguration(
      vat: this?.vat ?? 0,
      tax: this?.tax ?? 0,
      compoundsetting:
          this?.compoundsetting?.toDomain() ?? const Compoundsetting(),
      listOfMultiMediaConfiguration: this
              ?.listOfMultiMediaConfiguration
              ?.map((e) => e.toDomain())
              .toList() ??
          [],
      listSocialMedia:
          this?.listSocialMedia?.map((e) => e.toDomain()).toList() ?? [],
      listOfPageSections:
          this?.listOfPageSections?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

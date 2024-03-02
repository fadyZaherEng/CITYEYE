import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_compound_multimedia_type_configurations.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/compound_multimedia_type_configurations.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/list_of_multimedia_configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_list_of_multimedia_configuration.g.dart';

@JsonSerializable()
class RemoteListOfMultiMediaConfiguration {
  final int? id;
  final int? pageId;
  final String? pageCode;
  final List<RemoteCompoundMultiMediaConfigrationDtos>?
      compoundMultiMediaConfigrationDtos;

  const RemoteListOfMultiMediaConfiguration({
    this.id,
    this.pageId,
    this.pageCode,
    this.compoundMultiMediaConfigrationDtos,
  });

  factory RemoteListOfMultiMediaConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteListOfMultiMediaConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteListOfMultiMediaConfigurationToJson(this);
}

extension ListOfMultiMediaConfigurationExtension
    on RemoteListOfMultiMediaConfiguration? {
  ListOfMultiMediaConfiguration toDomain() {
    return ListOfMultiMediaConfiguration(
      id: this?.id ?? 0,
      pageId: this?.pageId ?? 0,
      pageCode: this?.pageCode ?? '',
      compoundMultiMediaConfigrationDtos:
          this?.compoundMultiMediaConfigrationDtos?.toDomain() ?? [],
    );
  }
}

import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_media_types.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/compound_multimedia_type_configurations.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/media_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_compound_multimedia_type_configurations.g.dart';

@JsonSerializable()
class RemoteCompoundMultiMediaConfigrationDtos {
  final int? id;
  final bool? isVisible;
  final int? minCount;
  final int? maxCount;
  final int? maxTime;
  final int? maxSize;
  final bool? isMulti;
  final RemoteMultiMediaType? multiMediaType;

  const RemoteCompoundMultiMediaConfigrationDtos({
    this.id,
    this.isVisible,
    this.minCount,
    this.maxCount,
    this.maxTime,
    this.maxSize,
    this.isMulti,
    this.multiMediaType,
  });

  factory RemoteCompoundMultiMediaConfigrationDtos.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteCompoundMultiMediaConfigrationDtosFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteCompoundMultiMediaConfigrationDtosToJson(this);
}

extension RemoteCompoundMultiMediaConfigrationDtosX
    on RemoteCompoundMultiMediaConfigrationDtos? {
  CompoundMultiMediaConfigrationDtos toDomain() {
    return CompoundMultiMediaConfigrationDtos(
      id: this?.id ?? 0,
      isVisible: this?.isVisible ?? false,
      minCount: this?.minCount ?? 0,
      maxCount: this?.maxCount ?? 0,
      maxTime: this?.maxTime ?? 0,
      maxSize: this?.maxSize ?? 0,
      isMulti: this?.isMulti ?? false,
      multiMediaType:
          this?.multiMediaType?.toDomain() ?? const MultiMediaType(),
    );
  }
}

extension RemoteCompoundMultiMediaConfigrationDtosListX
    on List<RemoteCompoundMultiMediaConfigrationDtos>? {
  List<CompoundMultiMediaConfigrationDtos> toDomain() {
    return this?.map((e) => e.toDomain()).toList() ?? [];
  }
}

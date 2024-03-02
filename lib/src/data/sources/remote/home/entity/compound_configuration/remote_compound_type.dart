import 'package:city_eye/src/domain/entities/home/city_eye/compound_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_compound_type.g.dart';

@JsonSerializable()
class RemoteCompoundType {
  final int? id;
  final String? name;
  final String? code;

  const RemoteCompoundType({
    this.id,
    this.name,
    this.code,
  });

  factory RemoteCompoundType.fromJson(Map<String, dynamic> json) =>
      _$RemoteCompoundTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCompoundTypeToJson(this);
}

extension RemoteCompoundTypeX on RemoteCompoundType? {
  CompoundType toDomain() {
    return CompoundType(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      code: this?.code ?? '',
    );
  }
}

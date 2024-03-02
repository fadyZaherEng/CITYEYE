import 'package:city_eye/src/domain/entities/home/security/compount_unit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_compunt_units.g.dart';

@JsonSerializable()
class RemoteCompoundUnits {
  final int? id;
  final String? name;
  final String? unitNO;

  const RemoteCompoundUnits({
    this.id,
    this.name,
    this.unitNO,
  });

  factory RemoteCompoundUnits.fromJson(Map<String, dynamic> json) =>
      _$RemoteCompoundUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCompoundUnitsToJson(this);
}

extension RemoteCompoundUnitsExtention on RemoteCompoundUnits? {
  CompoundUnits mapToDomain() {
    return CompoundUnits(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      unitNO: this?.unitNO ?? "",
    );
  }
}

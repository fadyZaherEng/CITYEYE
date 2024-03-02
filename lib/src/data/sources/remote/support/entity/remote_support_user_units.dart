import 'package:city_eye/src/domain/entities/support/support_user_units.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_support_user_units.g.dart';

@JsonSerializable()
final class RemoteSupportUserUnits {
  final int? unitId;
  final int? unitNumber;
  final String? name;

  const RemoteSupportUserUnits({
    this.unitId = 0,
    this.unitNumber = 0,
    this.name = "",
  });

  factory RemoteSupportUserUnits.fromJson(Map<String, dynamic> json) =>
      _$RemoteSupportUserUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSupportUserUnitsToJson(this);
}

extension RemoteSupportUserUnitsExtension on RemoteSupportUserUnits? {
  SupportUserUnits mapToDomain() => SupportUserUnits(
        unitId: this?.unitId ?? 0,
        unitNumber: this?.unitNumber ?? 0,
        name: this?.name ?? "",
      );
}

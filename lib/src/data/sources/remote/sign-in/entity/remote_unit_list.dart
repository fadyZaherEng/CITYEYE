import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_unit_list.g.dart';

@JsonSerializable()
class RemoteUnitLists {
  final int? id;
  final int? compoundId;
  final String? compoundName;
  final int? unitId;
  final String? unitNo;
  final String? unitName;
  final String? compoundLogo;
  final String? address;
  final bool? isActive;
  final int? userTypeId;
  final String? userTypeName;
  final String? userUnitContractEndDate;
  final bool? isCompoundVerified;

  const RemoteUnitLists({
    this.id,
    this.compoundId,
    this.compoundName,
    this.unitId,
    this.unitNo,
    this.unitName,
    this.compoundLogo,
    this.address,
    this.isActive,
    this.userTypeId,
    this.userTypeName,
    this.userUnitContractEndDate,
    this.isCompoundVerified,
  });

  factory RemoteUnitLists.fromJson(Map<String, dynamic> json) =>
      _$RemoteUnitListsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUnitListsToJson(this);
}

extension RemoteUnitListsExtension on RemoteUnitLists? {
  UnitLists mapToDomain() => UnitLists(
        id: this?.id ?? 0,
        compoundId: this?.compoundId ?? 0,
        compoundName: this?.compoundName ?? "",
        unitId: this?.unitId ?? 0,
        unitNo: this?.unitNo ?? "",
        unitName: this?.unitName ?? "",
        compoundLogo: this?.compoundLogo ?? "",
        address: this?.address ?? "",
        isActive: this?.isActive ?? false,
        userTypeId: this?.userTypeId ?? 0,
        userTypeName: this?.userTypeName ?? "",
        userUnitContractEndDate: this?.userUnitContractEndDate ?? "",
        isCompoundVerified: this?.isCompoundVerified ?? false,
      );
}

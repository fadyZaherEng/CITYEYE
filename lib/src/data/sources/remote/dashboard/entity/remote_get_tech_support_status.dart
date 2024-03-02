import 'package:city_eye/src/domain/entities/dashboard/get_tech_support_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_tech_support_status.g.dart';

@JsonSerializable()
class RemoteGetTechSupportStatus {
  final int? id;
  final String? name;
  final String? code;
  final String? extraValue1;
  final dynamic extraValue2;
  final dynamic parentId;
  final String? logo;
  final int? sortNo;

  const RemoteGetTechSupportStatus({
    this.id,
    this.name,
    this.code,
    this.extraValue1,
    this.extraValue2,
    this.parentId,
    this.logo,
    this.sortNo,
  });

  factory RemoteGetTechSupportStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetTechSupportStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetTechSupportStatusToJson(this);

  @override
  String toString() {
    return "$id $name $code $extraValue1 $extraValue2 $parentId $logo $sortNo";
  }
}

extension RemoteGetTechSupportStatusExtension on RemoteGetTechSupportStatus {
  GetTechSupportStatus toDomain() {
    return GetTechSupportStatus(
      id: id ?? 0,
      name: name ?? '',
      code: code ?? '',
      extraValue1: extraValue1 ?? '',
      extraValue2: extraValue2 ?? '',
      parentId: parentId ?? 0,
      logo: logo ?? '',
      sortNo: sortNo ?? 0,
    );
  }
}

extension GetTechSupportStatusListExtension
    on List<RemoteGetTechSupportStatus>? {
  List<GetTechSupportStatus> toDomain() {
    return this?.map((e) => e.toDomain()).toList() ?? [];
  }
}

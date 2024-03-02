import 'package:city_eye/src/domain/entities/dashboard/get_qr_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_qr_status.g.dart';

@JsonSerializable()
class RemoteGetQrStatus {
  final int? id;
  final String? name;
  final String? code;
  final String? extraValue1;
  final String? extraValue2;
  final dynamic parentId;
  final String? logo;
  final int? sortNo;

  const RemoteGetQrStatus({
    this.id,
    this.name,
    this.code,
    this.extraValue1,
    this.extraValue2,
    this.parentId,
    this.logo,
    this.sortNo,
  });

  factory RemoteGetQrStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetQrStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetQrStatusToJson(this);

  @override
  String toString() {
    return "$id $name $code $extraValue1 $extraValue2 $parentId $logo $sortNo";
  }
}

extension RemoteGetQrStatusExtension on RemoteGetQrStatus {
  GetQrStatus toDomain() {
    return GetQrStatus(
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

extension GetQrStatusListExtension on List<RemoteGetQrStatus>? {
  List<GetQrStatus> toDomain() {
    return this?.map((e) => e.toDomain()).toList() ?? [];
  }
}

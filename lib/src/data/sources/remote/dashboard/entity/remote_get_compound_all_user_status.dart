import 'package:city_eye/src/domain/entities/dashboard/get_compound_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_compound_all_user_status.g.dart';

@JsonSerializable()
class RemoteGetCompoundAllUserStatus {
  final int? active;
  final int? pending;
  final int? notActive;

  const RemoteGetCompoundAllUserStatus({
    this.active,
    this.pending,
    this.notActive,
  });

  factory RemoteGetCompoundAllUserStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetCompoundAllUserStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetCompoundAllUserStatusToJson(this);
}

extension RemoteGetCompoundAllUserExtension on RemoteGetCompoundAllUserStatus? {
  GetCompoundAllUserStatus toDomain() {
    return GetCompoundAllUserStatus(
      active: this?.active ?? 0,
      pending: this?.pending ?? 0,
      notActive: this?.notActive ?? 0,
    );
  }
}

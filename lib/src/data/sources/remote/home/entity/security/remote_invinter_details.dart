import 'package:city_eye/src/domain/entities/home/security/inviter_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_invinter_details.g.dart';

@JsonSerializable()
class RemoteInviterDetails {
  final int? inviterId;
  final String? inviterName;
  final String? inviterPhoneNumber;

  const RemoteInviterDetails({
    this.inviterId,
    this.inviterName,
    this.inviterPhoneNumber,
  });

  factory RemoteInviterDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteInviterDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteInviterDetailsToJson(this);
}

extension RemoteInviterDetailsExtention on RemoteInviterDetails? {
  InviterDetails mapToDomain() {
    return InviterDetails(
      inviterId: this?.inviterId ?? 0,
      inviterName: this?.inviterName ?? "",
      inviterPhoneNumber: this?.inviterPhoneNumber ?? "",
    );
  }
}

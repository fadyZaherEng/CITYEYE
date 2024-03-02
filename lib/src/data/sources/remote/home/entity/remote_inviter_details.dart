import 'package:city_eye/src/domain/entities/home/inviter_details.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_inviter_details.g.dart';

@JsonSerializable()
final class RemoteInviterDetails {
  final int? inviterId;
  final String? inviterName;
  final String? inviterPhoneNumber;

  const RemoteInviterDetails({
    this.inviterId = -1,
    this.inviterName = "",
    this.inviterPhoneNumber = "",
  });

  factory RemoteInviterDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteInviterDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteInviterDetailsToJson(this);
}

extension RemoteInviterDetailsExtension on RemoteInviterDetails? {
  InviterDetails mapToDomain() => InviterDetails(
        inviterId: this?.inviterId ?? -1,
        inviterName: this?.inviterName ?? "",
        inviterPhoneNumber: this?.inviterPhoneNumber ?? "",
      );
}

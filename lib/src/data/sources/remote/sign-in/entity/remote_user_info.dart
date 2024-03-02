import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user_info.g.dart';

@JsonSerializable()
class RemoteUserInfo {
  final int? id;
  final String? userName;
  final String? fullName;
  final String? email;
  final String? mobile;
  final String? image;
  final bool? status;
  final bool? otpStatus;
  final int? subscriberId;

  const RemoteUserInfo({
    this.id,
    this.userName,
    this.fullName,
    this.email,
    this.mobile,
    this.image,
    this.status,
    this.otpStatus,
    this.subscriberId,
  });

  factory RemoteUserInfo.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserInfoToJson(this);
}

extension RemoteUserInfoExtension on RemoteUserInfo? {
  UserInfo mapToDomain() => UserInfo(
        id: this?.id ?? 0,
        userName: this?.userName ?? "",
        fullName: this?.fullName ?? "",
        email: this?.email ?? "",
        mobile: this?.mobile ?? "",
        image: this?.image ?? "",
        status: this?.status ?? false,
        otpStatus: this?.otpStatus ?? false,
        subscriberId: this?.subscriberId ?? 0,
      );
}

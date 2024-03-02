import 'package:city_eye/src/domain/entities/home/security/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user.g.dart';

@JsonSerializable()
class RemoteUser {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'mobile')
  final String? mobile;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'subscriberId')
  final int? subscriberId;
  @JsonKey(name: 'status')
  final dynamic status;
  @JsonKey(name: 'otpStatus')
  final dynamic otpStatus;
  @JsonKey(name: 'contractDate')
  final dynamic contractDate;

  const RemoteUser({
    this.id,
    this.userName,
    this.fullName,
    this.email,
    this.mobile,
    this.image,
    this.subscriberId,
    this.status,
    this.otpStatus,
    this.contractDate,
  });

  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserToJson(this);
}

extension RemoteUserExtention on RemoteUser? {
  User mapToDomain() {
    return User(
      id: this?.id ?? 0,
      userName: this?.userName ?? "",
      fullName: this?.fullName ?? "",
      email: this?.email ?? "",
      mobile: this?.mobile ?? "",
      image: this?.image ?? "",
      subscriberId: this?.subscriberId ?? 0,
      status: this?.status?.mapToDomain(),
      otpStatus: this?.otpStatus?.mapToDomain(),
      contractDate: this?.contractDate?.mapToDomain(),
    );
  }
}

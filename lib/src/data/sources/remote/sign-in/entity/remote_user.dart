import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_user_device_info.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_user_type.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user.g.dart';

@JsonSerializable(explicitToJson: true)
final class RemoteUser {
  final int? id;
  final String? name;
  final String? email;
  final String? mobileNumber;
  final String? image;
  final int? compoundId;
  final String? compoundName;
  final RemoteUserType? userType;
  final RemoteUserDeviceInfo? userDeviceInfo;
  final String? token;

  const RemoteUser({
    this.id = -1,
    this.name = "",
    this.email = "",
    this.mobileNumber = "",
    this.image = "",
    this.compoundId = -1,
    this.compoundName = "",
    this.userType = const RemoteUserType(),
    this.token = "",
    this.userDeviceInfo = const RemoteUserDeviceInfo(),
  });

  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserToJson(this);
}

extension RemoteUserExtension on RemoteUser? {
  User mapToDomain() => User(
        id: this?.id ?? -1,
        name: this?.name ?? "",
        email: this?.email ?? "",
        mobileNumber: this?.mobileNumber ?? "",
        image: this?.image ?? "",
        compoundId: this?.compoundId ?? -1,
        compoundName: this?.compoundName ?? "",
        userType: this!.userType.mapToDomain(),
        token: this?.token ?? "",
      );
}

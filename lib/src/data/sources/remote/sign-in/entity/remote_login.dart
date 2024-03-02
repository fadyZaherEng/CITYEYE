import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_unit_list.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_user_device_info.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_user_info.dart';
import 'package:city_eye/src/domain/entities/sign_in/log_in.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_device_info.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_login.g.dart';

@JsonSerializable()
class RemoteLogin {
  final RemoteUserInfo? userInfo;
  final List<RemoteUnitLists>? unitLists;
  final String? token;
  final RemoteUserDeviceInfo? userDeviceInfo;

  const RemoteLogin({
    this.userInfo,
    this.unitLists,
    this.token,
    this.userDeviceInfo,
  });

  factory RemoteLogin.fromJson(Map<String, dynamic> json) =>
      _$RemoteLoginFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLoginToJson(this);
}

extension RemoteLoginExtension on RemoteLogin? {
  Login mapToDomain() => Login(
        userInfo: this?.userInfo?.mapToDomain() ?? const UserInfo(),
        unitLists: this?.unitLists?.map((e) => e.mapToDomain()).toList() ?? [],
        token: this?.token ?? "",
        userDeviceInfo:
            this?.userDeviceInfo?.mapToDomain() ?? const UserDeviceInfo(),
      );
}

import 'package:city_eye/src/domain/entities/sign_in/user_device_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user_device_info.g.dart';

@JsonSerializable()
class RemoteUserDeviceInfo {
  final String? deviceToken;
  final bool? isAllowNotification;
  final bool? isCurrentActive;
  final String? lastLangCode;

  const RemoteUserDeviceInfo({
    this.deviceToken,
    this.isAllowNotification,
    this.isCurrentActive,
    this.lastLangCode,
  });

  factory RemoteUserDeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserDeviceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserDeviceInfoToJson(this);
}

extension RemoteUserDeviceInfoExtension on RemoteUserDeviceInfo? {
  UserDeviceInfo mapToDomain() => UserDeviceInfo(
        deviceToken: this?.deviceToken ?? "",
        isAllowNotification: this?.isAllowNotification ?? false,
        isCurrentActive: this?.isCurrentActive ?? false,
        lastLangCode: this?.lastLangCode ?? "",
      );
}

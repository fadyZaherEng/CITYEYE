import 'package:equatable/equatable.dart';

class UserDeviceInfo extends Equatable {
  final String deviceToken;
  final bool isAllowNotification;
  final bool isCurrentActive;
  final String lastLangCode;

  const UserDeviceInfo({
    this.deviceToken = "",
    this.isAllowNotification = false,
    this.isCurrentActive = false,
    this.lastLangCode = "",
  });

  @override
  List<Object?> get props =>
      [deviceToken, isAllowNotification, isCurrentActive, lastLangCode];

  Map<String, dynamic> toMap() {
    return {
      'deviceToken': deviceToken,
      'isAllowNotification': isAllowNotification,
      'isCurrentActive': isCurrentActive,
      'lastLangCode': lastLangCode,
    };
  }

  factory UserDeviceInfo.fromMap(Map<String, dynamic> map) {
    return UserDeviceInfo(
      deviceToken: map['deviceToken'] as String,
      isAllowNotification: map['isAllowNotification'] as bool,
      isCurrentActive: map['isCurrentActive'] as bool,
      lastLangCode: map['lastLangCode'] as String,
    );
  }
}

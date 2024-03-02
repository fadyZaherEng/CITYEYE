import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_device_info.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final UserInfo userInfo;
  final List<UnitLists> unitLists;
  final String token;
  final UserDeviceInfo userDeviceInfo;

  const Login({
    this.userInfo = const UserInfo(),
    this.unitLists = const [],
    this.token = "",
    this.userDeviceInfo = const UserDeviceInfo(),
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        userInfo,
        unitLists,
        token,
        userDeviceInfo,
      ];

  Map<String, dynamic> toMap() {
    return {
      'userInfo': userInfo.toMap(),
      'unitLists': unitLists.map((e) => e.toMap()).toList(),
      'token': token,
      'userDeviceInfo': userDeviceInfo.toMap(),
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      userInfo: map['userInfo'] as UserInfo,
      unitLists: map['unitLists'] as List<UnitLists>,
      token: map['token'] as String,
      userDeviceInfo: map['userDeviceInfo'] as UserDeviceInfo,
    );
  }
}

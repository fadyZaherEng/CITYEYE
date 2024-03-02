import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final int id;
  final String userName;
  final String fullName;
  final String email;
  final String mobile;
  final String image;
  final bool status;
  final bool otpStatus;
  final int subscriberId;

  const UserInfo({
    this.id = 0,
    this.userName = "",
    this.fullName = "",
    this.email = "",
    this.mobile = "",
    this.image = "",
    this.status = false,
    this.otpStatus = false,
    this.subscriberId = 0,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        fullName,
        email,
        mobile,
        image,
        status,
        otpStatus,
        subscriberId,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'fullName': fullName,
      'email': email,
      'mobile': mobile,
      'image': image,
      'status': status,
      'otpStatus': otpStatus,
      'subscriberId': subscriberId,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id'] as int,
      userName: map['userName'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
      image: map['image'] as String,
      status: map['status'] as bool,
      otpStatus: map['otpStatus'] as bool,
      subscriberId: map['subscriberId'] as int,
    );
  }
}

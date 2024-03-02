import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String userName;
  final String fullName;
  final String email;
  final String mobile;
  final String image;
  final int subscriberId;
  final dynamic status;
  final dynamic otpStatus;
  final dynamic contractDate;

  const User({
    this.id = 0,
    this.userName = "",
    this.fullName = "",
    this.email = "",
    this.mobile = "",
    this.image = "",
    this.subscriberId = 0,
    this.status = "",
    this.otpStatus = "",
    this.contractDate = "",
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        fullName,
        email,
        mobile,
        image,
        subscriberId,
        status,
        otpStatus,
        contractDate,
      ];
}

import 'package:city_eye/src/domain/entities/sign_in/user_device_info.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_type.dart';
import 'package:equatable/equatable.dart';

final class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String mobileNumber;
  final String image;
  final int compoundId;
  final String compoundName;
  final UserType userType;
  final String token;
  final UserDeviceInfo deviceInfo;

  const User({
    this.id = -1,
    this.name = "",
    this.email = "",
    this.mobileNumber = "",
    this.image = "",
    this.compoundId = -1,
    this.compoundName = "",
    this.userType = const UserType(),
    this.token = "",
    this.deviceInfo = const UserDeviceInfo(),
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'image': image,
      'userType': userType.toJson(),
      'token': token,
      'compoundId': compoundId,
      'compoundName': compoundName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      mobileNumber: map['mobileNumber'] as String,
      image: map['image'] as String,
      compoundId: map['compoundId'] as int,
      compoundName: map['compoundName'] as String,
      userType: UserType.fromJson(map['userType']),
      token: map['token'] as String,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, mobileNumber: $mobileNumber, image: $image, userType: $userType}';
  }

  @override
  List<Object> get props => [
        id,
        name,
        email,
        mobileNumber,
        image,
        compoundId,
        compoundName,
        userType,
        token,
      ];

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? mobileNumber,
    String? image,
    int? compoundId,
    String? compoundName,
    UserType? userType,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      image: image ?? this.image,
      compoundId: compoundId ?? this.compoundId,
      compoundName: compoundName ?? this.compoundName,
      userType: userType ?? this.userType,
      token: token ?? this.token,
    );
  }
}

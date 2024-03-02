import 'package:city_eye/src/domain/entities/home/security/user.dart';
import 'package:city_eye/src/domain/entities/home/security/user_type.dart';
import 'package:equatable/equatable.dart';

class UserUnitInfo extends Equatable {
  final int id;
  final UserType userType;
  final User user;
  final String compoundName;
  final String unitNO;
  final String unitName;
  final String gasNO;
  final String telephone;

  const UserUnitInfo({
    this.id = 0,
    this.userType = const UserType(),
    this.user = const User(),
    this.compoundName = '',
    this.unitNO = '',
    this.unitName = '',
    this.gasNO = '',
    this.telephone = '',
  });

  @override
  List<Object?> get props =>
      [id, userType, user, compoundName, unitNO, unitName, gasNO, telephone];
}

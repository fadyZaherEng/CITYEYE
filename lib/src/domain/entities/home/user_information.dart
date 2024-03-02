import 'package:city_eye/src/presentation/screens/home/utils/home_enum.dart';

class UserInformation {
  final String image;
  final String name;
  final CityEyeUserType? personType;
  final String unitNumber;

  const UserInformation({
    this.image = "",
    this.name = "",
    this.personType,
    this.unitNumber = "",
  });
}

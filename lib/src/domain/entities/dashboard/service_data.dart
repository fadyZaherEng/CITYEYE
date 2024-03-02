import 'package:city_eye/src/domain/entities/dashboard/service_category.dart';

class ServiceData {
  ServiceCategory serviceCategory;
  int countOfUsers;

  ServiceData({
    this.serviceCategory = const ServiceCategory(),
    this.countOfUsers = 0,
  });
}

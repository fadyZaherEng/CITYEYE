import 'package:city_eye/src/domain/entities/home/security/service_category.dart';
import 'package:equatable/equatable.dart';

class ServicePackages extends Equatable {
  final int id;
  final String name;
  final bool isCountType;
  final ServiceCategory serviceCategory;

  const ServicePackages({
    this.id = 0,
    this.name = "",
    this.isCountType = false,
    this.serviceCategory = const ServiceCategory(),
  });

  @override
  List<Object?> get props => [id, name, isCountType, serviceCategory];
}

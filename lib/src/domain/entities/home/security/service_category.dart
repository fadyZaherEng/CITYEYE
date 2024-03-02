import 'package:city_eye/src/domain/entities/home/security/parent.dart';
import 'package:equatable/equatable.dart';

class ServiceCategory extends Equatable {
  final int id;
  final String name;
  final String code;
  final String logo;
  final Parent parent;

  const ServiceCategory({
    this.id = 0,
    this.name = "",
    this.code = "",
    this.logo = "",
    this.parent = const Parent(),
  });

  @override
  List<Object?> get props => [id, name, code, logo, parent];
}

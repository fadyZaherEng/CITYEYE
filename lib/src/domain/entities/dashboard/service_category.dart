import 'package:equatable/equatable.dart';

class ServiceCategory extends Equatable {
  final int id;
  final String name;
  final String code;
  final String logo;

  const ServiceCategory({
    this.id = 0,
    this.name = "",
    this.code = "",
    this.logo = "",
  });

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        logo,
      ];
}

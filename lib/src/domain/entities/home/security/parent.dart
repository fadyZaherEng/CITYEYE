import 'package:equatable/equatable.dart';

class Parent extends Equatable {
  final int id;
  final String name;
  final String code;
  final String logo;

  const Parent({
    this.id = 0,
    this.name = "",
    this.code = "",
    this.logo = "",
  });

  @override
  List<Object?> get props => [id, name, code, logo];
}

import 'package:equatable/equatable.dart';

class UserType extends Equatable {
  final int id;
  final String name;
  final String code;

  const UserType({
    this.id = 0,
    this.name = "",
    this.code = "",
  });

  @override
  List<Object?> get props => [id, name, code];
}

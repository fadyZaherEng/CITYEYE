import 'package:equatable/equatable.dart';

class GuestType extends Equatable {
  final int id;
  final String code;
  final String name;

  const GuestType({
    this.id = 0,
    this.code = '',
    this.name = '',
  });

  @override
  List<Object?> get props => [id, code, name];
}

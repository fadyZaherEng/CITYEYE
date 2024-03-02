import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final int id;
  final String code;
  final String name;
  final String color;

  const Status({
    this.id = 0,
    this.code = '',
    this.name = '',
    this.color = '',
  });

  @override
  List<Object?> get props => [id, code, name, color];
}

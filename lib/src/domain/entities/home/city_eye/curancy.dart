import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final int id;
  final String name;

  const Currency({
    this.id = 0,
    this.name = '',
  });

  @override
  List<Object?> get props => [id, name];
}

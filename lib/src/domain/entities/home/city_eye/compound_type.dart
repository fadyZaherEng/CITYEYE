import 'package:equatable/equatable.dart';

class CompoundType extends Equatable {
  final int id;
  final String name;
  final String code;

  const CompoundType({
    this.id = 0,
    this.name = '',
    this.code = '',
  });

  @override
  List<Object?> get props => [id, name, code];
}

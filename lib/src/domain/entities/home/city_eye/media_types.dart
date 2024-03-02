import 'package:equatable/equatable.dart';

class MultiMediaType extends Equatable {
  final int id;
  final String code;

  const MultiMediaType({
    this.id = 0,
    this.code = '',
  });

  @override
  List<Object?> get props => [id, code];
}

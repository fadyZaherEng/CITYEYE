import 'package:equatable/equatable.dart';

class QrType extends Equatable {
  final int id;
  final String name;
  final String code;

  const QrType({
    this.id = 0,
    this.name = '',
    this.code = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, code];
}

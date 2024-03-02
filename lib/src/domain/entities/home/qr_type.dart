import 'package:equatable/equatable.dart';

final class QrType extends Equatable {
  final int id;
  final String code;
  final String name;

  const QrType({
    this.id = 0,
    this.code = "",
    this.name = "",
  });

  @override
  String toString() {
    return 'QrType{name: $name}';
  }

  @override
  List<Object> get props => [id, code, name];

  QrType copyWith({
    int? id,
    String? code,
    String? name,
  }) {
    return QrType(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }
}

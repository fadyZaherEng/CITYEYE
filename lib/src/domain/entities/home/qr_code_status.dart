import 'package:equatable/equatable.dart';

final class QrCodeStatus extends Equatable {
  final int id;
  final String code;
  final String name;
  final String color;

  const QrCodeStatus({
    this.id = 0,
    this.code = "",
    this.name = "",
    this.color = "",
  });

  @override
  List<Object> get props => [id, code, name, color];

  QrCodeStatus copyWith({
    int? id,
    String? code,
    String? name,
    String? color,
  }) {
    return QrCodeStatus(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}

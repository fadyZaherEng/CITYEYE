import 'package:equatable/equatable.dart';

final class GuestType extends Equatable {
  final int id;
  final String code;
  final String name;

  const GuestType({
    this.id = 0,
    this.code = "",
    this.name = "",
  });

  @override
  List<Object> get props => [id, code, name];

  GuestType copyWith({
    int? id,
    String? code,
    String? name,
  }) {
    return GuestType(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }
}

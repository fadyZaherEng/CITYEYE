import 'package:equatable/equatable.dart';

final class WeekDays extends Equatable {
  final int id;
  final String code;
  final String name;

  const WeekDays({
    this.id = 0,
    this.code = "",
    this.name = "",
  });

  @override
  List<Object?> get props => [id, code, name];

  WeekDays copyWith({
    int? id,
    String? code,
    String? name,
  }) {
    return WeekDays(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }
}

import 'package:equatable/equatable.dart';

final class UserUnits extends Equatable {
  final int id;
  final String number;
  final String name;

  const UserUnits({
    this.id = 0,
    this.number = "",
    this.name = "",
  });

  UserUnits copyWith({
    int? id,
    String? number,
    String? name,
  }) {
    return UserUnits(
      id: id ?? this.id,
      number: number ?? this.number,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [id, number, name];
}

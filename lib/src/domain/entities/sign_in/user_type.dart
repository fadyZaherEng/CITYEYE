import 'package:equatable/equatable.dart';

final class UserType extends Equatable {
  final int id;
  final String name;
  final String code;

  const UserType({
    this.id = -1,
    this.name = "",
    this.code = "",
  });

  @override
  List<Object> get props => [id, name, code];

  UserType copyWith({
    int? id,
    String? name,
    String? code,
  }) {
    return UserType(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }

  factory UserType.fromJson(Map<String, dynamic> map) {
    return UserType(
      id: map['id'] as int,
      name: map['name'] as String,
      code: map['code'] as String,
    );
  }
}

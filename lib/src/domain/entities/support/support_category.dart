import 'package:equatable/equatable.dart';

final class SupportCategory extends Equatable {
  final int id;
  final String code;
  final String name;
  final String logo;

  const SupportCategory({
    this.id = 0,
    this.code = "",
    this.name = "",
    this.logo = "",
  });

  @override
  List<Object> get props => [id, code, name, logo];

  SupportCategory copyWith({
    int? id,
    String? code,
    String? name,
    String? logo,
  }) {
    return SupportCategory(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }
}

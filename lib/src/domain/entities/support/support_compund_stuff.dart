import 'package:equatable/equatable.dart';

final class SupportCompoundStuff extends Equatable {
  final int id;
  final String name;

  const SupportCompoundStuff({
    this.id = 0,
    this.name = "",
  });

  @override
  List<Object> get props => [id, name];

  SupportCompoundStuff copyWith({
    int? id,
    String? name,
  }) {
    return SupportCompoundStuff(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final int id;
  final String name;
  final String image;
  final String code;

  const Language({
    required this.id,
    required this.name,
    required this.image,
    required this.code,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        code,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'code': code,
    };
  }

  factory Language.fromJson(Map<String, dynamic> map) {
    return Language(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      code: map['code'] as String,
    );
  }

  Language copyWith({
    int? id,
    String? name,
    String? image,
    String? code,
  }) {
    return Language(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      code: code ?? this.code,
    );
  }
}

import 'package:equatable/equatable.dart';

class HomeQuestionTypeRules extends Equatable {
  final int id;
  final String code;

  const HomeQuestionTypeRules({
    this.id = 0,
    this.code = "",
  });

  @override
  List<Object?> get props => [
        id,
        code,
      ];
}

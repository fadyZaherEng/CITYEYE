import 'package:city_eye/src/domain/entities/home/city_eye/home_question_type_rules.dart';
import 'package:equatable/equatable.dart';

class HomeFormControlsValidation extends Equatable {
  final int id;
  final HomeQuestionTypeRules questionTypeRules;

  const HomeFormControlsValidation({
    this.id = 0,
    this.questionTypeRules = const HomeQuestionTypeRules(),
  });

  @override
  List<Object?> get props => [
        id,
        questionTypeRules,
      ];
}

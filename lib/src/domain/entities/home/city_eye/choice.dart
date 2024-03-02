import 'package:equatable/equatable.dart';

class HomeChoice extends Equatable {
  final int id;
  final String value;
  final int countAnswer;

  const HomeChoice({
    this.id = 0,
    this.value = "",
    this.countAnswer = 0,
  });

  @override
  List<Object?> get props => [
        id,
        value,
        countAnswer,
      ];
}

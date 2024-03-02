import 'package:equatable/equatable.dart';

final class Choice extends Equatable {
  final int optionId;
  final String optionValue;

  const Choice({
    this.optionId = 0,
    this.optionValue = "",
  });

  Choice copyWith({
    int? optionId,
    String? optionValue,
  }) =>
      Choice(
        optionId: optionId ?? this.optionId,
        optionValue: optionValue ?? this.optionValue,
      );

  @override
  List<Object> get props => [optionId, optionValue];
}

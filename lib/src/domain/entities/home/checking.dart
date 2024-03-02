import 'package:equatable/equatable.dart';

final class Checking extends Equatable {
  final bool isChecked;

  const Checking({this.isChecked = false});

  Checking copyWith({
    bool? isChecked,
  }) {
    return Checking(
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object> get props => [isChecked];
}

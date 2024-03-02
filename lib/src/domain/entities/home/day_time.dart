import 'package:equatable/equatable.dart';

class DayTime extends Equatable {
  final int id;
  final String fromTime;
  final String toTime;

  const DayTime({
    this.id = 0,
    this.fromTime = "",
    this.toTime = "",
  });

  @override
  List<Object> get props => [
        id,
        fromTime,
        toTime,
      ];
}

import 'package:city_eye/src/domain/entities/home/day_time.dart';
import 'package:city_eye/src/domain/entities/home/security/week_days.dart';
import 'package:equatable/equatable.dart';

final class UnitsQrCodeDays extends Equatable {
  final int id;
  final int unitsQRCodeId;
  final WeekDays weekDays;
  final DayTime dayTime;

  const UnitsQrCodeDays({
    this.id = 0,
    this.unitsQRCodeId = 0,
    this.weekDays = const WeekDays(),
    this.dayTime = const DayTime(),
  });

  UnitsQrCodeDays copyWith({
    int? id,
    int? unitsQRCodeId,
    WeekDays? weekDays,
    DayTime? dayTime,
  }) {
    return UnitsQrCodeDays(
      id: id ?? this.id,
      unitsQRCodeId: unitsQRCodeId ?? this.unitsQRCodeId,
      weekDays: weekDays ?? this.weekDays,
      dayTime: dayTime ?? this.dayTime,
    );
  }

  @override
  List<Object> get props => [
        id,
        unitsQRCodeId,
        weekDays,
        dayTime,
      ];
}

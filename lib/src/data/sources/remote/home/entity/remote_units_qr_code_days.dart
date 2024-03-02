import 'package:city_eye/src/data/sources/remote/home/entity/remote_week_days.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_day_time.dart';
import 'package:city_eye/src/domain/entities/home/units_qr_code_days.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_units_qr_code_days.g.dart';

@JsonSerializable(explicitToJson: true)
final class RemoteUnitsQrCodeDays {
  final int? id;
  final int? unitsQRCodeId;
  final RemoteWeekDays? weekDays;
  final RemoteDayTime? dayTime;

  const RemoteUnitsQrCodeDays({
    this.id = 0,
    this.unitsQRCodeId = 0,
    this.weekDays = const RemoteWeekDays(),
    this.dayTime = const RemoteDayTime(),
  });

  factory RemoteUnitsQrCodeDays.fromJson(Map<String, dynamic> json) =>
      _$RemoteUnitsQrCodeDaysFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUnitsQrCodeDaysToJson(this);
}

extension RemoteUnitsQrCodeDaysExtension on RemoteUnitsQrCodeDays {
  UnitsQrCodeDays mapToDomain() => UnitsQrCodeDays(
        id: id ?? -1,
        unitsQRCodeId: unitsQRCodeId ?? -1,
        weekDays: weekDays.mapToDomain(),
        dayTime: dayTime.mapToDomain(),
      );
}

extension RemoteUnitsQrCodeDaysListExtension on List<RemoteUnitsQrCodeDays>? {
  List<UnitsQrCodeDays> mapToDomain() =>
      this!.map((e) => e.mapToDomain()).toList();
}

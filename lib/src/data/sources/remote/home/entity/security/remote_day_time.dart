import 'package:city_eye/src/domain/entities/home/day_time.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_day_time.g.dart';

@JsonSerializable()
class RemoteDayTime {
  final int? id;
  final String? fromTime;
  final String? toTime;

  const RemoteDayTime({
    this.id = 0,
    this.fromTime = "",
    this.toTime = "",
  });

  factory RemoteDayTime.fromJson(Map<String, dynamic> json) => _$RemoteDayTimeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDayTimeToJson(this);
}

extension RemoteDayTimeExtension on RemoteDayTime? {
  DayTime mapToDomain() {
    return DayTime(
      id: this?.id ?? 0,
      fromTime: this?.fromTime ?? "",
      toTime: this?.toTime ?? "",
    );
  }
}

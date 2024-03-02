import 'package:city_eye/src/domain/entities/home/week_days.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_week_days.g.dart';

@JsonSerializable()
final class RemoteWeekDays {
  final int? id;
  final String? code;
  final String? name;

  const RemoteWeekDays({
    this.id = 0,
    this.code = "",
    this.name = "",
  });

  factory RemoteWeekDays.fromJson(Map<String, dynamic> json) =>
      _$RemoteWeekDaysFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteWeekDaysToJson(this);
}

extension RemoteWeekDaysExtension on RemoteWeekDays? {
  WeekDays mapToDomain() => WeekDays(
        id: this?.id ?? 0,
        code: this?.code ?? "",
        name: this?.name ?? "",
      );
}
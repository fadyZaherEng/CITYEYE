import 'package:city_eye/src/domain/entities/home/city_eye/event_option.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_event_option.g.dart';

@JsonSerializable()
class RemoteEventsOptions {
  final int? id;
  final String? name;
  final int? eventId;
  final bool? isJoin;
  final bool? isCalendar;
  final bool? isSelectedByUser;

  const RemoteEventsOptions({
    this.id = 0,
    this.name = "",
    this.eventId = 0,
    this.isJoin = false,
    this.isCalendar = false,
    this.isSelectedByUser = false,
  });

  factory RemoteEventsOptions.fromJson(Map<String, dynamic> json) =>
      _$RemoteEventsOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEventsOptionsToJson(this);
}

extension RemoteEventsOptionsExtension on RemoteEventsOptions? {
  EventsOptions mapToDomain() => EventsOptions(
        id: this?.id ?? 0,
        name: this?.name ?? "",
        eventId: this?.eventId ?? 0,
        isJoin: this?.isJoin ?? false,
        isCalendar: this?.isCalendar ?? false,
        isSelectedByUser: this?.isSelectedByUser ?? false,
      );
}

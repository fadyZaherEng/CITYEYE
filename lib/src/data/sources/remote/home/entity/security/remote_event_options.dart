import 'package:city_eye/src/domain/entities/home/security/event_options.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_event_options.g.dart';

@JsonSerializable()
class RemoteEventsOptions {
  final int? id;
  final String? name;
  final int? eventId;
  final bool? isCalendar;
  final bool? isSelectedByUser;

  const RemoteEventsOptions({
    this.id,
    this.name,
    this.eventId,
    this.isCalendar,
    this.isSelectedByUser,
  });

  factory RemoteEventsOptions.fromJson(Map<String, dynamic> json) =>
      _$RemoteEventsOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEventsOptionsToJson(this);
}

extension RemoteEventsOptionsExtention on RemoteEventsOptions? {
  EventsOptions mapToDomain() {
    return EventsOptions(
      name: this?.name ?? "",
      eventId: this?.eventId ?? 0,
      id: this?.id ?? 0,
      isCalendar: this?.isCalendar ?? false,
      isSelectedByUser: this?.isSelectedByUser ?? false,
    );
  }
}

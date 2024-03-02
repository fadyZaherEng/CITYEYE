import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_event_extra_filed.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_events.dart';
import 'package:city_eye/src/domain/entities/home/security/event_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_event_list.g.dart';

@JsonSerializable()
class RemoteEventList {
  final List<RemoteEvents>? events;
  final List<RemoteExtraFieldEvents>? extraFieldEvents;

  const RemoteEventList({
    this.events,
    this.extraFieldEvents,
  });

  factory RemoteEventList.fromJson(Map<String, dynamic> json) =>
      _$RemoteEventListFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEventListToJson(this);
}

extension RemoteEventListExtention on RemoteEventList? {
  EventList mapToDomain() {
    return EventList(
      events: this?.events?.map((e) => e.mapToDomain()).toList() ?? [],
      extraFieldEvents:
          this?.extraFieldEvents?.map((e) => e.mapToDomain()).toList() ?? [],
    );
  }
}

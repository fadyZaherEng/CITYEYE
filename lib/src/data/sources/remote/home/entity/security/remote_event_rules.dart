import 'package:city_eye/src/domain/entities/home/security/event_rules.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_event_rules.g.dart';

@JsonSerializable()
class RemoteEventsRules {
  final int? id;
  final String? description;
  final int? eventId;

  const RemoteEventsRules({
    this.id,
    this.description,
    this.eventId,
  });

  factory RemoteEventsRules.fromJson(Map<String, dynamic> json) =>
      _$RemoteEventsRulesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEventsRulesToJson(this);
}

extension RemoteEventRules on RemoteEventsRules? {
  EventsRules mapToDomain() {
    return EventsRules(
      id: this?.id ?? 0,
      description: this?.description ?? "",
      eventId: this?.eventId ?? 0,
    );
  }
}

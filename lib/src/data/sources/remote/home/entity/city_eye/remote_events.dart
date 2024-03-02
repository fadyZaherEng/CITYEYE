import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_event_option.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_event_rules.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/events.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_events.g.dart';

@JsonSerializable()
class RemoteEvents {
  final int? id;
  final String? title;
  final String? description;
  final String? startDate;
  final String? endDate;
  final String? openingDate;
  final String? closedDate;
  final bool? isPaid;
  final int? maxCountJoin;
  final int? memberCount;
  final String? locationAddress;
  final String? locationLatitude;
  final String? locationLongitude;
  final int? transactionId;
  final List<RemoteEventsOptions>? eventsOptions;
  final List<RemoteEventsRules>? eventsRules;
  final List<dynamic>? eventsAttachments;

  const RemoteEvents({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.startDate = "",
    this.endDate = "",
    this.openingDate = "",
    this.closedDate = "",
    this.isPaid = false,
    this.maxCountJoin = 0,
    this.memberCount = 0,
    this.locationAddress = "",
    this.locationLatitude = "",
    this.locationLongitude = "",
    this.transactionId = 0,
    this.eventsOptions = const [],
    this.eventsRules = const [],
    this.eventsAttachments = const [],
  });

  factory RemoteEvents.fromJson(Map<String, dynamic> json) =>
      _$RemoteEventsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEventsToJson(this);
}

extension RemoteEventsExtension on RemoteEvents? {
  Events mapToDomain() => Events(
        id: this?.id ?? 0,
        title: this?.title ?? "",
        description: this?.description ?? "",
        startDate: this?.startDate ?? "",
        endDate: this?.endDate ?? "",
        openingDate: this?.openingDate ?? "",
        closedDate: this?.closedDate ?? "",
        isPaid: this?.isPaid ?? false,
        maxCountJoin: this?.maxCountJoin ?? 0,
        memberCount: this?.memberCount ?? 0,
        locationAddress: this?.locationAddress ?? "",
        locationLatitude: this?.locationLatitude ?? "",
        locationLongitude: this?.locationLongitude ?? "",
        transactionId: this?.transactionId ?? 0,
        eventsOptions:
            this?.eventsOptions?.map((e) => e.mapToDomain()).toList() ?? [],
        eventsRules:
            this?.eventsRules?.map((e) => e.mapToDomain()).toList() ?? [],
        eventsAttachments: this?.eventsAttachments ?? [],
      );
}

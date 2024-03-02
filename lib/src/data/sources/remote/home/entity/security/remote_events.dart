import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_event_options.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_event_rules.dart';
import 'package:city_eye/src/domain/entities/home/security/events.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_events.g.dart';

@JsonSerializable()
class RemoteEvents {
  final int? id;
  final String? title;
  final String? description;
  final String? startDate;
  final String? endDate;
  final bool? isPaid;
  final int? maxCountJoin;
  final int? memberCount;
  final int? memberPrice;
  final String? locationAddress;
  final String? locationLatitude;
  final String? locationLongitude;
  final int? transactionId;
  final String? calendarRef;
  final List<RemoteEventsOptions>? eventsOptions;
  final List<RemoteEventsRules>? eventsRules;
  final List<dynamic>? eventsAttachments;

  const RemoteEvents({
    this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.isPaid,
    this.maxCountJoin,
    this.memberCount,
    this.memberPrice,
    this.locationAddress,
    this.locationLatitude,
    this.locationLongitude,
    this.transactionId,
    this.calendarRef,
    this.eventsOptions,
    this.eventsRules,
    this.eventsAttachments,
  });

  factory RemoteEvents.fromJson(Map<String, dynamic> json) =>
      _$RemoteEventsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteEventsToJson(this);
}

extension RemoteEventsExtention on RemoteEvents? {
  Events mapToDomain() {
    return Events(
      calendarRef: this?.calendarRef ?? "",
      description: this?.description ?? "",
      id: this?.id ?? 0,
      isPaid: this?.isPaid ?? false,
      locationAddress: this?.locationAddress ?? "",
      locationLatitude: this?.locationLatitude ?? "",
      locationLongitude: this?.locationLongitude ?? "",
      maxCountJoin: this?.maxCountJoin ?? 0,
      memberCount: this?.memberCount ?? 0,
      memberPrice: this?.memberPrice ?? 0,
      startDate: this?.startDate ?? "",
      endDate: this?.endDate ?? "",
      title: this?.title ?? "",
      transactionId: this?.transactionId ?? 0,
      eventsOptions:
          this?.eventsOptions?.map((e) => e.mapToDomain()).toList() ?? [],
    );
  }
}

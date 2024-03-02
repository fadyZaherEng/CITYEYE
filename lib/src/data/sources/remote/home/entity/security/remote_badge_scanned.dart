import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_badge.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_event_list.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_service.dart';
import 'package:city_eye/src/domain/entities/home/security/badge.dart';
import 'package:city_eye/src/domain/entities/home/security/badge_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/event_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_badge_scanned.g.dart';

@JsonSerializable()
class RemoteBadgeScanned {
  final RemoteBadge? badge;
  final List<RemoteServices>? services;
  final RemoteEventList? eventList;

  const RemoteBadgeScanned({
    this.badge,
    this.services,
    this.eventList,
  });

  factory RemoteBadgeScanned.fromJson(Map<String, dynamic> json) =>
      _$RemoteBadgeScannedFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteBadgeScannedToJson(this);
}

extension RemoteBadgeScannedExtention on RemoteBadgeScanned? {
  BadgeScanned mapToDomain() {
    return BadgeScanned(
      badge: this?.badge?.mapToDomain() ?? const Badge(),
      eventList: this?.eventList?.mapToDomain() ?? const EventList(),
      services: this!.services!.map((e) => e.mapToDomain()).toList(),
    );
  }
}

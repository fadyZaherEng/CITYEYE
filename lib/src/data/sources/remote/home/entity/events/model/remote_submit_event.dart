import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_extra_filed.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/submit_event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_submit_event.g.dart';

@JsonSerializable()
class RemoteSubmitEvent {
  final int? countCurrentJoin;
  final int? transactionId;
  final List<RemoteExtraFieldEvents>? extraFieldEvents;

  const RemoteSubmitEvent({
    this.countCurrentJoin = 0,
    this.transactionId = 0,
    this.extraFieldEvents = const [],
  });

  factory RemoteSubmitEvent.fromJson(Map<String, dynamic> json) =>
      _$RemoteSubmitEventFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSubmitEventToJson(this);
}

extension RemoteSubmitEventExtension on RemoteSubmitEvent {
  SubmitEvent toDomain() {
    return SubmitEvent(
      countCurrentJoin: countCurrentJoin ?? 0,
      transactionId: transactionId ?? 0,
      extraFieldEvents:
          extraFieldEvents?.map((e) => e.mapToDomain()).toList() ?? [],
    );
  }
}

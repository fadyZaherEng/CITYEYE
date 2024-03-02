import 'package:city_eye/src/domain/entities/home/security/extra_filed_events.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_event_extra_filed.g.dart';

@JsonSerializable()
class RemoteExtraFieldEvents {
  final int? eventId;
  final int? eventOptionId;
  final int? id;
  final int? controlTypeId;
  final String? controlTypeCode;
  final String? lable;
  final bool? isRequired;
  final String? description;
  final List<dynamic>? choice;
  final List<dynamic>? formControlsValidation;

  const RemoteExtraFieldEvents({
    this.eventId,
    this.eventOptionId,
    this.id,
    this.controlTypeId,
    this.controlTypeCode,
    this.lable,
    this.isRequired,
    this.description,
    this.choice,
    this.formControlsValidation,
  });

  factory RemoteExtraFieldEvents.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtraFieldEventsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtraFieldEventsToJson(this);
}

extension RemoteExtraFieldEventsExtention on RemoteExtraFieldEvents? {
  ExtraFieldEvents mapToDomain() {
    return ExtraFieldEvents(
      controlTypeCode: this?.controlTypeCode ?? "",
      controlTypeId: this?.controlTypeId ?? 0,
      id: this?.id ?? 0,
      lable: this?.lable ?? "",
      description: this?.description ?? "",
      isRequired: this?.isRequired ?? false,
      eventId: this?.eventId ?? 0,
      eventOptionId: this?.eventOptionId ?? 0,
      choice: this?.choice?.map((e) => e.mapToDomain()).toList() ?? [],
      formControlsValidation:
          this?.formControlsValidation?.map((e) => e.mapToDomain()).toList() ??
              [],
    );
  }
}

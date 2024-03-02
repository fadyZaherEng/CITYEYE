import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_choice.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_surveys.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/extra_filed_events.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_extra_filed.g.dart';

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
  final List<RemoteChoice>? choice;
  final String? value;
  final List<dynamic>? formControlsValidation;

  const RemoteExtraFieldEvents({
    this.eventId = 0,
    this.eventOptionId = 0,
    this.id = 0,
    this.controlTypeId = 0,
    this.controlTypeCode = "",
    this.lable = "",
    this.isRequired = false,
    this.description = "",
    this.choice = const [],
    this.formControlsValidation = const [],
    this.value = "",
  });

  factory RemoteExtraFieldEvents.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtraFieldEventsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteExtraFieldEventsToJson(this);
}

extension RemoteExtraFieldEventsExtension on RemoteExtraFieldEvents? {
  ExtraFieldEvents mapToDomain() => ExtraFieldEvents(
        eventId: this?.eventId ?? 0,
        eventOptionId: this?.eventOptionId ?? 0,
        id: this?.id ?? 0,
        controlTypeId: this?.controlTypeId ?? 0,
        controlTypeCode: this?.controlTypeCode ?? "",
        lable: this?.lable ?? "",
        isRequired: this?.isRequired ?? false,
        description: this?.description ?? "",
        choice: this?.choice?.map((e) => e.mapToDomain()).toList() ?? [],
        formControlsValidation: this?.formControlsValidation ?? [],
      );
}

import 'package:city_eye/src/domain/entities/home/security/choice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_choice.g.dart';

@JsonSerializable()
final class RemoteChoice {
  final int? optionId;
  final String? optionValue;

  const RemoteChoice({
    this.optionId = 0,
    this.optionValue = "",
  });

  factory RemoteChoice.fromJson(Map<String, dynamic> json) =>
      _$RemoteChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteChoiceToJson(this);
}

extension RemoteChoiceExtension on RemoteChoice {
  Choice mapToDomain() => Choice(
        optionId: optionId ?? 0,
        optionValue: optionValue ?? "",
      );
}

extension RemoteChoiceListExtension on List<RemoteChoice>? {
  List<Choice> mapToDomain() => this!.map((e) => e.mapToDomain()).toList();
}

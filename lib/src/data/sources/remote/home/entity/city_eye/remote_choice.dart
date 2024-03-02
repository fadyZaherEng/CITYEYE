import 'package:city_eye/src/domain/entities/home/choice.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/choice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_choice.g.dart';

@JsonSerializable()
class RemoteChoice {

  final int? optionId;
  final String? optionValue;


  const RemoteChoice({
    this.optionId,
    this.optionValue,

  });

  factory RemoteChoice.fromJson(Map<String, dynamic> json) =>
      _$RemoteChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteChoiceToJson(this);
}

extension RemoteChoiceExtension on RemoteChoice? {
  Choice mapToDomain() => Choice(
    optionId: this?.optionId ?? 0,
    optionValue: this?.optionValue ?? "",
  );
}

import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_choice.dart';
import 'package:city_eye/src/domain/entities/home/security/unit_qr_code_question_answer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_unit_qr_code_question_answer.g.dart';

@JsonSerializable()
final class RemoteUnitQrQuestionAnswer {
  final int? id;
  final int? controlTypeId;
  final String? controlTypeCode;
  final String? lable;
  final bool? isRequired;
  final String? value;
  final String? answerId;
  final String? description;
  final List<RemoteChoice>? choice;
  final String? formControlsValidation;

  const RemoteUnitQrQuestionAnswer({
    this.id = 0,
    this.controlTypeId = 0,
    this.controlTypeCode = "",
    this.lable = "",
    this.isRequired = false,
    this.value = "",
    this.answerId = "",
    this.description = "",
    this.choice = const [],
    this.formControlsValidation = "",
  });

  factory RemoteUnitQrQuestionAnswer.fromJson(Map<String, dynamic> json) =>
      _$RemoteUnitQrQuestionAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUnitQrQuestionAnswerToJson(this);
}

extension RemoteUnitQrQuestionAnswerExtension on RemoteUnitQrQuestionAnswer {
  UnitQrQuestionAnswer mapToDomain() => UnitQrQuestionAnswer(
        id: id ?? 0,
        controlTypeId: controlTypeId ?? 0,
        controlTypeCode: controlTypeCode ?? "",
        lable: lable ?? "",
        isRequired: isRequired ?? false,
        value: value ?? "",
        answerId: answerId ?? "",
        description: description ?? "",
        choice: choice?.map((e) => e.mapToDomain()).toList() ?? [],
        formControlsValidation: formControlsValidation ?? "",
      );
}

extension RemoteUnitQrQuestionAnswerListExtension
    on List<RemoteUnitQrQuestionAnswer>? {
  List<UnitQrQuestionAnswer> mapToDomain() =>
      this!.map((e) => e.mapToDomain()).toList();
}

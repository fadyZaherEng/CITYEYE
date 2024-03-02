import 'package:json_annotation/json_annotation.dart';
part 'city_eye_tech_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CityEyeTechResponse<T> {
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'requestId')
  String? requestId;
  @JsonKey(name: 'error')
  List<String>? error;
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'responseMessage')
  String? responseMessage;
  @JsonKey(name: 'result')
  T? result;

  CityEyeTechResponse({
    this.statusCode,
    this.requestId,
    this.error,
    this.success,
    this.responseMessage,
    this.result,
  });

  factory CityEyeTechResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CityEyeTechResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$CityEyeTechResponseToJson(this, (T) {
        return T;
      });
}

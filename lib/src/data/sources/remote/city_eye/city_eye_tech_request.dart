import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/usecase/get_firebase_notification_token_usecase.dart';
import 'package:city_eye/src/domain/usecase/get_language_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_unit_list_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_user_info_use_case.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_eye_tech_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CityEyeTechRequest<T> {
  @JsonKey(name: 'userID')
  int? userId;
  @JsonKey(name: 'subscriberId')
  int? subscriberId;
  @JsonKey(name: 'userTypeId')
  int? userTypeId;
  @JsonKey(name: 'unitId')
  int? unitId;
  @JsonKey(name: 'compoundId')
  int? compoundId;
  @JsonKey(name: 'languageCode')
  String? languageCode;
  @JsonKey(name: 'deviceToken')
  String? deviceToken;
  @JsonKey(name: 'deviceSerial')
  String? deviceSerial;
  @JsonKey(name: 'data')
  T? data;

  CityEyeTechRequest({
    this.userId,
    this.subscriberId,
    this.userTypeId,
    this.unitId,
    this.compoundId,
    this.languageCode,
    this.deviceToken,
    this.deviceSerial,
    this.data,
  });

  factory CityEyeTechRequest.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CityEyeTechRequestFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$CityEyeTechRequestToJson(this, (T) {
        return T;
      });

  CityEyeTechRequest<T> createRequest(T) {
    return CityEyeTechRequest(
      userId: GetUserInfoUseCase(injector())().id == -1
          ? 1
          : GetUserInfoUseCase(injector())().id ?? 0,
      compoundId: GetUnitListUseCase(injector())().compoundId == -1
          ? 1
          : GetUnitListUseCase(injector())().compoundId,
      deviceSerial: "",
      deviceToken: GetFirebaseNotificationTokenUseCase(injector())(),
      languageCode: GetLanguageUseCase(injector())(),
      subscriberId: 1,
      unitId: GetUnitListUseCase(injector())().unitId ?? 0,
      userTypeId: GetUnitListUseCase(injector())().userTypeId,
      data: T,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'subscriberId': subscriberId,
      'userTypeId': userTypeId,
      'unitId': unitId,
      'compoundId': compoundId,
      'languageCode': languageCode,
      'deviceToken': deviceToken,
      'deviceSerial': deviceSerial,
      'data': data != null ? data : null,
    };
  }

  factory CityEyeTechRequest.fromMap(Map<String, dynamic> map) {
    return CityEyeTechRequest(
      userId: map['userId'] as int,
      subscriberId: map['subscriberId'] as int,
      userTypeId: map['userTypeId'] as int,
      unitId: map['unitId'] as int,
      compoundId: map['compoundId'] as int,
      languageCode: map['languageCode'] as String,
      deviceToken: map['deviceToken'] as String,
      deviceSerial: map['deviceSerial'] as String,
      data: map['data'] as T,
    );
  }
}

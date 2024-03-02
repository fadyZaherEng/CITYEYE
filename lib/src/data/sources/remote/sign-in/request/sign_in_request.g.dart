// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) =>
    SignInRequest(
      mobileNumber: json['mobileNumber'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'password': instance.password,
    };

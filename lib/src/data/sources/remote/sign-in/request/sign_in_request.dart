import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

@JsonSerializable()
final class SignInRequest {
  final String mobileNumber;
  final String password;

  const SignInRequest({
    required this.mobileNumber,
    required this.password,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}

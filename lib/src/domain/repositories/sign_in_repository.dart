import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/request/forgot_password_request.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/request/sign_in_request.dart';
import 'package:city_eye/src/domain/entities/sign_in/log_in.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';

abstract interface class SignInRepository {
  Future<DataState<User>> signIn(SignInRequest signInRequest);

  Future<DataState<Login>> cityEyeLogin(SignInRequest signInRequest);

  Future<DataState> forgotPassword(ForgotPasswordRequest forgotPasswordRequest);
}

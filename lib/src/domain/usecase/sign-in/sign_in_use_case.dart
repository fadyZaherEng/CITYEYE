import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/request/sign_in_request.dart';
import 'package:city_eye/src/domain/entities/sign_in/log_in.dart';
import 'package:city_eye/src/domain/repositories/sign_in_repository.dart';

final class SignInUseCase {
  final SignInRepository _signInRepository;

  const SignInUseCase(this._signInRepository);

  Future<DataState<Login>> call(SignInRequest signInRequest) async =>
      await _signInRepository.cityEyeLogin(signInRequest);
}

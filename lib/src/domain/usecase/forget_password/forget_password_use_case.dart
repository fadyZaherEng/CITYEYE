import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/request/forgot_password_request.dart';
import 'package:city_eye/src/domain/repositories/sign_in_repository.dart';

final class ForgotPasswordUseCase {
  final SignInRepository _forgotPasswordRepository;

  ForgotPasswordUseCase(this._forgotPasswordRepository);

  Future<DataState> call(ForgotPasswordRequest forgotPasswordRequest) async =>
      await _forgotPasswordRepository.forgotPassword(forgotPasswordRequest);
}

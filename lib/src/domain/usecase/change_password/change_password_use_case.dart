import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/change_password/request/change_password_request.dart';
import 'package:city_eye/src/domain/repositories/more_repository.dart';

class ChangePasswordUseCase {
  final MoreRepository _moreRepository;

  ChangePasswordUseCase(this._moreRepository);

  Future<DataState> call(ChangePasswordRequest changePasswordRequest) async =>
      await _moreRepository.resetPassword(changePasswordRequest);
}

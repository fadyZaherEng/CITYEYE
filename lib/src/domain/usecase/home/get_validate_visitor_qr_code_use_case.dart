import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/request/validate_visitor_qr_code_request.dart';
import 'package:city_eye/src/domain/entities/home/security/validate_visitor_qr_code_in.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class GetValidateVisitorQrCodeUseCase {
  final HomeRepository _homeRepository;

  const GetValidateVisitorQrCodeUseCase(this._homeRepository);

  Future<DataState<ValidateVisitorQrCodeIn>> call(
          ValidateVisitorQrCodeRequest validateVisitorQrCodeRequest) async =>
      await _homeRepository
          .getValidateVisitorQrCode(validateVisitorQrCodeRequest);
}

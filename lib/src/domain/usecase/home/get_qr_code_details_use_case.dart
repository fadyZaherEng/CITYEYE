import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/request/qr_code_details_request.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class GetQrCodeDetailsUseCase {
  final HomeRepository _homeRepository;

  const GetQrCodeDetailsUseCase(this._homeRepository);

  Future<DataState<QrCodeDetails>> call(
          QrCodeDetailsRequest qrCodeDetailsRequest) async =>
      await _homeRepository.getQrCodeDetails(qrCodeDetailsRequest);
}

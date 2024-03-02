import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_qr_number_request.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_number.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';

final class GetQrNumberUseCase {
  final DashboardRepository _dashboardRepository;

  const GetQrNumberUseCase(this._dashboardRepository);

  Future<DataState<GetQrNumber>> call({
    required GetQrNumberRequest getQrNumberRequest,
  }) async =>
      await _dashboardRepository.getQrNumber(getQrNumber: getQrNumberRequest);
}

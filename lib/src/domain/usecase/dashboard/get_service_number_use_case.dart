import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_service_number_request.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_service_number.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';

final class GetServiceNumberUseCase {
  final DashboardRepository _dashboardRepository;

  const GetServiceNumberUseCase(this._dashboardRepository);

  Future<DataState<List<GetServiceNumber>>> call({
    required GetServiceNumberRequest getServiceNumberRequest,
  }) async =>
      await _dashboardRepository.getServiceNumber(
        getServiceNumber: getServiceNumberRequest,
      );
}

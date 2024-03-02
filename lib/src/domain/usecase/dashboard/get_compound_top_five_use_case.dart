import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/dashboard/service_data.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';

final class GetCompoundTopFiveUseCase {
  final DashboardRepository _dashboardRepository;

  const GetCompoundTopFiveUseCase(this._dashboardRepository);

  Future<DataState<List<ServiceData>>> call() async =>
      await _dashboardRepository.getCompoundTopFive();
}

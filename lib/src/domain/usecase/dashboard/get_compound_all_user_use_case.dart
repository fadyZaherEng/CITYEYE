import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_status.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';

final class GetCompoundAllUserUseCase {
  final DashboardRepository _dashboardRepository;

  const GetCompoundAllUserUseCase(this._dashboardRepository);

  Future<DataState<GetCompoundAllUserStatus>> call() async =>
      await _dashboardRepository.getCompoundAllUserStatus();
}

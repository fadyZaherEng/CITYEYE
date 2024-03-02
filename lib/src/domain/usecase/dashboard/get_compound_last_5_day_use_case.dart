import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_last_five_day_cash_flow.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';

final class GetCompoundLast5DayCashFlowUseCase {
  final DashboardRepository _dashboardRepository;

  GetCompoundLast5DayCashFlowUseCase(this._dashboardRepository);

  @override
  Future<DataState<List<GetCompoundLast5DayCashFlow>>> call() async {
    return await _dashboardRepository.getCompoundLast5DayCashFlow();
  }
}

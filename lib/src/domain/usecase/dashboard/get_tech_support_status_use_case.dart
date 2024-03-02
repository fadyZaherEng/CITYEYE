import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_tech_support_status.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';

final class GetTechSupportStatusUseCase {
  final DashboardRepository _dashboardRepository;

  const GetTechSupportStatusUseCase(this._dashboardRepository);

  @override
  Future<DataState<List<GetTechSupportStatus>>> call() async {
    return _dashboardRepository.getTechSupportStatus();
  }
}

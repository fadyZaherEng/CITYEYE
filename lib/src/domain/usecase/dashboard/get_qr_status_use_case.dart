import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_status.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';

final class GetQrStatusUseCase {
  final DashboardRepository _dashboardRepository;

  const GetQrStatusUseCase(this._dashboardRepository);

  Future<DataState<List<GetQrStatus>>> call() async {
    return _dashboardRepository.getQrStatus();
  }
}

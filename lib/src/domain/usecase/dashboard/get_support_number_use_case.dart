import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_support_request.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_support_number.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';

final class GetSupportNumberUseCase {
  final DashboardRepository _dashboardRepository;

  const GetSupportNumberUseCase(this._dashboardRepository);

  Future<DataState<GetSupportNumber>> call({
    required GetSupportRequest getSupportRequest,
  }) async =>
      await _dashboardRepository.getSupportNumber(
        getSupportNumber: getSupportRequest,
      );
}

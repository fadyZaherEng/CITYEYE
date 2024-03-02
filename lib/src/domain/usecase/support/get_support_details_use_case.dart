import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/support/request/support_details_request.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/domain/repositories/support_repository.dart';

final class GetSupportDetailsUseCase {
  final SupportRepository _supportRepository;

  const GetSupportDetailsUseCase(this._supportRepository);

  Future<DataState<Support>> call(
          SupportDetailsRequest supportDetailsRequest) async =>
      await _supportRepository.getSupportDetails(supportDetailsRequest);
}

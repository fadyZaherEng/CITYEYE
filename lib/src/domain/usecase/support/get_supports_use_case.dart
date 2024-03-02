import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/domain/repositories/support_repository.dart';

final class GetSupportsUseCase {
  final SupportRepository _supportRepository;

  const GetSupportsUseCase(this._supportRepository);

  Future<DataState<List<Support>>> call() async =>
      await _supportRepository.getSupports();
}

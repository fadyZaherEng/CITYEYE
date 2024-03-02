import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/home/visitor.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class GetVisitorsUseCase {
  final HomeRepository _homeRepository;

  const GetVisitorsUseCase(this._homeRepository);

  Future<DataState<List<Visitor>>> call() async =>
      await _homeRepository.getVisitors();
}

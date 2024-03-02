import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_configuration.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

class GetCompoundConfigurationUseCase {
  final HomeRepository _homeRepository;

  GetCompoundConfigurationUseCase(this._homeRepository);

  Future<DataState<GetCompoundConfiguration>> call() async =>
      _homeRepository.getCompoundConfiguration();
}

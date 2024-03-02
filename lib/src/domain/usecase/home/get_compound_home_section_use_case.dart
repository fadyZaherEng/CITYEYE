import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_home_section.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class GetCompoundHomeSectionUseCase {
  final HomeRepository _homeRepository;

  GetCompoundHomeSectionUseCase(this._homeRepository);

  @override
  Future<DataState<GetCompoundHomeSection>> call() async {
    return _homeRepository.getHomeSection();
  }
}

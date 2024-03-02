import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class GetSurveyListUseCase {
  final HomeRepository _homeRepository;

  GetSurveyListUseCase(this._homeRepository);

  @override
  Future<DataState<List<Surveys>>> call() async {
    return _homeRepository.getSurveyList();
  }
}

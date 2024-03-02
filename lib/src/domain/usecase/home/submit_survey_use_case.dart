import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/survey/request/submit_survey_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class SubmitSurveyUseCase {
  final HomeRepository _homeRepository;

  SubmitSurveyUseCase(this._homeRepository);

  @override
  Future<DataState<Surveys>> call({
    required SubmitSurveyRequest submitSurveyRequest,
    String? files,
  }) async {
    return _homeRepository.submitSurvey(
        submitSurveyRequest: submitSurveyRequest, file: files);
  }
}

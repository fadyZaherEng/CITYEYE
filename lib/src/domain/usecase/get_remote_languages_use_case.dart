import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/more/language.dart';
import 'package:city_eye/src/domain/repositories/more_repository.dart';

class GetRemoteLanguagesUseCase {
  final MoreRepository _moreRepository;

  GetRemoteLanguagesUseCase(this._moreRepository);

  Future<DataState<List<Language>>> call() async {
    return await _moreRepository.getLanguage();
  }
}

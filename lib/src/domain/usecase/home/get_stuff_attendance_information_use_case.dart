import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/home/stuff_attendance_information.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class GetStuffAttendanceInformationUseCase {
  final HomeRepository _homeRepository;

  const GetStuffAttendanceInformationUseCase(this._homeRepository);

  Future<DataState<UserAttendanceInformation>> call() async =>
      await _homeRepository.getStuffAttendanceInformation();
}

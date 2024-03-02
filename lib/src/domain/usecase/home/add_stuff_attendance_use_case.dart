import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/request/add_stuff_attendance_request.dart';
import 'package:city_eye/src/domain/entities/home/stuff_attendance_information.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class AddStuffAttendanceUseCase {
  final HomeRepository _homeRepository;

  const AddStuffAttendanceUseCase(this._homeRepository);

  Future<DataState<UserAttendanceInformation>> call(
          AddStuffAttendanceRequest addStuffAttendanceRequest) async =>
      await _homeRepository.addStuffAttendance(addStuffAttendanceRequest);
}

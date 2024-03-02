import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/support/request/change_support_request.dart';
import 'package:city_eye/src/domain/entities/support/media.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/domain/repositories/support_repository.dart';

final class ChangeSupportStatusUseCase {
  final SupportRepository _supportRepository;

  const ChangeSupportStatusUseCase(this._supportRepository);

  Future<DataState<Support>> call(
    ChangeSupportRequest changeSupportRequest,
    List<MediaModel>? files,
  ) async =>
      await _supportRepository.changeSupportStatus(
        changeSupportRequest: changeSupportRequest,
        files: files ?? [],
      );
}

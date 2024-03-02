import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/lock_up_data/request/get_lock_up_data_rows_request.dart';
import 'package:city_eye/src/domain/entities/lock_up_data/get_lock_up_data_rows.dart';
import 'package:city_eye/src/domain/repositories/lock_up_data_repository.dart';

class GetLockUpRowsUseCase {
  final LockUpDataRepository _lockUpDataRepository;

  GetLockUpRowsUseCase(this._lockUpDataRepository);

  Future<DataState<List<GetLockUpRows>>> call({
    required List<GetLockUpDataRowsRequest> getLockUpDataRowsRequest,
  }) async =>
      await _lockUpDataRepository.getLockUpRows(
        getLockUpDataRowsRequest: getLockUpDataRowsRequest,
      );
}

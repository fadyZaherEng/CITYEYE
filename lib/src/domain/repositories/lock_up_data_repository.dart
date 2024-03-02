import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/lock_up_data/request/get_lock_up_data_rows_request.dart';
import 'package:city_eye/src/domain/entities/lock_up_data/get_lock_up_data_rows.dart';

abstract interface class LockUpDataRepository {
  Future<DataState<List<GetLockUpRows>>> getLockUpRows({
    required List<GetLockUpDataRowsRequest> getLockUpDataRowsRequest,
  });
}

import 'package:city_eye/src/data/sources/remote/api_key.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_response.dart';
import 'package:city_eye/src/data/sources/remote/lock_up_data/entity/remote_get_lock_up_rows.dart';
import 'package:city_eye/src/data/sources/remote/lock_up_data/request/get_lock_up_data_rows_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'lock_up_data_api_service.g.dart';

@RestApi()
abstract class LockUpDataApiService {
  factory LockUpDataApiService(Dio dio) = _LockUpDataApiService;

  @POST(APIKeys.getLookupRows)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteGetLockUpRows>>>>
      getLockUpRows(@Body() CityEyeTechRequest request);
}

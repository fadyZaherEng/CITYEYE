import 'package:city_eye/flavors.dart';
import 'package:city_eye/src/data/sources/remote/api_key.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/more_api_service.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/tech_dashboard_api_service.dart';
import 'package:city_eye/src/data/sources/remote/home/home_api_service.dart';
import 'package:city_eye/src/data/sources/remote/lock_up_data/lock_up_data_api_service.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/sign_in_api_service.dart';
import 'package:city_eye/src/data/sources/remote/support/support_api_service.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initializeDataDependencies() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => Dio()
    ..options.baseUrl = F.baseUrl
    ..interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    )));
  injector.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  injector.registerLazySingleton<SignInAPIService>(
      () => SignInAPIService(injector()));

  injector
      .registerLazySingleton<HomeAPIService>(() => HomeAPIService(injector()));

  injector.registerLazySingleton<SupportAPIService>(
      () => SupportAPIService(injector()));

  injector
      .registerLazySingleton<MoreAPIService>(() => MoreAPIService(injector()));
  injector.registerLazySingleton<DashboardApiService>(
      () => DashboardApiService(injector()));
  injector.registerLazySingleton<LockUpDataApiService>(
      () => LockUpDataApiService(injector()));
}

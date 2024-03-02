import 'package:city_eye/src/data/repositories/dashboard_repository_implementation.dart';
import 'package:city_eye/src/data/repositories/home_repository_implementation.dart';
import 'package:city_eye/src/data/repositories/lock_up_data_repository_implementation.dart';
import 'package:city_eye/src/data/repositories/more_repository_implementation.dart';
import 'package:city_eye/src/data/repositories/sign_in_repository_implementation.dart';
import 'package:city_eye/src/data/repositories/support_repository_implementation.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';
import 'package:city_eye/src/domain/repositories/lock_up_data_repository.dart';
import 'package:city_eye/src/domain/repositories/more_repository.dart';
import 'package:city_eye/src/domain/repositories/sign_in_repository.dart';
import 'package:city_eye/src/domain/repositories/support_repository.dart';

Future<void> initializeRepositoryDependencies() async {
  injector.registerFactory<SignInRepository>(
      () => SignInRepositoryImplementation(injector()));
  injector.registerFactory<HomeRepository>(
      () => HomeRepositoryImplementation(injector()));
  injector.registerFactory<SupportRepository>(
      () => SupportRepositoryImplementation(injector()));

  injector.registerFactory<MoreRepository>(() => MoreRepositoryImplementation(
        injector(),
      ));
  injector.registerFactory<DashboardRepository>(
      () => DashboardRepositoryIImplementation(
            injector(),
          ));
  injector.registerFactory<LockUpDataRepository>(
      () => LockUpDataRepositoryImplementation(
            injector(),
          ));
}

import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/usecase/get_user_information_use_case.dart';
import 'package:city_eye/src/presentation/blocs/add_payment/add_payment_bloc.dart';
import 'package:city_eye/src/presentation/blocs/app/app_cubit.dart';
import 'package:city_eye/src/presentation/blocs/change_password/change_password_bloc.dart';
import 'package:city_eye/src/presentation/blocs/cite_eye_bloc/city_eye_bloc.dart';
import 'package:city_eye/src/presentation/blocs/city_eye_more/city_eye_more_bloc.dart';
import 'package:city_eye/src/presentation/blocs/comment/comments_bloc.dart';
import 'package:city_eye/src/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:city_eye/src/presentation/blocs/event_question/event_question_bloc.dart';
import 'package:city_eye/src/presentation/blocs/forget_password/forget_password_bloc.dart';
import 'package:city_eye/src/presentation/blocs/home/home_bloc.dart';
import 'package:city_eye/src/presentation/blocs/job_details/job_details_bloc.dart';
import 'package:city_eye/src/presentation/blocs/main/main_bloc.dart';
import 'package:city_eye/src/presentation/blocs/main_city_eye/main_city_eye_bloc.dart';
import 'package:city_eye/src/presentation/blocs/more/more_bloc.dart';
import 'package:city_eye/src/presentation/blocs/notifications/notification_details/notification_details_bloc.dart';
import 'package:city_eye/src/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:city_eye/src/presentation/blocs/qr/qr_scanner_bloc.dart';
import 'package:city_eye/src/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:city_eye/src/presentation/blocs/survey/survey_bloc.dart';
import 'package:city_eye/src/presentation/screens/qr_details/blocs/qr_details_bloc.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<AppCubit>(() => AppCubit(
        injector(),
        injector(),
      ));

  injector.registerFactory<SignInBloc>(() => SignInBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<ForgetPasswordBloc>(() => ForgetPasswordBloc(
        injector(),
        injector(),
      ));

  injector.registerFactory<JobDetailsBloc>(() => JobDetailsBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<MainBloc>(
      () => MainBloc(injector<GetUserInformationUseCase>(), injector()));
  injector.registerFactory<HomeBloc>(() => HomeBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<MoreBloc>(
    () => MoreBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
    ),
  );
  injector.registerFactory<NotificationsBloc>(
    () => NotificationsBloc(
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<NotificationDetailsBloc>(
    () => NotificationDetailsBloc(
      injector(),
    ),
  );

  injector.registerFactory<QrDetailsBloc>(
    () => QrDetailsBloc(
      injector(),
      injector(),
    ),
  );
  injector.registerFactory<CommentsBloc>(
    () => CommentsBloc(
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<ChangePasswordBloc>(() => ChangePasswordBloc(
        injector(),
        injector(),
      ));
  injector.registerFactory<QrScannerBloc>(() => QrScannerBloc(
        injector(),
        injector(),
      ));

  injector.registerFactory<DashboardBloc>(
    () => DashboardBloc(
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<AddPaymentBloc>(() => AddPaymentBloc(
        injector(),
        injector(),
      ));
  injector.registerFactory<CityEyeBloc>(() => CityEyeBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<SurveyBloc>(() => SurveyBloc(
        injector(),
        injector(),
      ));
  injector.registerFactory<EventQuestionBloc>(() => EventQuestionBloc(
        injector(),
      ));
  injector.registerFactory<MainCityEyeBloc>(() => MainCityEyeBloc());
  injector.registerFactory<CityEyeMoreBloc>(() => CityEyeMoreBloc(
        injector(),
      ));
}

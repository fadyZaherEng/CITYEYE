import 'dart:ui';

import 'package:city_eye/firebase_options.dart';
import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/app_theme.dart';
import 'package:city_eye/src/core/utils/bloc_observer.dart';
import 'package:city_eye/src/core/utils/network_connectivity.dart';
import 'package:city_eye/src/core/utils/notification_services.dart';
import 'package:city_eye/src/di/injector.dart';
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
import 'package:city_eye/src/presentation/widgets/restart_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  Bloc.observer = const SimpleBlocObserver();
  await NotificationService().initializeNotificationService();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const RestartWidget(MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  bool isOnline = true;

  @override
  void initState() {
    _internetConnectionListener();
    super.initState();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => injector()),
        BlocProvider<SignInBloc>(create: (context) => injector()),
        BlocProvider<ForgetPasswordBloc>(create: (context) => injector()),
        BlocProvider<ChangePasswordBloc>(create: (context) => injector()),
        BlocProvider<JobDetailsBloc>(create: (context) => injector()),
        BlocProvider(create: (context) => injector<MainBloc>()),
        BlocProvider(create: (context) => injector<HomeBloc>()),
        BlocProvider(create: (context) => injector<NotificationsBloc>()),
        BlocProvider(create: (context) => injector<NotificationDetailsBloc>()),
        BlocProvider(create: (context) => injector<MoreBloc>()),
        BlocProvider(create: (context) => injector<QrDetailsBloc>()),
        BlocProvider(create: (context) => injector<CommentsBloc>()),
        BlocProvider(create: (context) => injector<QrScannerBloc>()),
        BlocProvider(create: (context) => injector<DashboardBloc>()),
        BlocProvider(create: (context) => injector<AddPaymentBloc>()),
        BlocProvider(create: (context) => injector<CityEyeBloc>()),
        BlocProvider(create: (context) => injector<SurveyBloc>()),
        BlocProvider(create: (context) => injector<EventQuestionBloc>()),
        BlocProvider(create: (context) => injector<MainCityEyeBloc>()),
        BlocProvider(create: (context) => injector<CityEyeMoreBloc>()),
      ],
      child: BlocBuilder<AppCubit, Locale>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splash,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'City Eye',
            theme: AppTheme(state.languageCode).light,
            locale: state,
          );
        },
      ),
    );
  }

  void _internetConnectionListener() {
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) async {
      _source = source;
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          isOnline = _source.values.toList()[0];
          break;
        case ConnectivityResult.wifi:
          isOnline = _source.values.toList()[0];
          break;
        case ConnectivityResult.none:
        default:
          isOnline = false;
      }
      if (navigatorKey.currentState != null) {
        _networkConnectivity.showOrHideNoInternetDialog(
            isOnline, navigatorKey.currentState!.context);
      }
    });
  }
}

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/constants.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/usecase/get_remember_me_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_restart_app_use_case.dart';
import 'package:city_eye/src/domain/usecase/remove_user_information_use_case.dart';
import 'package:city_eye/src/domain/usecase/save_current_country_code_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_restart_app_use_case.dart';
import 'package:country_ip/country_ip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _isRememberMe = false;
  bool _isRestart = false;
  bool _hasInitialized = false;

  @override
  void initState() {
    _getCurrentCountryCode();
    super.initState();
  }

  void _getCurrentCountryCode() async {
    final countryIpResponse = await CountryIp.find();
    await SaveCurrentCountryCodeUseCase(injector())(
        countryIpResponse?.countryCode ?? "EG");
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _isRememberMe = GetRememberMeUseCase(injector())();
    _isRestart = GetRestartAppUseCase(injector())();
    if (!_hasInitialized) {
      _hasInitialized = true;
      if (_isRestart) {
        await SetRestartAppUseCase(injector())(false);
        await Future.delayed(const Duration(seconds: 3), () {
          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.mainCityEyeScreen,
            (route) => false,
          );
        });
      } else {
        if (_isRememberMe) {
          await Future.delayed(const Duration(seconds: 3), () {
            if (!mounted) return;
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.mainCityEyeScreen,
              (route) => false,
            );
          });
        } else {
          RemoveUserInformationUseCase(injector())();
          await Future.delayed(const Duration(seconds: 3), () {
            if (!mounted) return;
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
              (route) => false,
            );
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ColorSchemes.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ClipOval(
                        child: SvgPicture.asset(
                          ImagePaths.logo,
                          width: 160,
                          height: 160,
                        ),
                      ),
                    ),
                    Container(
                      color: ColorSchemes.iconBackGround,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        child: Text(
                          S.of(context).stayConnectedStaySmarter,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: ColorSchemes.black,
                                    fontWeight: Constants.fontWeightMedium,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 102,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 150,
                  right: 0,
                  left: 0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).poweredBy,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: ColorSchemes.gray,
                                    letterSpacing: -0.24,
                                  ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          S.of(context).cityEye,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: ColorSchemes.black,
                                    letterSpacing: -0.24,
                                  ),
                        )
                      ])),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  width: MediaQuery.sizeOf(context).width,
                  ImagePaths.splashBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

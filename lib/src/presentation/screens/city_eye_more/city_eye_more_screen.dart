// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_message_dialog_widget.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_configuration.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/multimedia_type.dart';
import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:city_eye/src/domain/usecase/get_unit_list_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_user_info_use_case.dart';
import 'package:city_eye/src/presentation/blocs/city_eye_more/city_eye_more_bloc.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/skeleton/city_eye_more_skeleton.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/widgets/city_eye_more_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CityEyeMoreScreen extends BaseStatefulWidget {
  const CityEyeMoreScreen({super.key});

  @override
  BaseState<CityEyeMoreScreen> baseCreateState() => _CityEyeMoreScreenState();
}

class _CityEyeMoreScreenState extends BaseState<CityEyeMoreScreen> {
  UserInfo _user = const UserInfo();
  UnitLists _unitLists = const UnitLists();
  GetCompoundConfiguration? _getCompoundConfiguration;

  CityEyeMoreBloc get _cityEyeMoreBloc =>
      BlocProvider.of<CityEyeMoreBloc>(context);
  final List<MultiMediaTypes> _multiMediaTypes = [];

  @override
  void initState() {
    _user = GetUserInfoUseCase(injector())();
    _unitLists = GetUnitListUseCase(injector())();
    _cityEyeMoreBloc.add(CityEyeMoreGetCompoundConfigurationEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<CityEyeMoreBloc, CityEyeMoreState>(
      listener: (context, state) {
        if (state is CityEyeMoreGetCompoundConfigurationSuccess) {
          _getCompoundConfiguration = state.getCompoundConfiguration;
          for (var element in _getCompoundConfiguration!.listOfPageSections) {
            if (element.pageCode == "CompoundMenue") {
              _multiMediaTypes.addAll(element.multiMediaTypes);
            }
          }
        }
        if (state is CityEyeMoreGetCompoundConfigurationFailed) {
          _showDialog(state.message);
        }
      },
      builder: (context, state) {
        if (_getCompoundConfiguration == null) {
          return const CityEyeMoreSkeleton();
        }
        return Scaffold(
            body: SingleChildScrollView(
              child: CityEyeMoreContentWidget(
                user: _user,
                unitLists: _unitLists,
                getCompoundConfiguration: _getCompoundConfiguration ??
                    const GetCompoundConfiguration(),
                multiMediaTypes: _multiMediaTypes,
                onLogoutTapped: () {},
                onProfileTapped: () {},
                onCommunityRequestTapped: () {},
                onSettingsTapped: () {},
                onGalleryTapped: () {},
                onDelegateTapped: () {},
                onTermsTapped: () {},
                onAboutUsTapped: () {},
                onStuffTapped: () {},
                onFAQTapped: () {},
                onReportIssueTapped: () {},
                onVisitorTapped: () {},
                onCompoundRulesTapped: () {},
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              clipBehavior: Clip.antiAlias,
              backgroundColor: const Color(0xFF31D474),
              onPressed: () {
                _openWhatsapp(
                  whatsapp: _getCompoundConfiguration!.compoundsetting.mobile,
                );
              },
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF31D474),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(49, 212, 116, 0.36),
                      blurRadius: 64,
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  ImagePaths.icWhatsApp,
                  height: 28,
                  width: 28,
                  matchTextDirection: true,
                ),
              ),
            ));
      },
    );
  }

  void _openWhatsapp({
    required String whatsapp,
  }) async {
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp";
    var whatsappURLIos = "https://wa.me/$whatsapp}";
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(whatsappURLIos));
      } else {
        const appId = 'com.sprinteye.cityeyehandyman.development';
        final url = Uri.parse("https://apps.apple.com/app/id$appId");
        launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } else {
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        const appId = 'com.sprinteye.cityeyehandyman.development';
        final url = Uri.parse("market://details?id=$appId");
        launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      }
    }
  }

  void _showDialog(String message) {
    showMessageDialogWidget(
      context: context,
      text: message,
      icon: ImagePaths.icWarningNew,
      buttonText: S.of(context).ok,
      onTap: () => Navigator.pop(context),
    );
  }
}

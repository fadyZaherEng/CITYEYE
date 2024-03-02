import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/multimedia_type.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/utils/multi_media_code.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/widgets/city_eye_more_item_widget.dart';
import 'package:flutter/material.dart';

class CityEyeMoreBodyWidget extends StatelessWidget {
  final void Function() onProfileTapped;
  final void Function() onCommunityRequestTapped;
  final void Function() onSettingsTapped;
  final void Function() onGalleryTapped;
  final void Function() onDelegateTapped;
  final void Function() onTermsTapped;
  final void Function() onAboutUsTapped;
  final void Function() onStuffTapped;
  final void Function() onFAQTapped;
  final void Function() onReportIssueTapped;
  final void Function() onVisitorTapped;
  final List<MultiMediaTypes> multiMediaTypes;
  final void Function() onCompoundRulesTapped;

  const CityEyeMoreBodyWidget({
    super.key,
    required this.onProfileTapped,
    required this.onCommunityRequestTapped,
    required this.onSettingsTapped,
    required this.onGalleryTapped,
    required this.onDelegateTapped,
    required this.onTermsTapped,
    required this.onAboutUsTapped,
    required this.onStuffTapped,
    required this.onFAQTapped,
    required this.onReportIssueTapped,
    required this.onVisitorTapped,
    required this.onCompoundRulesTapped,
    required this.multiMediaTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !_isProfileMandatory(multiMediaTypes, MultiMediaCode.PROFILE) &&
                !_isProfileMandatory(
                    multiMediaTypes, MultiMediaCode.COMMUNITYREQUEST) &&
                !_isProfileMandatory(multiMediaTypes, MultiMediaCode.GALLERY) &&
                !_isProfileMandatory(multiMediaTypes, MultiMediaCode.DELEGATE)
            ? const SizedBox.shrink()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  children: [
                    CityEyeMoreItemWidget(
                      title: S.of(context).myProfile,
                      icon: ImagePaths.Profile,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.PROFILE),
                      onItemTapped: onProfileTapped,
                    ),
                    _separator(MultiMediaCode.PROFILE),
                    CityEyeMoreItemWidget(
                      title: S.of(context).Gallery,
                      icon: ImagePaths.icGallery,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.GALLERY),
                      onItemTapped: onGalleryTapped,
                    ),
                    _separator(MultiMediaCode.GALLERY),
                    CityEyeMoreItemWidget(
                      title: S.of(context).communityRequest,
                      icon: ImagePaths.icCommunityrequest,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.COMMUNITYREQUEST),
                      onItemTapped: onCommunityRequestTapped,
                    ),
                    _separator(MultiMediaCode.COMMUNITYREQUEST),
                    CityEyeMoreItemWidget(
                      title: S.of(context).delegates,
                      icon: ImagePaths.icDelegate,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.DELEGATE),
                      onItemTapped: onDelegateTapped,
                    ),
                  ],
                ),
              ),
        _separatorHard(MultiMediaCode.DELEGATE),
        !_isProfileMandatory(multiMediaTypes, MultiMediaCode.COMPOUNDRULES) &&
                !_isProfileMandatory(multiMediaTypes, MultiMediaCode.TERMS) &&
                !_isProfileMandatory(multiMediaTypes, MultiMediaCode.ABOUTUS)
            ? const SizedBox.shrink()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  children: [
                    CityEyeMoreItemWidget(
                      title: S.of(context).compoundRules,
                      icon: ImagePaths.ic_compoundrules,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.COMPOUNDRULES),
                      onItemTapped: onCompoundRulesTapped,
                    ),
                    _separator(MultiMediaCode.COMPOUNDRULES),
                    CityEyeMoreItemWidget(
                      title: S.of(context).terms,
                      icon: ImagePaths.ic_termsandconditions,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.TERMS),
                      onItemTapped: onTermsTapped,
                    ),
                    _separator(MultiMediaCode.TERMS),
                    CityEyeMoreItemWidget(
                      title: S.of(context).aboutUs,
                      icon: ImagePaths.icAboutUs,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.ABOUTUS),
                      onItemTapped: onAboutUsTapped,
                    ),
                  ],
                ),
              ),
        _separatorHard(MultiMediaCode.ABOUTUS),
        !_isProfileMandatory(multiMediaTypes, MultiMediaCode.STAFF) &&
                !_isProfileMandatory(multiMediaTypes, MultiMediaCode.FAQ)
            ? const SizedBox.shrink()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  children: [
                    CityEyeMoreItemWidget(
                      title: S.of(context).stuff,
                      icon: ImagePaths.icStuff,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.STAFF),
                      onItemTapped: onStuffTapped,
                    ),
                    _separator(MultiMediaCode.STAFF),
                    CityEyeMoreItemWidget(
                      title: S.of(context).faq,
                      icon: ImagePaths.icFags,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.FAQ),
                      onItemTapped: onFAQTapped,
                    ),
                  ],
                ),
              ),
        _separatorHard(MultiMediaCode.FAQ),
        !_isProfileMandatory(multiMediaTypes, MultiMediaCode.SETTINGS)
            ? const SizedBox.shrink()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  children: [
                    CityEyeMoreItemWidget(
                      title: S.of(context).settings,
                      icon: ImagePaths.icSetting,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.SETTINGS),
                      onItemTapped: onSettingsTapped,
                    ),
                  ],
                ),
              ),
        _separatorHard(MultiMediaCode.SETTINGS),
        !_isProfileMandatory(multiMediaTypes, MultiMediaCode.REPORTISSUE) &&
                !_isProfileMandatory(multiMediaTypes, MultiMediaCode.VISITOR)
            ? const SizedBox.shrink()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  children: [
                    CityEyeMoreItemWidget(
                      title: S.of(context).reportIssue,
                      icon: ImagePaths.icReportIssue,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.REPORTISSUE),
                      onItemTapped: onReportIssueTapped,
                    ),
                    _separator(MultiMediaCode.REPORTISSUE),
                    CityEyeMoreItemWidget(
                      title: S.of(context).visitors,
                      icon: ImagePaths.icVisitors,
                      isMandatory: _isProfileMandatory(
                          multiMediaTypes, MultiMediaCode.VISITOR),
                      onItemTapped: onVisitorTapped,
                    ),
                  ],
                ),
              ),
        // const Divider(
        //   height: 0.75,
        //   thickness: 4.75,
        //   color: ColorSchemes.moreDividerColor,
        // ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  bool _isProfileMandatory(
      List<MultiMediaTypes> multiMediaTypes, MultiMediaCode multiMediaCode) {
    return multiMediaTypes
        .any((element) => element.code == getMultiMediaType(multiMediaCode));
  }

  Widget _separator(MultiMediaCode multiMediaCode) =>
      _isProfileMandatory(multiMediaTypes, multiMediaCode)
          ? const Column(children: [
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 0.75,
                color: Color(0xFFD9D9D9),
              ),
              SizedBox(
                height: 10,
              ),
            ])
          : const SizedBox.shrink();

  Widget _separatorHard(multiMediaCode) =>
      _isProfileMandatory(multiMediaTypes, multiMediaCode)
          ? const Divider(
              height: 0.75,
              thickness: 4.75,
              color: ColorSchemes.moreDividerColor,
            )
          : const SizedBox.shrink();
}

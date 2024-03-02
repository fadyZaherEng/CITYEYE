import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_configuration.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/multimedia_type.dart';
import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/widgets/city_eye_body_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/widgets/city_eye_more_footer_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/widgets/city_eye_more_header_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/widgets/city_eye_more_social_media_widget.dart';
import 'package:flutter/material.dart';

class CityEyeMoreContentWidget extends StatefulWidget {
  final UserInfo user;
  final UnitLists unitLists;
  final GetCompoundConfiguration getCompoundConfiguration;
  final void Function() onLogoutTapped;
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
  final void Function() onCompoundRulesTapped;
  final List<MultiMediaTypes> multiMediaTypes;

  const CityEyeMoreContentWidget({
    super.key,
    required this.user,
    required this.unitLists,
    required this.getCompoundConfiguration,
    required this.onLogoutTapped,
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
  State<CityEyeMoreContentWidget> createState() =>
      _CityEyeMoreContentWidgetState();
}

class _CityEyeMoreContentWidgetState extends State<CityEyeMoreContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CityEyeMoreHeaderWidget(user: widget.user, unitLists: widget.unitLists),
        CityEyeMoreBodyWidget(
          onProfileTapped: widget.onProfileTapped,
          onCommunityRequestTapped: widget.onCommunityRequestTapped,
          onSettingsTapped: widget.onSettingsTapped,
          onGalleryTapped: widget.onGalleryTapped,
          onDelegateTapped: widget.onDelegateTapped,
          onTermsTapped: widget.onTermsTapped,
          onAboutUsTapped: widget.onAboutUsTapped,
          onStuffTapped: widget.onStuffTapped,
          onFAQTapped: widget.onFAQTapped,
          onReportIssueTapped: widget.onReportIssueTapped,
          onVisitorTapped: widget.onVisitorTapped,
          onCompoundRulesTapped: widget.onCompoundRulesTapped,
          multiMediaTypes: widget.multiMediaTypes,
        ),
        const SizedBox(
          height: 10,
        ),
        CityEyeMoreSocialMediaWidget(
          listSocialMedia: widget.getCompoundConfiguration.listSocialMedia,
        ),
        const SizedBox(
          height: 10,
        ),
        CityEyeMoreFooterWidget(
          onLogoutTapped: widget.onLogoutTapped,
        ),
      ],
    );
  }
}

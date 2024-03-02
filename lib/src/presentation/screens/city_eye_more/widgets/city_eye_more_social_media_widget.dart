import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/list_social_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CityEyeMoreSocialMediaWidget extends StatelessWidget {
  final List<ListSocialMedia> listSocialMedia;

  const CityEyeMoreSocialMediaWidget({
    super.key,
    required this.listSocialMedia,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: ColorSchemes.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    blurRadius: 32,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SvgPicture.network(
                listSocialMedia[index].socialMediaType.logo,
                height: 24,
                width: 24,
                matchTextDirection: true,
                alignment: Alignment.center,
                placeholderBuilder: (context) {
                  return SvgPicture.asset(
                    ImagePaths.logo,
                    height: 24,
                    width: 24,
                    matchTextDirection: true,
                  );
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 20,
            );
          },
          itemCount: listSocialMedia.length,
        ),
      ),
    );
  }
}

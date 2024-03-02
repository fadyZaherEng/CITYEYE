// ignore_for_file: deprecated_member_use

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CityEyeMoreHeaderWidget extends StatelessWidget {
  final UserInfo user;
  final UnitLists unitLists;

  const CityEyeMoreHeaderWidget({
    super.key,
    required this.user,
    required this.unitLists,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 264,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F1F1),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            S.of(context).more,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: ColorSchemes.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFF39A4A),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                user.image,
                fit: BoxFit.fill,
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: SvgPicture.asset(
                      ImagePaths.profile,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            user.userName,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ColorSchemes.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${unitLists.userTypeName} - ${S.of(context).UnitNo} ${unitLists.unitNo} - ",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ColorSchemes.primary,
                    ),
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                ImagePaths.Group34455,
                matchTextDirection: true,
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                ImagePaths.arrowdown2,
                matchTextDirection: true,
                width: 16,
                height: 16,
                color: ColorSchemes.black,
              )
            ],
          )
        ],
      ),
    );
  }
}

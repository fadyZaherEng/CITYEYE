import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreHeaderWidget extends StatelessWidget {
  final User user;
  final Function() onTapSwitchAction;
  final Function() onTapSelectCompound;

  const MoreHeaderWidget({
    Key? key,
    required this.user,
    required this.onTapSwitchAction,
    required this.onTapSelectCompound,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 21),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(241, 241, 241, 1),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(40.0),
          topEnd: Radius.circular(40.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            S.of(context).more,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  letterSpacing: -0.24,
                  color: ColorSchemes.black,
                ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange,
                width: 1,
              ),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                user.image,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return SvgPicture.asset(
                    ImagePaths.profile,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            user.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  letterSpacing: -0.24,
                  color: ColorSchemes.black,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

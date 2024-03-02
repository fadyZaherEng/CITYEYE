import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/support_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

class HomeSupportWidget extends StatelessWidget {
  final List<SupportCategory> supportCategory;

  const HomeSupportWidget({
    super.key,
    required this.supportCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          S.of(context).Support,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorSchemes.black,
              ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 128,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4ECFF),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(23, 43, 77, 0.16),
                          blurRadius: 24,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: SvgPicture.network(
                      supportCategory[index].logo,
                      width: 28,
                      height: 28,
                      fit: BoxFit.fill,
                      matchTextDirection: true,
                      placeholderBuilder: (context) {
                        return const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            shape: BoxShape.circle,
                            height: 28,
                            width: 28,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    supportCategory[index]
                        .name
                        .split(" ")
                        .map((e) => "$e\n")
                        .join(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorSchemes.black,
                        ),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 20,
              );
            },
            itemCount: supportCategory.length,
          ),
        ),
      ],
    );
  }
}

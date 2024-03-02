import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/service_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

class HomeServicesWidget extends StatelessWidget {
  final List<ServicesCategory> services;

  const HomeServicesWidget({
    super.key,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).Services,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorSchemes.black,
              ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 150,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                width: 170,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: ColorSchemes.white,
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFF1F1F1),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        blurRadius: 9,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4ECFF),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.12),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0, 0),
                          )
                        ],
                      ),
                      child: SvgPicture.network(
                        services[index].logo,
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
                          ));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      services[index].name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorSchemes.black,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      services[index].code,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorSchemes.gray,
                          ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            itemCount: services.length,
          ),
        ),
      ],
    );
  }
}

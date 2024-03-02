import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

class CrasoulSliderWidget extends StatefulWidget {
  final List<GetOffers> offers;

  const CrasoulSliderWidget({
    super.key,
    required this.offers,
  });

  @override
  State<CrasoulSliderWidget> createState() => _CrasoulSliderWidgetState();
}

class _CrasoulSliderWidgetState extends State<CrasoulSliderWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 158,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 158,
                autoPlay: true,
                aspectRatio: 3.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                viewportFraction: 1.09,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.linear,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: widget.offers
                  .map(
                    (item) => ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      child: Stack(
                        children: [
                          Image.network(
                            item.attachment,
                            width: double.infinity,
                            height: 158,
                            fit: BoxFit.fill,
                            errorBuilder: (
                              context,
                              error,
                              stackTrace,
                            ) {
                              return ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                                child: SvgPicture.asset(
                                  ImagePaths.profile,
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 158,
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress != null) {
                                return SkeletonLine(
                                  style: SkeletonLineStyle(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 158,
                                  ),
                                );
                              }
                              return child;
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 24,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: widget.offers.asMap().entries.map((item) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == item.key
                        ? ColorSchemes.primary
                        : ColorSchemes.gray,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

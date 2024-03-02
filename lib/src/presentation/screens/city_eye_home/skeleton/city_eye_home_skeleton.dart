import 'package:badges/badges.dart' as badge;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CityEyeHomeSkeleton extends StatelessWidget {
  const CityEyeHomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: 48,
                              height: 48,
                              borderRadius:
                                  BorderRadiusDirectional.circular(16),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                    width: 150,
                                    height: 10,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(4),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                    width: 100,
                                    height: 10,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(4),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      badge.Badge(
                        badgeContent: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                height: 20,
                                width: 20,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        badgeStyle: badge.BadgeStyle(
                          badgeColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        position:
                            badge.BadgePosition.topStart(top: -20, start: 10),
                        child: SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            height: 23,
                            width: 23,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 158,
                    child: Center(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 158.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 0.9,
                        ),
                        items: [1, 2, 3]
                            .map(
                              (item) => SkeletonLine(
                                style: SkeletonLineStyle(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 158,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(16),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 127,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 111,
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        color: ColorSchemes.white,
                                        borderRadius:
                                            BorderRadiusDirectional.all(
                                          Radius.circular(16),
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  width: 150,
                                                  height: 10,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(4),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  width: 150,
                                                  height: 10,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(4),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  width: 150,
                                                  height: 10,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(4),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SkeletonLine(
                                            style: SkeletonLineStyle(
                                              width: 127,
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(4),
                                              height: 127,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const SkeletonLine(
                              style: SkeletonLineStyle(width: 80, height: 10),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 100,
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 48,
                                          width: 48,
                                          padding: const EdgeInsets.all(12),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF4ECFF),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const SkeletonAvatar(
                                            style: SkeletonAvatarStyle(
                                              width: 28,
                                              height: 28,
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          width: 48,
                                          height: 10,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  4),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 15,
                                  );
                                },
                                itemCount: 10,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SkeletonLine(
                              style: SkeletonLineStyle(width: 80, height: 10),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 140,
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 140,
                                        width: 165,
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
                                                color: Color(0xFFF1F1F1),
                                                blurRadius: 10,
                                                spreadRadius: 0,
                                                offset: Offset(0, 0))
                                          ],
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const SkeletonAvatar(
                                                style: SkeletonAvatarStyle(
                                                  width: 28,
                                                  height: 28,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                child: SkeletonLine(
                                                  style: SkeletonLineStyle(
                                                    width: 80,
                                                    alignment: Alignment.center,
                                                    height: 10,
                                                    borderRadius:
                                                        BorderRadiusDirectional
                                                            .circular(4),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  width: 80,
                                                  height: 10,
                                                  alignment: Alignment.center,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(4),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 10,
                                  );
                                },
                                itemCount: 5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF6F6F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                width: 80,
                                borderRadius:
                                    BorderRadiusDirectional.circular(4),
                                height: 10,
                              ),
                            ),
                            const Spacer(),
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                width: 80,
                                height: 10,
                                borderRadius:
                                    BorderRadiusDirectional.circular(4),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 157,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 157,
                                width: 331,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 157,
                                      width: 331,
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
                                              color: Color(0xFFF1F1F1),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                              offset: Offset(0, 0))
                                        ],
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SkeletonLine(
                                                    style: SkeletonLineStyle(
                                                      width: 150,
                                                      height: 10,
                                                      borderRadius:
                                                          BorderRadiusDirectional
                                                              .circular(4),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const SkeletonAvatar(
                                                        style:
                                                            SkeletonAvatarStyle(
                                                          width: 24,
                                                          height: 24,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      SkeletonLine(
                                                        style:
                                                            SkeletonLineStyle(
                                                          width: 80,
                                                          height: 10,
                                                          borderRadius:
                                                              BorderRadiusDirectional
                                                                  .circular(4),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      SkeletonLine(
                                                        style:
                                                            SkeletonLineStyle(
                                                          width: 80,
                                                          height: 10,
                                                          borderRadius:
                                                              BorderRadiusDirectional
                                                                  .circular(4),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            const Divider(
                                              color: Color(0xFFD9D9D9),
                                              height: 1,
                                              thickness: 1.5,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: SizedBox(
                                                height: 30,
                                                child: SkeletonLine(
                                                  style: SkeletonLineStyle(
                                                    width: MediaQuery.sizeOf(
                                                            context)
                                                        .width,
                                                    height: 30,
                                                    borderRadius:
                                                        BorderRadiusDirectional
                                                            .circular(4),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                            itemCount: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                width: 80,
                                height: 10,
                                borderRadius:
                                    BorderRadiusDirectional.circular(4),
                              ),
                            ),
                            const Spacer(),
                            SkeletonLine(
                              style: SkeletonLineStyle(
                                width: 80,
                                height: 10,
                                borderRadius:
                                    BorderRadiusDirectional.circular(4),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 370,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Wrap(
                                children: [
                                  Container(
                                    width: 331,
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
                                            color: Color(0xFFF1F1F1),
                                            blurRadius: 10,
                                            spreadRadius: 0,
                                            offset: Offset(0, 0))
                                      ],
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SkeletonLine(
                                                  style: SkeletonLineStyle(
                                                    width: 200,
                                                    height: 10,
                                                    borderRadius:
                                                        BorderRadiusDirectional
                                                            .circular(4),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    SkeletonAvatar(
                                                      style:
                                                          SkeletonAvatarStyle(
                                                        width: 24,
                                                        height: 24,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    SkeletonLine(
                                                      style: SkeletonLineStyle(
                                                        width: 80,
                                                        height: 10,
                                                        borderRadius:
                                                            BorderRadiusDirectional
                                                                .circular(4),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    SkeletonLine(
                                                      style: SkeletonLineStyle(
                                                        width: 80,
                                                        height: 10,
                                                        borderRadius:
                                                            BorderRadiusDirectional
                                                                .circular(4),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          const Divider(
                                            color: Color(0xFFD9D9D9),
                                            height: 1,
                                            thickness: 1.5,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: SizedBox(
                                              height: 30,
                                              child: SkeletonLine(
                                                style: SkeletonLineStyle(
                                                  height: 30,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(4),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                            itemCount: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

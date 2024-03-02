import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SurveySkeleton extends StatelessWidget {
  const SurveySkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Container(
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
                              blurRadius: 32,
                              spreadRadius: 0,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SkeletonLine(
                                    style: SkeletonLineStyle(
                                        width: 150,
                                        height: 10,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                4)),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SkeletonAvatar(
                                        style: SkeletonAvatarStyle(
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
                                                    .circular(4)),
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
                                                    .circular(4)),
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
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 30,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(4)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                height: 150,
                                width: MediaQuery.sizeOf(context).width,
                                child: ListView.separated(
                                  itemCount: 3,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SkeletonLine(
                                              style: SkeletonLineStyle(
                                                width: 80,
                                                height: 20,
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(4),
                                              ),
                                            ),
                                            SkeletonLine(
                                              style: SkeletonLineStyle(
                                                width: 40,
                                                height: 20,
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(4),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        SkeletonLine(
                                          style: SkeletonLineStyle(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: 10,
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(4),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 20,
      ),
    );
  }

  double getWidthBasedOnPercentage(int countAnswer, BuildContext context) =>
      MediaQuery.of(context).size.width * (countAnswer / 100) -
      (countAnswer == 0 ? 0 : 30);
}

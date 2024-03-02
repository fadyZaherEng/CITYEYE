import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class DashboardSkeleton extends StatefulWidget {
  const DashboardSkeleton({
    super.key,
  });

  @override
  State<DashboardSkeleton> createState() => _DashboardSkeletonState();
}

class _DashboardSkeletonState extends State<DashboardSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  height: 48,
                  width: 48,
                  borderRadius: BorderRadius.circular(16),
                  shape: BoxShape.rectangle,
                ),
              ),
              const SizedBox(width: 12),
              const SkeletonLine(
                style: SkeletonLineStyle(
                  height: 5,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 254,
                    child: Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 6),
                      decoration: const BoxDecoration(
                        color: ColorSchemes.dashboardCardColor,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: ColorSchemes.white,
                            blurRadius: 10,
                            spreadRadius: 15,
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                  borderRadius: BorderRadius.circular(5),
                                  height: 16,
                                  width: 100,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 160,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [1, 2, 3].asMap().entries.map((e) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 64,
                                        height: 64,
                                        child: CircleAvatar(
                                          backgroundColor: ColorSchemes.white
                                              .withOpacity(0.2),
                                          radius: 56,
                                          child: CircleAvatar(
                                            backgroundColor: ColorSchemes.white
                                                .withOpacity(0.2),
                                            radius: 40,
                                            child: SkeletonAvatar(
                                              style: SkeletonAvatarStyle(
                                                shape: BoxShape.circle,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                width: 32,
                                                height: 32,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            SkeletonLine(
                                              style: SkeletonLineStyle(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                height: 10,
                                                width: 70,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SkeletonLine(
                                              style: SkeletonLineStyle(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                height: 10,
                                                width: 70,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SkeletonLine(
                                                style: SkeletonLineStyle(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              height: 10,
                                              width: 70,
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 270,
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 12),
                    decoration: const BoxDecoration(
                      color: ColorSchemes.dashboardCardColor,
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorSchemes.white,
                          blurRadius: 10,
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(top: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    height: 22,
                                    child: SkeletonLine(
                                      style: SkeletonLineStyle(
                                        height: 22,
                                        width: 88,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                                SkeletonLine(
                                    style: SkeletonLineStyle(
                                  borderRadius: BorderRadius.circular(5),
                                  height: 35,
                                  width: 100,
                                ))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 3,
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: SkeletonLine(
                                    style: SkeletonLineStyle(
                                      borderRadius: BorderRadius.circular(5),
                                      height: 20,
                                      width: 51,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 165,
                                width: 271,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: SizedBox(
                                        height: 159,
                                        width: 271,
                                        child: SkeletonLine(
                                            style: SkeletonLineStyle(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          height: 159,
                                          width: 271,
                                        )),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 92,
                                          bottom: 15,
                                        ),
                                        child: SkeletonLine(
                                          style: SkeletonLineStyle(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            height: 15,
                                            width: 9,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            height: 20,
                            width: 144,
                            child: SkeletonLine(
                              style: SkeletonLineStyle(
                                borderRadius: BorderRadius.circular(5),
                                height: 20,
                                width: 144,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
            child: SizedBox(
              height: 6,
              width: 72,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => Row(
                  children: [
                    const SizedBox(
                      width: 1,
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        borderRadius: BorderRadius.circular(4),
                        height: 6,
                        width: 0 == index ? 24 : 12,
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

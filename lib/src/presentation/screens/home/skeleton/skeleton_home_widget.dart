import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonHomeWidget extends StatelessWidget {
  final EdgeInsets padding;

  const SkeletonHomeWidget({Key? key, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: padding,
          child: Column(
            children: [
              Row(
                children: [
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        height: 48,
                        width: 48,
                        borderRadius: BorderRadius.circular(16),
                        shape: BoxShape.rectangle),
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
              const SizedBox(height: 28),
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    height: 50,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(16),
                    shape: BoxShape.rectangle),
              ),
              const SizedBox(height: 28),
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    height: 242.0,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(32),
                    shape: BoxShape.rectangle),
              ),
              const SizedBox(height: 33),
              SkeletonLine(
                style: SkeletonLineStyle(
                  height: 10,
                  width: 100,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: ColorSchemes.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorSchemes.lightGray,
                        offset: Offset(0, 1),
                        blurRadius: 30,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: ColorSchemes.searchBackground,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            height: 12,
                                            width: 120),
                                      ),
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            height: 10,
                                            width: 80),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  SkeletonLine(
                                    style: SkeletonLineStyle(
                                        borderRadius: BorderRadius.circular(5),
                                        height: 10,
                                        width: 70),
                                  )
                                ],
                              ),
                            )),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SkeletonLine(
                                      style: SkeletonLineStyle(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          height: 12,
                                          width: 100),
                                    ),
                                    const SizedBox(height: 10),
                                    SkeletonLine(
                                      style: SkeletonLineStyle(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          height: 12,
                                          width: 100),
                                    ),
                                    const SizedBox(height: 10),
                                    SkeletonLine(
                                      style: SkeletonLineStyle(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          height: 12,
                                          width: 100),
                                    )
                                  ]),
                              const SizedBox(width: 66),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SkeletonLine(
                                    style: SkeletonLineStyle(
                                        borderRadius: BorderRadius.circular(5),
                                        height: 12,
                                        width: 100),
                                  ),
                                  const SizedBox(height: 10),
                                  SkeletonLine(
                                    style: SkeletonLineStyle(
                                        borderRadius: BorderRadius.circular(5),
                                        height: 12,
                                        width: 100),
                                  ),
                                  const SizedBox(height: 10),
                                  SkeletonLine(
                                    style: SkeletonLineStyle(
                                        borderRadius: BorderRadius.circular(5),
                                        height: 12,
                                        width: 100),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context ,index) => const SizedBox(height: 12.0),
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

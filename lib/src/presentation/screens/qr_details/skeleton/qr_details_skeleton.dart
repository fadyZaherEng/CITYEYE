import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';


class QrDetailsSkeleton extends StatelessWidget {
  const QrDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SkeletonItem(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: ColorSchemes.white,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(40.0),
                topEnd: Radius.circular(40.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorSchemes.notificationShadow,
                  spreadRadius: 0.0,
                  blurRadius: 32.0,
                  offset: Offset(0, 4),
                )
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 63.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const SkeletonAvatar(
                      style: SkeletonAvatarStyle(shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 80.0),
                    Center(
                      child: SkeletonItem(
                        child: Container(
                          height: 22.0,
                          width: 130.0,
                          decoration: const BoxDecoration(
                            color: ColorSchemes.white,
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32.0),
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      shape: BoxShape.circle, height: 66.0, width: 66.0),
                ),
                const SizedBox(height: 32.0),
                Container(
                    decoration: const BoxDecoration(
                      color: ColorSchemes.white,
                      borderRadius: BorderRadiusDirectional.all(
                        Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorSchemes.notificationShadow,
                          spreadRadius: 0.0,
                          blurRadius: 32.0,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 21.0),
                      child: Column(
                        children: [
                          SkeletonItem(
                            child: Container(
                              height: 22.0,
                              width: 67.0,
                              decoration: const BoxDecoration(
                                color: ColorSchemes.white,
                                borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7.0,
                            ),
                            width: 150.0,
                            constraints: const BoxConstraints(minWidth: 139.0),
                            decoration: const BoxDecoration(
                              color: ColorSchemes.iconBackGround,
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SkeletonItem(
                                child: Container(
                                  height: 20.0,
                                  decoration: const BoxDecoration(
                                    color: ColorSchemes.white,
                                    borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 13.0,
                          ),
                          const SkeletonLine(
                            style: SkeletonLineStyle(height: 3),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SkeletonItem(
                                      child: Container(
                                        height: 22.0,
                                        width: 67.0,
                                        decoration: const BoxDecoration(
                                          color: ColorSchemes.white,
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SkeletonItem(
                                      child: Container(
                                        height: 22.0,
                                        width: 67.0,
                                        decoration: const BoxDecoration(
                                          color: ColorSchemes.white,
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 13.0,
                                ),
                                const DottedLine(
                                  dashColor: ColorSchemes.lightGray,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SkeletonItem(
                                      child: Container(
                                        height: 22.0,
                                        width: 67.0,
                                        decoration: const BoxDecoration(
                                          color: ColorSchemes.white,
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SkeletonItem(
                                      child: Container(
                                        height: 22.0,
                                        width: 67.0,
                                        decoration: const BoxDecoration(
                                          color: ColorSchemes.white,
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 13.0,
                                ),
                                const DottedLine(
                                  dashColor: ColorSchemes.lightGray,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SkeletonItem(
                                      child: Container(
                                        height: 22.0,
                                        width: 67.0,
                                        decoration: const BoxDecoration(
                                          color: ColorSchemes.white,
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SkeletonItem(
                                      child: Container(
                                        height: 22.0,
                                        width: 67.0,
                                        decoration: const BoxDecoration(
                                          color: ColorSchemes.white,
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 13.0,
                                ),
                                const DottedLine(
                                  dashColor: ColorSchemes.lightGray,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SkeletonItem(
                                      child: Container(
                                        height: 22.0,
                                        width: 67.0,
                                        decoration: const BoxDecoration(
                                          color: ColorSchemes.white,
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SkeletonItem(
                                      child: Container(
                                        height: 22.0,
                                        width: 67.0,
                                        decoration: const BoxDecoration(
                                          color: ColorSchemes.white,
                                          borderRadius:
                                              BorderRadiusDirectional.all(
                                            Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 13.0,
                                ),
                                const DottedLine(
                                  dashColor: ColorSchemes.lightGray,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}

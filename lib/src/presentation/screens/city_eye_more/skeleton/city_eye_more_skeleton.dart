import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CityEyeMoreSkeleton extends StatelessWidget {
  const CityEyeMoreSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 10,
                      borderRadius: BorderRadius.circular(10),
                      width: 60,
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        width: 80,
                        height: 80,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SkeletonLine(
                      style: SkeletonLineStyle(
                    height: 10,
                    borderRadius: BorderRadius.circular(10),
                    width: 60,
                    alignment: Alignment.center,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SkeletonLine(
                          style: SkeletonLineStyle(
                        height: 10,
                        borderRadius: BorderRadius.circular(10),
                        width: 100,
                        alignment: Alignment.center,
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              width: 25,
                              height: 25,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ))),
                      const SizedBox(
                        width: 20,
                      ),
                      const SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: 16,
                          height: 16,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            for (var i = 0; i < 8; i++)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 16),
                    child: Row(
                      children: [
                        const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 24,
                            height: 24,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        SkeletonLine(
                          style: SkeletonLineStyle(
                            height: 10,
                            borderRadius: BorderRadius.circular(10),
                            width: 100,
                          ),
                        ),
                        const Spacer(),
                        const SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              width: 24,
                              height: 24,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              )),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.75,
                    color: Color(0xFFEFF0EC),
                  )
                ],
              ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            width: 40,
                            height: 40,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )));
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: SkeletonLine(
                              style: SkeletonLineStyle(
                            height: 10,
                            borderRadius: BorderRadius.circular(10),
                            width: 60,
                            alignment: Alignment.center,
                          )),
                        ),
                        const Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                width: 50,
                                height: 50,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SkeletonLine(
                          style: SkeletonLineStyle(
                        height: 10,
                        borderRadius: BorderRadius.circular(10),
                        width: 40,
                      )),
                      const SizedBox(
                        width: 2,
                      ),
                      SkeletonLine(
                          style: SkeletonLineStyle(
                        height: 10,
                        borderRadius: BorderRadius.circular(10),
                        width: 40,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class JobDetailsSkeleton extends StatelessWidget {
  const JobDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 20,
                      width: 20,
                    ),
                  ),
                  SizedBox(width: 8),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 12,
                      width: 60,
                    ),
                  ),
                ]),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 12,
                    width: 60,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 20,
                      width: 20,
                    ),
                  ),
                  SizedBox(width: 8),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 12,
                      width: 60,
                    ),
                  ),
                ]),
                SizedBox(width: 8),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 12,
                    width: 60,
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(width: 8),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 12,
                    width: 60,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SkeletonLine(
              style: SkeletonLineStyle(
                height: 100,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SkeletonLine(
              style: SkeletonLineStyle(
                height: 150,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 100,
                          width: MediaQuery.of(context).size.width/4,
                        ),
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 100,
                          width: MediaQuery.of(context).size.width/4,
                        ),
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 100,
                          width: MediaQuery.of(context).size.width/4,
                        ),
                      ),
                    ]),
                const SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 100,
                          width: MediaQuery.of(context).size.width/4,
                        ),
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 100,
                          width: MediaQuery.of(context).size.width/4,
                        ),
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 100,
                          width: MediaQuery.of(context).size.width/4,
                        ),
                      ),
                    ]),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SkeletonLine(
              style: SkeletonLineStyle(
                height: 150,
                width: 150,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

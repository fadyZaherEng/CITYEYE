import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/presentation/screens/main_city_eye/utils/navigation_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const BottomNavigationBarWidget({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorSchemes.blackShadow,
            blurRadius: 24.0,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorSchemes.gray,
        selectedItemColor: ColorSchemes.primary,
        unselectedIconTheme: Theme.of(context).iconTheme.copyWith(
              color: ColorSchemes.gray,
            ),
        backgroundColor: ColorSchemes.white,
        selectedIconTheme:
            Theme.of(context).iconTheme.copyWith(color: ColorSchemes.primary),
        selectedLabelStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: ColorSchemes.primary),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: ColorSchemes.gray),
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                ImagePaths.home,
                matchTextDirection: true,
                color: currentIndex == NavigationId.home
                    ? ColorSchemes.primary
                    : ColorSchemes.gray,
              ),
            ),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                ImagePaths.icMaintenance,
                matchTextDirection: true,
                color: currentIndex == NavigationId.support
                    ? ColorSchemes.primary
                    : ColorSchemes.gray,
              ),
            ),
            label: S.of(context).Support,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                ImagePaths.icWall,
                matchTextDirection: true,
                color: currentIndex == NavigationId.wall
                    ? ColorSchemes.primary
                    : ColorSchemes.gray,
              ),
            ),
            label: S.of(context).wall,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                ImagePaths.icServices,
                matchTextDirection: true,
                color: currentIndex == NavigationId.services
                    ? ColorSchemes.primary
                    : ColorSchemes.gray,
              ),
            ),
            label: S.of(context).services,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                ImagePaths.more,
                matchTextDirection: true,
                color: currentIndex == NavigationId.more
                    ? ColorSchemes.primary
                    : ColorSchemes.gray,
              ),
            ),
            label: S.of(context).more,
          )
        ],
      ),
    );
  }
}

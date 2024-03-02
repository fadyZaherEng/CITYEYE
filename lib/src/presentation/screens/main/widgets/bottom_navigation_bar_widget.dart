import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  final String userTypeCode;

  const BottomNavigationBarWidget({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.userTypeCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
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
        selectedItemColor: ColorSchemes.black,
        backgroundColor: ColorSchemes.white,
        selectedLabelStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: ColorSchemes.black),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: ColorSchemes.gray),
        elevation: 0.0,
        items: [
          _item(
            label: S.of(context).home,
            iconSelected: ImagePaths.coloredHome,
            iconUnSelected: ImagePaths.home,
            context: context,
          ),
          _item(
            label: S.of(context).more,
            iconSelected: ImagePaths.coloredMore,
            iconUnSelected: ImagePaths.more,
            context: context,
          )
        ],
      ),
    );
  }

  BottomNavigationBarItem _item({
    required String label,
    required String iconSelected,
    required String iconUnSelected,
    required BuildContext context,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4),
        child: SvgPicture.asset(iconUnSelected),
      ),
      label: label,
      activeIcon: Padding(
        padding: const EdgeInsets.all(4),
        child: SvgPicture.asset(iconSelected),
      ),
    );
  }
}

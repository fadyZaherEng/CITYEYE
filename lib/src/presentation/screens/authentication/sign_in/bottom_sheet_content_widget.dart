import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:city_eye/src/presentation/screens/authentication/sign_in/bottom_sheet_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetContentWidget extends StatelessWidget {
  final List<UnitLists> unitLists;
  final UserInfo userInfo;
  final Function() onTap;

  const BottomSheetContentWidget({
    super.key,
    required this.unitLists,
    required this.onTap,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return BottomSheetItemWidget(
                  unitLists: unitLists[index],
                  userInfo: userInfo,
                  onTap: onTap,
                );
              },
              separatorBuilder: (context, index) {
                return const Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1.5,
                      color: Color(0xFFD9D9D9),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
              itemCount: unitLists.length,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SvgPicture.asset(
                ImagePaths.icAdddd,
                color: ColorSchemes.primary,
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                S.of(context).addAnotherUnit,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorSchemes.primary,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

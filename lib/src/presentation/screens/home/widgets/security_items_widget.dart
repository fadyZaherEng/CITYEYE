import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/presentation/screens/home/widgets/visitor_card_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_empty_list_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_home_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/theme/color_schemes.dart';
import '../../../../core/resources/image_paths.dart';
import '../../../../domain/entities/home/visitor.dart';

class SecurityItemsWidget extends StatelessWidget {
  final List<Visitor> visitors;
  final Function() onTapPinCode;
  final Function(Visitor) onTapCardWidget;
  final Function() onRefresh;

  const SecurityItemsWidget({
    this.visitors = const [],
    required this.onTapPinCode,
    required this.onTapCardWidget,
    required this.onRefresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                S.of(context).visitors,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorSchemes.black,
                    ),
              ),
            ),
            Expanded(
              flex: 3,
              child: CustomHomeButtonWidget(
                height: 40.0,
                onTap: onTapPinCode,
                text: S.of(context).pinCode,
                customTextStyle:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorSchemes.white,
                        ),
                prefixIcon: Flexible(
                  child: SvgPicture.asset(
                    ImagePaths.lock,
                  ),
                ),
              ),
            )
          ],
        ),
        visitors.isNotEmpty
            ? Column(
                children: [
                  const SizedBox(height: 10.0),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => VisitorCardWidget(
                      visitor: visitors[index],
                      onTapCardWidget: onTapCardWidget,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12.0,
                    ),
                    itemCount: visitors.length,
                  ),
                ],
              )
            : Column(
                children: [
                  const SizedBox(height: 40),
                  CustomEmptyListWidget(
                    imagePath: ImagePaths.emptyVisitors,
                    text: S.of(context).sorryNoVisitorsYet,
                    onRefresh: () {
                      onRefresh();
                    },
                  ),
                ],
              ),
      ],
    );
  }
}

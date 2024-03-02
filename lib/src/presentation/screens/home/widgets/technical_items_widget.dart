import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/presentation/screens/home/widgets/technical_card_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/theme/color_schemes.dart';
import '../../../../core/resources/image_paths.dart';

class TechnicalItemsWidget extends StatelessWidget {
  final List<Support> jobs;
  final Function(Support) onTapCard;
  final Function() onRefresh;

  const TechnicalItemsWidget({
    super.key,
    required this.jobs,
    required this.onTapCard,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.of(context).jobs,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorSchemes.black,
                  ),
            ),
          ],
        ),
        jobs.isNotEmpty
            ? Column(
                children: [
                  const SizedBox(height: 10.0),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => TechnicalCardWidget(
                      job: jobs[index],
                      onTapCardWidget: onTapCard,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12.0,
                    ),
                    itemCount: jobs.length,
                  ),
                ],
              )
            : Column(
                children: [
                  const SizedBox(height: 40),
                  CustomEmptyListWidget(
                    imagePath: ImagePaths.emptyJobs,
                    text: S.of(context).sorryNoJobsYet,
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

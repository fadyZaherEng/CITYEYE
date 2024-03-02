import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/presentation/widgets/custom_empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyNotificationWidget extends StatelessWidget {
  final Function() onRefresh;

  const EmptyNotificationWidget({required this.onRefresh, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomEmptyListWidget(
            imagePath: ImagePaths.emptyNotification,
            text: S.of(context).noMessagesYet,
            onRefresh: () {
              onRefresh();
            },
          ),
        ],
      ),
    );
  }
}

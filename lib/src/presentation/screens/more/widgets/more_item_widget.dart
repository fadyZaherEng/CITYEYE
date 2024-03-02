import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/presentation/widgets/notifications_switch_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function() onTap;
  final bool isVisible;
  final bool isSwitchIcon;
  final bool valueOfSwitch;
  final void Function(bool value)? onToggleSwitch;
  final bool isCounterWidget;
  final int count;

  const MoreItemWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    this.isVisible = true,
    this.isSwitchIcon = false,
    this.valueOfSwitch = false,
    this.onToggleSwitch,
    this.isCounterWidget = false,
    this.count = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? InkWell(
            onTap: () {
              onTap();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    imagePath,
                    width: 24,
                    height: 24,
                    fit: BoxFit.scaleDown,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          letterSpacing: -0.24,
                          color: ColorSchemes.black,
                        ),
                  ),
                  isSwitchIcon
                      ? const SizedBox(
                          width: 24,
                        )
                      : const SizedBox(
                          width: 0,
                        ),
                  isSwitchIcon
                      ? NotificationsSwitchButtonWidget(
                          value: valueOfSwitch,
                          onTap: onToggleSwitch!,
                        )
                      : const SizedBox.shrink(),
                  const Spacer(),
                  isCounterWidget
                      ? Container(
                          margin: const EdgeInsets.only(
                            right: 22.7,
                          ),
                          width: 20.0,
                          height: 20.0,
                          constraints: const BoxConstraints(
                              minWidth: 20.0, minHeight: 20.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorSchemes.primary),
                          child: Center(
                            child: Text(
                              count.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: ColorSchemes.white),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 18,
                    color: ColorSchemes.gray,
                  )
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

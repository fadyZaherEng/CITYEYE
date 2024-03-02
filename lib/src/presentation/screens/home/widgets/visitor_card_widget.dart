import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/constants.dart';
import 'package:city_eye/src/core/utils/extension/color_extension.dart';
import 'package:city_eye/src/domain/entities/home/visitor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class VisitorCardWidget extends StatelessWidget {
  final Visitor visitor;

  final Function(Visitor) onTapCardWidget;

  const VisitorCardWidget({
    super.key,
    required this.visitor,
    required this.onTapCardWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          onTapCardWidget(visitor);
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorSchemes.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: ColorSchemes.lightGray,
                  offset: Offset(0, 1),
                  blurRadius: 30,
                  spreadRadius: 0)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorSchemes.searchBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${visitor.qrType.name} - ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: ColorSchemes.black,
                                      letterSpacing: -0.16),
                            ),
                            Text(
                              visitor.guestType.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: ColorSchemes.black,
                                    letterSpacing: -0.16,
                                    fontWeight: Constants.fontWeightRegular,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "${visitor.fromTime} - ${visitor.toTime}",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: ColorSchemes.black,
                                    letterSpacing: -0.16,
                                    fontWeight: Constants.fontWeightRegular,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          //  width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 2.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: visitor.qrCodeStatus.color.toColor,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    visitor.qrCodeStatus.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: visitor
                                              .qrCodeStatus.color.toColor,
                                          fontSize: 16.0,
                                          letterSpacing: -0.24,
                                        ),
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                ImagePaths.arrowRight,
                                matchTextDirection: true,
                                fit: BoxFit.scaleDown,
                                color: visitor.qrCodeStatus.color.toColor,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 26,
                        ),
                        Text(
                          "${_getDate(visitor.validToDate)} at ${_getTime(visitor.validToDate)}",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorSchemes.gray,
                                    fontSize: 16.0,
                                    letterSpacing: -0.16,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    _buildRowItem(
                      context: context,
                      icon: ImagePaths.owner,
                      title: S.of(context).owner,
                      value: visitor.ownerName,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    visitor.qrType.code == "multiple"
                        ? _buildRowItem(
                            context: context,
                            icon: ImagePaths.date,
                            title: S.of(context).validDate,
                            value:
                                '${_getDate(visitor.validToDate)} at ${_getTime(visitor.validToDate)}',
                          )
                        : const SizedBox.shrink(),
                    visitor.qrType.code == "multiple"
                        ? const SizedBox(
                            height: 16.0,
                          )
                        : const SizedBox.shrink(),
                    _buildRowItem(
                      context: context,
                      icon: ImagePaths.visitor,
                      title: S.of(context).visitor,
                      value: visitor.guestName,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    _buildRowItem(
                      context: context,
                      icon: ImagePaths.unit,
                      title: S.of(context).unit,
                      value: visitor.userUnits.name,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    _buildRowItem(
                      context: context,
                      icon: ImagePaths.icPinCode,
                      title: S.of(context).pinCode,
                      value: "${visitor.pinCode}",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowItem({
    required BuildContext context,
    required String icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          color: ColorSchemes.gray,
        ),
        const SizedBox(
          width: 16.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorSchemes.gray,
                  letterSpacing: -0.16,
                  fontSize: 16.0,
                ),
          ),
        ),
        const SizedBox(
          width: 34,
        ),
        Flexible(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorSchemes.black,
                  letterSpacing: -0.16,
                  fontSize: 16.0,
                ),
          ),
        ),
      ],
    );
  }

  String _getDate(String date) =>
      DateFormat('dd-MM-yyyy').format(DateTime.parse(date));

  String _getTime(String time) => DateFormat.jm().format(
        DateTime.parse(time),
      );
}

// ignore_for_file: deprecated_member_use

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/convert_timestamp_to_date_format.dart';
import 'package:city_eye/src/core/utils/image_type_enum.dart';
import 'package:city_eye/src/domain/entities/album_images/images_album.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/entities/home/security/unit_qr_code_question_answer.dart';
import 'package:city_eye/src/domain/entities/home/security/units_qr_code_days.dart';
import 'package:city_eye/src/domain/entities/support/support_attachment.dart';
import 'package:city_eye/src/presentation/screens/album_images_screen/album_images_screen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../config/theme/color_schemes.dart';

class QrDetailsWidget extends StatefulWidget {
  final QrCodeDetails qrCodeDetails;

  const QrDetailsWidget({
    super.key,
    required this.qrCodeDetails,
  });

  @override
  State<QrDetailsWidget> createState() => _QrDetailsWidgetState();
}

class _QrDetailsWidgetState extends State<QrDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 21.0),
      child: Column(
        children: [
          Text(
            widget.qrCodeDetails.unitsQRCodeScanned.qrType.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ColorSchemes.black,
                ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 7.0,
            ),
            width: 139.0,
            constraints: const BoxConstraints(minWidth: 139.0),
            decoration: const BoxDecoration(
              color: ColorSchemes.iconBackGround,
              borderRadius: BorderRadiusDirectional.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
            child: Center(
              child: Text(
                widget.qrCodeDetails.unitsQRCodeScanned.guestType.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.0,
                    ),
              ),
            ),
          ),
          if (widget.qrCodeDetails.unitsQRCodeScanned.isRestricted &&
              !widget.qrCodeDetails.isValid)
            const SizedBox(
              height: 13.0,
            ),
          if (widget.qrCodeDetails.unitsQRCodeScanned.isRestricted &&
              !widget.qrCodeDetails.isValid)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImagePaths.icRestricted,
                  color: ColorSchemes.primary,
                  width: 16.0,
                  height: 16.0,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  S.current.restrictedMassage,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.0,
                        color: ColorSchemes.red,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          const SizedBox(
            height: 13.0,
          ),
          const Divider(
            color: ColorSchemes.dividerColor,
            thickness: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).inviter,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 15.0, color: ColorSchemes.gray),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.qrCodeDetails.unitsQRCodeScanned.inviterDetails
                              .inviterName,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 15.0,
                                overflow: TextOverflow.ellipsis,
                                color: ColorSchemes.black,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13.0,
                ),
                const DottedLine(
                  dashColor: ColorSchemes.lightGray,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).visitor,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 15.0, color: ColorSchemes.gray),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.qrCodeDetails.unitsQRCodeScanned.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 15.0, color: ColorSchemes.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 13.0,
                ),
                const DottedLine(
                  dashColor: ColorSchemes.lightGray,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).unit,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 15.0, color: ColorSchemes.gray),
                    ),
                    Text(
                      widget.qrCodeDetails.unitsQRCodeScanned.address,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 15.0, color: ColorSchemes.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13.0,
                ),
                const DottedLine(
                  dashColor: ColorSchemes.lightGray,
                )
              ],
            ),
          ),
          if (widget
              .qrCodeDetails.unitsQRCodeScanned.unitsQRCodeDays.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).days,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorSchemes.gray, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: widget
                              .qrCodeDetails.unitsQRCodeScanned.unitsQRCodeDays
                              .map((unitQrCodeDay) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: _daysWidget(unitQrCodeDay),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DottedLine(
                    dashColor: ColorSchemes.lightGray,
                  ),
                ],
              ),
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).preparedVisitTime,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 15.0, color: ColorSchemes.gray),
                      ),
                      Text(
                        "${widget.qrCodeDetails.unitsQRCodeScanned.fromTime} - ${widget.qrCodeDetails.unitsQRCodeScanned.toTime}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 15.0,
                              color: ColorSchemes.black,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DottedLine(
                    dashColor: ColorSchemes.lightGray,
                  ),
                ],
              ),
            ),
          ],
          if (widget.qrCodeDetails.unitsQRCodeScanned.unitQRQuestionAnswers
              .isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  widget.qrCodeDetails.unitsQRCodeScanned.unitQRQuestionAnswers
                      .asMap()
                      .entries
                      .map(
                        (unitQrQuestionAnswer) => QuestionsWidget(
                          unitQrQuestionAnswer: unitQrQuestionAnswer.value,
                          index: unitQrQuestionAnswer.key,
                        ),
                      )
                      .toList(),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).expireDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 15.0, color: ColorSchemes.gray),
                    ),
                    Text(
                      widget.qrCodeDetails.unitsQRCodeScanned.toDate.isNotEmpty
                          ? convertTimestampToDateFormat(
                              widget.qrCodeDetails.unitsQRCodeScanned.toDate)
                          : "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 15.0, color: ColorSchemes.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _daysWidget(UnitsQrCodeDays unitsQrCodeDays) {
    return Container(
        decoration: BoxDecoration(
          color: ColorSchemes.white,
          borderRadius: BorderRadiusDirectional.circular(8.0),
          border: Border.all(color: ColorSchemes.black, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Column(
            children: [
              Text(unitsQrCodeDays.weekDays.name,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorSchemes.black,
                      )),
              const SizedBox(
                height: 4,
              ),
              Text(
                  "${unitsQrCodeDays.dayTime.fromTime} - ${unitsQrCodeDays.dayTime.toTime}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorSchemes.black,
                      )),
            ],
          ),
        ));
  }
}

class QuestionsWidget extends StatelessWidget {
  final UnitQrQuestionAnswer unitQrQuestionAnswer;
  final int index;

  const QuestionsWidget({
    super.key,
    required this.unitQrQuestionAnswer,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (unitQrQuestionAnswer.controlTypeCode != 'image') ...[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unitQrQuestionAnswer.lable,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 15.0, color: ColorSchemes.gray),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  unitQrQuestionAnswer.controlTypeCode != 'date'
                      ? unitQrQuestionAnswer.value
                      : convertTimestampToDateFormat(
                          unitQrQuestionAnswer.value),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 15.0, color: ColorSchemes.black),
                )
              ],
            ),
          ] else ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unitQrQuestionAnswer.lable,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 15.0, color: ColorSchemes.gray),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                InkWell(
                  onTap: () {
                    _onNavigateToAlbumImagesScreenState(
                      images: [
                        SupportAttachment(
                          name: unitQrQuestionAnswer.lable,
                          pathUrl: unitQrQuestionAnswer.value,
                        ),
                      ],
                      initialIndex: index,
                      context: context,
                    );
                  },
                  child: SizedBox(
                    height: 130,
                    child: ClipRRect(
                      borderRadius: const BorderRadiusDirectional.all(
                          Radius.circular(8.0)),
                      child: Image.network(
                        unitQrQuestionAnswer.value,
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              maxWidth: double.infinity,
                              width: double.infinity,
                              height: 200.0,
                              maxHeight: 200.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => ClipRRect(
                          borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(8.0)),
                          child: Image.asset(
                            fit: BoxFit.cover,
                            ImagePaths.imagePlaceHolder,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
          const SizedBox(
            height: 13.0,
          ),
          const DottedLine(
            dashColor: ColorSchemes.lightGray,
          )
        ],
      ),
    );
  }

  void _onNavigateToAlbumImagesScreenState({
    required List<SupportAttachment> images,
    required int initialIndex,
    required BuildContext context,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumImageScreen(
          imagesAlbum: ImagesAlbum(
            initialIndex: initialIndex,
            images: images,
          ),
          imageType: ImageType.network,
        ),
      ),
    );
  }
}

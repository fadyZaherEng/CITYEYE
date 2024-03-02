import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/presentation/screens/qr_details/blocs/qr_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/color_schemes.dart';
import 'qr_details_widget.dart';

class QrDetailsCardWidget extends StatelessWidget {
  final QrCodeDetails qrCodeDetails;

  const QrDetailsCardWidget({
    super.key,
    required this.qrCodeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrDetailsBloc, QrDetailsState>(
      listener: (context, state) {
        if (state is NavigateToBackState) {
          Navigator.of(context).pop();
        }
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 63.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: GestureDetector(
                      onTap: () => context
                          .read<QrDetailsBloc>()
                          .add(NavigateToBackEvent()),
                      child: SvgPicture.asset(
                        ImagePaths.arrowLeft,
                        matchTextDirection: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Text(
                      S.of(context).details,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ColorSchemes.white,
                            fontSize: 18.0,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              if (qrCodeDetails.isValid)
                Center(child: SvgPicture.asset(ImagePaths.doneSuccess)),
              if (!qrCodeDetails.isValid)
                Center(child: SvgPicture.asset(ImagePaths.icWrog)),
              const SizedBox(height: 32.0),
              Container(
                width: 350.0,
                constraints: const BoxConstraints(
                  maxWidth: 350.0,
                ),
                decoration: const BoxDecoration(
                  color: ColorSchemes.white,
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(16.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorSchemes.notificationShadow,
                      spreadRadius: 0.0,
                      blurRadius: 32.0,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: QrDetailsWidget(qrCodeDetails: qrCodeDetails),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

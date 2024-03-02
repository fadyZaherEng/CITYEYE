// ignore_for_file: deprecated_member_use

import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/presentation/blocs/qr/qr_scanner_bloc.dart';
import 'package:city_eye/src/presentation/screens/qr/scan/widgets/qr_scanner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../generated/l10n.dart';
import '../../../../config/theme/color_schemes.dart';

class QrCodeScanScreen extends BaseStatefulWidget {
  const QrCodeScanScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _QrCodeScanScreenState();
}

class _QrCodeScanScreenState extends BaseState<QrCodeScanScreen> {
  QrScannerBloc get _bloc => BlocProvider.of<QrScannerBloc>(context);
  bool isNotAllowMultipleErrorDialog = true;

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<QrScannerBloc, QrScannerState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is SuccessCheckingValidationQrCodeState) {
          if (state.validateVisitorQrCodeIn.sorceKey == 1) {
            _bloc.add(NavigatorToBadgeDetailsScreenEvent(
                state.validateVisitorQrCodeIn));
          } else if (state.validateVisitorQrCodeIn.sorceKey == 2) {
            _bloc.add(NavigatorToServiceDetailsScreenEvent(
                state.validateVisitorQrCodeIn));
          } else if (state.validateVisitorQrCodeIn.sorceKey == 3) {
            _bloc.add(NavigatorToDelegationDetailsScreenEvent(
                state.validateVisitorQrCodeIn));
          } else if (state.validateVisitorQrCodeIn.sorceKey == 4) {
            _bloc.add(NavigatorToQRCodeDetailsScreenEvent(
                state.validateVisitorQrCodeIn));
          }
        } else if (state is FailureCheckingValidationQrCodeState) {
          if (isNotAllowMultipleErrorDialog) {
            showMessageDialogWidget(
              context: context,
              text: state.errorMessage,
              icon: ImagePaths.icCancelNew,
              buttonText: S.of(context).ok,
              onTap: () {
                isNotAllowMultipleErrorDialog = true;
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            );
          }
          isNotAllowMultipleErrorDialog = false;
        } else if (state is NavigatorToQRCodeDetailsScreenState) {
          Navigator.of(context)
              .pushReplacementNamed(Routes.qrDetails, arguments: {
            'isComeFromQrScanner': true,
            'qrCodeDetailsComeFromQrCode': state.validateVisitorQrCodeIn,
          });
        } else if (state is NavigatorToBadgeDetailsScreenState) {
          Navigator.of(context).pushReplacementNamed(
            Routes.badgeDetails,
            arguments: {
              'isValid': state.validateVisitorQrCodeIn.isValid,
              'badgeScanned': state.validateVisitorQrCodeIn.badgeScanned,
              'userUnitInfo': state.validateVisitorQrCodeIn.userUnitInfo,
            },
          );
        } else if (state is NavigatorToServiceDetailsScreenState) {
          // Navigator.of(context).pushReplacementNamed(Routes.serviceDetails, arguments: {
          //   'isComeFromQrScanner': true,
          //   'qrCodeDetailsComeFromQrCode': state.validateVisitorQrCodeIn,
          // });
        } else if (state is NavigatorToDelegationDetailsScreenState) {
          Navigator.of(context).pushReplacementNamed(
            Routes.delegateDetails,
            arguments: {
              'isValid': state.validateVisitorQrCodeIn.isValid,
              'delegationScanned':
                  state.validateVisitorQrCodeIn.delegationScanned,
              'userUnitInfo': state.validateVisitorQrCodeIn.userUnitInfo,
            },
          );
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: SizedBox(
                  child: BuildingQrScannerViewWidget(
                    onQrCodeScanned: (qrId) {
                      if (qrId.isNotEmpty) {
                        _bloc.add(
                          CheckValidationQrCodeEvent(
                            encryptedQr: qrId,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 72.0, 20.0, 0.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      } ,
                      child: SvgPicture.asset(
                        ImagePaths.close,
                        color: ColorSchemes.white,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        S.of(context).scanQrCode,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: ColorSchemes.white,
                              fontSize: 16.0,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

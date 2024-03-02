import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/presentation/screens/qr_details/blocs/qr_details_bloc.dart';
import 'package:city_eye/src/presentation/screens/qr_details/skeleton/qr_details_skeleton.dart';
import 'package:city_eye/src/presentation/screens/qr_details/utils/qr_code_details_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/qr_details_card_widget.dart';

class QrDetailsScreen extends BaseStatefulWidget {
  final int qrCodeDetailsIdOrQrScanner;
  final bool isComeFromQrScanner;
  final QrCodeDetails validateVisitorQrCodeIn;

  const QrDetailsScreen({
    super.key,
    required this.qrCodeDetailsIdOrQrScanner,
    required this.isComeFromQrScanner,
    required this.validateVisitorQrCodeIn,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _QrDetailsState();
}

class _QrDetailsState extends BaseState<QrDetailsScreen> {
  QrDetailsBloc get _bloc => BlocProvider.of<QrDetailsBloc>(context);
  QrCodeDetails _qrCodeDetails = const QrCodeDetails();

  @override
  void initState() {
    if (!widget.isComeFromQrScanner) {
      _bloc.add(FetchQrDetailsEvent(
          qrCodeDetailsId: widget.qrCodeDetailsIdOrQrScanner));
    } else {
      _qrCodeDetails = widget.validateVisitorQrCodeIn;
    }
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: BlocConsumer<QrDetailsBloc, QrDetailsState>(
        listener: (context, state) {
          if (state is SuccessFetchQrDetailsState) {
            _qrCodeDetails = state.qrCodeDetails;
          } else if (state is FailedFetchQrDetailsState) {
            _bloc.add(
                ShowMessageDialogErrorEvent(errorMessage: state.errorMessage));
          } else if (state is SuccessFetchQrDetailsForPinCodeState) {
            _qrCodeDetails = state.qrCodeDetails;
          } else if (state is FailedFetchQrDetailsForPinCodeState) {
            QrCodeDetailsHelper.showMessageDialogError(
                context: context,
                errorMessage: state.errorMessage,
                isMultiPop: true);
          } else if (state is ShowMessageDialogErrorState) {
            QrCodeDetailsHelper.showMessageDialogError(
              context: context,
              errorMessage: state.errorMessage,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: state is ShowingSkeletonQrDetailsState
                ? const QrDetailsSkeleton()
                : Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: const BoxDecoration(
                          color: ColorSchemes.primary,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(40.0),
                            topEnd: Radius.circular(40.0),
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
                      ),
                      QrDetailsCardWidget(qrCodeDetails: _qrCodeDetails),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

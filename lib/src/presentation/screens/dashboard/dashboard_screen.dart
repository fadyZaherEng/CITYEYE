import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_message_dialog_widget.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_last_five_day_cash_flow.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_tech_support_status.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/lock_up_data/get_lock_up_data_rows.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:city_eye/src/presentation/screens/dashboard/skeleton/dashboard_skeleton.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/cash_flow/cash_flow_widget.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/dashboard_header_section.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/maintainance/maintainance_request_widget.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/services/services_widget.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/user_states/user_states_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  final User user;
  final NotificationCount notificationCount;

  const DashboardScreen({
    super.key,
    required this.user,
    required this.notificationCount,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  final List<GetLockUpRows> _lockUpDataRows = [];
  final List<LookupFiles> _lookupFilesQr = [];
  final List<LookupFiles> _lookupFilesGuest = [];
  final List<GetQrStatus> _getQrStatus = [];
  final List<GetTechSupportStatus> _getTechSupportStatus = [];
  final List<GetCompoundLast5DayCashFlow> _getCompoundLast5DayCashFlow = [];
  GetCompoundAllUserStatus _getCompoundAllUserStatus =
      const GetCompoundAllUserStatus();
  List<Widget>? _screens;
  NotificationCount _notificationCount = const NotificationCount(count: 0);

  DashboardBloc get _bloc => BlocProvider.of<DashboardBloc>(context);
  bool isGetLookupRowsSuccess = false;
  bool isGetCompoundAllUserStatusSuccess = false;
  bool isGetTechSupportStatusSuccess = false;
  bool isGetCompoundTopFiveCashFlowSuccess = false;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentIndex,
    );
    _bloc.add(DashboardGetLookupRowsEvent());
    _bloc.add(DashboardGetCompoundAllUserStatusEvent());
    _bloc.add(DashboardGetQrStatusEvent());
    _bloc.add(DashboardGetTechSupportStatusEvent());
    _bloc.add(DashboardGetCompoundTopFiveCashFlowEvent());
    super.initState();
    _notificationCount = widget.notificationCount;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardGetLookupRowsSuccess) {
          _lookupFilesGuest.add(
            LookupFiles(
              name: S.of(context).all,
              code: S.of(context).all,
              id: -1,
              sortNo: -1,
            ),
          );
          _lookupFilesQr.add(LookupFiles(
            name: S.of(context).all,
            code: S.of(context).all,
            id: -1,
            sortNo: -1,
          ));
          _getQrStatus.add(
            GetQrStatus(
              name: S.of(context).all,
              code: S.of(context).all,
              id: -1,
              sortNo: -1,
            ),
          );

          _lockUpDataRows.addAll(state.getLockUpRows);
          _lockUpDataRows
              .map((e) => e.lookupCode == "QRType"
                  ? _lookupFilesQr.addAll(e.lookupFiles)
                  : e.lookupCode == "guestType"
                      ? _lookupFilesGuest.addAll(e.lookupFiles)
                      : null)
              .toList();
          isGetLookupRowsSuccess = true;
        } else if (state is DashboardGetLookupRowsError) {
          isGetLookupRowsSuccess = true;
          _showErrorDialog(context, state.errorMessage);
        } else if (state is DashboardGetCompoundAllUserStatusSuccess) {
          isGetCompoundAllUserStatusSuccess = true;
          _getCompoundAllUserStatus = state.getCompoundAllUserStatus;
        } else if (state is DashboardGetCompoundAllUserStatusError) {
          isGetCompoundAllUserStatusSuccess = true;
          _showErrorDialog(context, state.errorMessage);
        } else if (state is GetNotificationCountSuccessState) {
          _notificationCount = NotificationCount(count: state.count);
        } else if (state is GetNotificationCountFailedState) {
          _showErrorDialog(context, state.errorMessage);
        } else if (state is DashboardGetQrStatusSuccess) {
          _getQrStatus.addAll(state.getQrStatus);
        } else if (state is DashboardGetTechSupportStatusSuccess) {
          isGetTechSupportStatusSuccess = true;
          _getTechSupportStatus.add(GetTechSupportStatus(
            name: S.of(context).all,
            code: S.of(context).all,
            id: -1,
            sortNo: -1,
          ));
          _getTechSupportStatus.addAll(state.getTechSupportStatus);
        } else if (state is DashboardGetTechSupportStatusError) {
          isGetTechSupportStatusSuccess = true;
          _showErrorDialog(context, state.errorMessage);
        } else if (state is DashboardGetCompoundLastFiveDayCashFlowSuccess) {
          isGetCompoundTopFiveCashFlowSuccess = true;
          _getCompoundLast5DayCashFlow
              .addAll(state.getCompoundLastFiveDayCashFlow);
        } else if (state is DashboardGetCompoundLastFiveDayCashFlowError) {
          isGetCompoundTopFiveCashFlowSuccess = true;
          _showErrorDialog(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is DashboardGetCompoundAllUserStatusSkeleton ||
            !isGetLookupRowsSuccess ||
            !isGetCompoundAllUserStatusSuccess ||
            !isGetTechSupportStatusSuccess ||
            !isGetCompoundTopFiveCashFlowSuccess) {
          return const DashboardSkeleton();
        } else {
          _screens = [
            UserStatesWidget(
              lookupFilesGuest: _lookupFilesGuest,
              lookupFilesQr: _lookupFilesQr,
              getCompoundAllUserStatus: _getCompoundAllUserStatus,
              getQrStatus: _getQrStatus,
            ),
            MaintainanceRequestWidget(
              getTechSupportStatus: _getTechSupportStatus,
            ),
            const ServicesWidget(),
            CashFlowWidget(
              getCompoundLast5DayCashFlow: _getCompoundLast5DayCashFlow,
            ),
          ];
        }
        return Column(
          children: [
            const SizedBox(height: 20),
            DashboardHeaderSection(
              user: widget.user,
              notificationCount: _notificationCount,
              onNotificationTapped: () {
                Navigator.of(context)
                    .pushNamed(Routes.notifications)
                    .then((value) {
                  _getNotificationsCountEvent();
                });
              },
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  onPageChanged: (index) {
                    setState(() {
                      if (index == 4) {
                        _currentIndex = 0;
                        _pageController.jumpToPage(
                          _currentIndex,
                        );
                      } else {
                        _currentIndex = index;
                        _pageController.jumpToPage(
                          index,
                        );
                      }
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 4) {
                      index = 0;
                    }
                    return _screens != null
                        ? _screens![index]
                        : const DashboardSkeleton();
                  },
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                child: SizedBox(
                  height: 6,
                  width: 72,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                          _pageController.jumpToPage(
                            index,
                          );
                        });
                      },
                      child: Container(
                        width: _currentIndex == index ? 24 : 12,
                        height: 6,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 1,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4),
                          color: _currentIndex == index
                              ? ColorSchemes.primary
                              : ColorSchemes.dashboardGray,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _getNotificationsCountEvent() {
    _bloc.add(DashboardGetNotificationsCountEvent());
  }

  void _showErrorDialog(BuildContext context, String message) {
    showMessageDialogWidget(
        context: context,
        text: message,
        icon: ImagePaths.icWarningNew,
        buttonText: S.of(context).ok,
        onTap: () {
          Navigator.of(context).pop();
        });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardInitialEvent extends DashboardEvent {}

class DashBoardBottomSheetCloseEvent extends DashboardEvent {}

class DashboardGetLookupRowsEvent extends DashboardEvent {}

class DashboardIsOpacityFilterButtonFromUserStatesEvent extends DashboardEvent {
  bool isCanOpacity;
  DashboardIsOpacityFilterButtonFromUserStatesEvent({
    required this.isCanOpacity,
  });
}

class DashboardIsOpacityFilterButtonFromMaintainanceEvent
    extends DashboardEvent {
  bool isCanOpacity;
  DashboardIsOpacityFilterButtonFromMaintainanceEvent({
    required this.isCanOpacity,
  });
}

class DashboardPopBackEvent extends DashboardEvent {}

class DashboardGetQrNumbersEvent extends DashboardEvent {
  final String bottomSheetFromDate;
  final String bottomSheetToDate;
  final int guestTypeId;
  final int qrTypeId;
  final int qrStatusId;
  final int guestTypeIndex;
  final int qrTypeIndex;
  final int getQrStatusIndex;
  final bool isComeFromBottomSheet;
  DashboardGetQrNumbersEvent({
    required this.bottomSheetFromDate,
    required this.bottomSheetToDate,
    required this.guestTypeId,
    required this.qrTypeId,
    required this.qrStatusId,
    required this.guestTypeIndex,
    required this.qrTypeIndex,
    required this.isComeFromBottomSheet,
    required this.getQrStatusIndex,
  });
}

class DashboardGetNotificationsCountEvent extends DashboardEvent {}

class DashboardGetCompoundAllUserStatusEvent extends DashboardEvent {}

class DashboardGetSupportRequestNumbersEvent extends DashboardEvent {
  final String bottomSheetFromDate;
  final String bottomSheetToDate;
  final int supportStatusId;
  final int supportStatusIndex;
  final bool isComeFromBottomSheet;
  DashboardGetSupportRequestNumbersEvent({
    required this.bottomSheetFromDate,
    required this.bottomSheetToDate,
    required this.supportStatusId,
    required this.supportStatusIndex,
    required this.isComeFromBottomSheet,
  });
}

class DashboardGetTopFiveRequestNumbersEvent extends DashboardEvent {}

class DashboardGetQrStatusEvent extends DashboardEvent {}

class DashboardGetTechSupportStatusEvent extends DashboardEvent {}

class DashboardGetCompoundTopFiveCashFlowEvent extends DashboardEvent {}

part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashBoardBottomSheetCloseState extends DashboardState {
  bool isButtonClicked;
  bool isButtonOpacity;

  DashBoardBottomSheetCloseState({
    required this.isButtonClicked,
    required this.isButtonOpacity,
  });
}

class DashboardIsOpacityFilterButtonFromUserStates extends DashboardState {
  bool isCanOpacity;

  DashboardIsOpacityFilterButtonFromUserStates({
    required this.isCanOpacity,
  });
}

class GetNotificationCountSuccessState extends DashboardState {
  final int count;

  GetNotificationCountSuccessState({required this.count});
}

class GetNotificationCountFailedState extends DashboardState {
  final String errorMessage;

  GetNotificationCountFailedState({required this.errorMessage});
}

class DashboardIsOpacityFilterButtonFromMaintainance extends DashboardState {
  bool isCanOpacity;

  DashboardIsOpacityFilterButtonFromMaintainance({
    required this.isCanOpacity,
  });
}

class DashboardGetLookupRowsLoading extends DashboardState {}

class DashboardGetLookupRowsError extends DashboardState {
  final String errorMessage;

  DashboardGetLookupRowsError({required this.errorMessage});
}

class DashboardGetLookupRowsSuccess extends DashboardState {
  final List<GetLockUpRows> getLockUpRows;

  DashboardGetLookupRowsSuccess({required this.getLockUpRows});
}

class DashboardGetQrNumberLoading extends DashboardState {}

class DashboardPopBackState extends DashboardState {}

class DashboardGetQrNumberSuccess extends DashboardState {
  final GetQrNumber getQrNumber;
  final String bottomSheetFromDate;
  final String bottomSheetToDate;
  final int guestTypeIndex;
  final int qrTypeIndex;
  final int getQrStatusIndex;
  final bool isComeFromBottomSheet;
  final bool isButtonClicked;
  final bool isButtonOpacity;

  DashboardGetQrNumberSuccess({
    required this.getQrNumber,
    required this.bottomSheetFromDate,
    required this.bottomSheetToDate,
    required this.guestTypeIndex,
    required this.qrTypeIndex,
    required this.isComeFromBottomSheet,
    required this.isButtonClicked,
    required this.isButtonOpacity,
    required this.getQrStatusIndex,
  });
}

class DashboardGetQrNumberError extends DashboardState {
  final String errorMessage;

  DashboardGetQrNumberError({required this.errorMessage});
}

class DashboardGetCompoundAllUserStatusLoading extends DashboardState {}

class DashboardGetCompoundAllUserStatusSkeleton extends DashboardState {}

class DashboardGetCompoundAllUserStatusSuccess extends DashboardState {
  final GetCompoundAllUserStatus getCompoundAllUserStatus;

  DashboardGetCompoundAllUserStatusSuccess({
    required this.getCompoundAllUserStatus,
  });
}

class DashboardGetCompoundAllUserStatusError extends DashboardState {
  final String errorMessage;

  DashboardGetCompoundAllUserStatusError({
    required this.errorMessage,
  });
}

class DashboardGetSupportRequestNumbersLoading extends DashboardState {}

class DashboardGetSupportRequestNumbersSuccess extends DashboardState {
  final GetSupportNumber getSupportRequestNumbers;
  final bool isComeFromBottomSheet;
  final String bottomSheetFromDate;
  final String bottomSheetToDate;
  final int supportStatusIndex;
  final bool isButtonClicked;
  final bool isButtonOpacity;

  DashboardGetSupportRequestNumbersSuccess({
    required this.getSupportRequestNumbers,
    required this.isComeFromBottomSheet,
    required this.bottomSheetFromDate,
    required this.bottomSheetToDate,
    required this.supportStatusIndex,
    required this.isButtonClicked,
    required this.isButtonOpacity,
  });
}

class DashboardGetSupportRequestNumbersError extends DashboardState {
  final String errorMessage;

  DashboardGetSupportRequestNumbersError({required this.errorMessage});
}

class DashboardGetTopFiveUsersLoading extends DashboardState {}

class DashboardGetCompoundLastFiveDayCashFlowLoading extends DashboardState {}

class DashboardGetCompoundLastFiveDayCashFlowError extends DashboardState {
  final String errorMessage;

  DashboardGetCompoundLastFiveDayCashFlowError({required this.errorMessage});
}

class DashboardGetCompoundLastFiveDayCashFlowSuccess extends DashboardState {
  final List<GetCompoundLast5DayCashFlow> getCompoundLastFiveDayCashFlow;

  DashboardGetCompoundLastFiveDayCashFlowSuccess({
    required this.getCompoundLastFiveDayCashFlow,
  });
}

class DashboardGetTopFiveUsersSuccess extends DashboardState {
  final List<GetTopFiveUsers> getTopFiveUsers;

  DashboardGetTopFiveUsersSuccess({required this.getTopFiveUsers});
}

class GetTopFiveUsers {
  final String name;
  final int count;
  final double percentage;

  GetTopFiveUsers({
    required this.name,
    required this.count,
    required this.percentage,
  });
}

class DashboardGetTopFiveUsersError extends DashboardState {
  final String errorMessage;

  DashboardGetTopFiveUsersError({required this.errorMessage});
}

class DashboardGetQrStatusLoading extends DashboardState {}

class DashboardGetQrStatusSuccess extends DashboardState {
  final List<GetQrStatus> getQrStatus;

  DashboardGetQrStatusSuccess({required this.getQrStatus});
}

class DashboardGetQrStatusError extends DashboardState {
  final String errorMessage;

  DashboardGetQrStatusError({required this.errorMessage});
}

class DashboardGetTechSupportStatusLoading extends DashboardState {}

class DashboardGetTechSupportStatusSuccess extends DashboardState {
  final List<GetTechSupportStatus> getTechSupportStatus;

  DashboardGetTechSupportStatusSuccess({required this.getTechSupportStatus});
}

class DashboardGetTechSupportStatusError extends DashboardState {
  final String errorMessage;

  DashboardGetTechSupportStatusError({required this.errorMessage});
}

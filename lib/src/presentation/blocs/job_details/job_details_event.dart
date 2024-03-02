// ignore_for_file: must_be_immutable

part of 'job_details_bloc.dart';

@immutable
abstract class JobDetailsEvent {}

class BackEvent extends JobDetailsEvent {}

class GetJobsDetailsEvent extends JobDetailsEvent {
  final int requestId;

  GetJobsDetailsEvent({
    required this.requestId,
  });
}

class OnBottomReceiveClickEvent extends JobDetailsEvent {
  final ChangeSupportRequest changeSupportRequest;

  OnBottomReceiveClickEvent(this.changeSupportRequest);
}

class OnBottomStartJobClickEvent extends JobDetailsEvent {
  final ChangeSupportRequest changeSupportRequest;

  OnBottomStartJobClickEvent(this.changeSupportRequest);
}

class OnBottomCompleteClickEvent extends JobDetailsEvent {
  final ChangeSupportRequest changeSupportRequest;

  OnBottomCompleteClickEvent(this.changeSupportRequest);
}

class OnBottomMoreClickEvent extends JobDetailsEvent {}

class OnBottomCancelClickEvent extends JobDetailsEvent {
  final ChangeSupportRequest changeSupportRequest;

  OnBottomCancelClickEvent(this.changeSupportRequest);
}

class ActionWidgetClickedEvent extends JobDetailsEvent {}

class ExtractSupportAttachmentEvent extends JobDetailsEvent {
  final Support support;

  ExtractSupportAttachmentEvent({required this.support});
}

final class GetAvailableSupportStatusEvent extends JobDetailsEvent {
  final int statusId;

  GetAvailableSupportStatusEvent({
    required this.statusId,
  });
}

class OnBottomNeedPaymentClickEvent extends JobDetailsEvent {
  final ChangeSupportRequest changeSupportRequest;

  OnBottomNeedPaymentClickEvent(this.changeSupportRequest);
}

class OnBottomHoldClickEvent extends JobDetailsEvent {
  final ChangeSupportRequest changeSupportRequest;

  OnBottomHoldClickEvent(this.changeSupportRequest);
}

class OnNeedPaymentClickEvent extends JobDetailsEvent {}

class OnNeedPaymentClearDataEvent extends JobDetailsEvent {}

import 'package:equatable/equatable.dart';

class GetSupportNumber extends Equatable {
  final int numberOfAllSupportRequests;
  final int numberOfPendingRequests;
  final int numberOfProgressRequests;
  final int numberOfCompletedRequests;
  final int numberOfCancelledRequests;
  final int numberOfHoldRequests;
  final int numberOfNeedPaymentRequests;

  const GetSupportNumber({
    this.numberOfAllSupportRequests = 0,
    this.numberOfPendingRequests = 0,
    this.numberOfProgressRequests = 0,
    this.numberOfCompletedRequests = 0,
    this.numberOfCancelledRequests = 0,
    this.numberOfHoldRequests = 0,
    this.numberOfNeedPaymentRequests = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        numberOfAllSupportRequests,
        numberOfPendingRequests,
        numberOfProgressRequests,
        numberOfCompletedRequests,
        numberOfCancelledRequests,
        numberOfHoldRequests,
      ];
}

import 'package:equatable/equatable.dart';

class GetQrNumber extends Equatable {
  final int allQrNumber;
  final int cancelledQrNumber;
  final int completedQrNumber;
  final int pendingQrNumber;
  final int holdQrNumber;
  final int scannedQrNumber;
  const GetQrNumber({
    this.allQrNumber = 0,
    this.cancelledQrNumber = 0,
    this.completedQrNumber = 0,
    this.pendingQrNumber = 0,
    this.holdQrNumber = 0,
    this.scannedQrNumber = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        allQrNumber,
        cancelledQrNumber,
        completedQrNumber,
        pendingQrNumber,
        holdQrNumber,
        scannedQrNumber
      ];
}

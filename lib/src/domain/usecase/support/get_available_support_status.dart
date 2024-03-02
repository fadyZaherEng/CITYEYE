import 'package:city_eye/src/presentation/screens/job_details/utils/support_status.dart';

final class GetAvailableSupportStatusUseCase {
  List<SupportStatusEnum> call({required int statusId}) {
    List<SupportStatusEnum> availableStatus = [];
    if (statusId == 1) {
      // pending
      availableStatus
          .addAll([SupportStatusEnum.receive, SupportStatusEnum.cancel]);
    } else if (statusId == 2) {
      //progress
      availableStatus.addAll([
        SupportStatusEnum.complete,
        SupportStatusEnum.hold,
        SupportStatusEnum.needPayment,
      ]);
    } else if (statusId == 3) {
      //approved
      availableStatus.addAll([
        SupportStatusEnum.startJob,
        SupportStatusEnum.cancel,
        SupportStatusEnum.hold,
      ]);
    } else if (statusId == 4) {
      // completed
      availableStatus.add(SupportStatusEnum.needPayment);
    } else if (statusId == 6) {
      //Hold
      availableStatus.addAll([
        SupportStatusEnum.cancel,
        SupportStatusEnum.needPayment,
        SupportStatusEnum.complete
      ]);
    } else if (statusId == 7) {
      //needPayment
      availableStatus.addAll([
        SupportStatusEnum.hold,
        SupportStatusEnum.cancel,
        SupportStatusEnum.complete
      ]);
    }
    return availableStatus;
  }
}

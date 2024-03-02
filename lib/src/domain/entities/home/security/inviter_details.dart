import 'package:equatable/equatable.dart';

class InviterDetails extends Equatable {
  final int inviterId;
  final String inviterName;
  final String inviterPhoneNumber;

  const InviterDetails({
    this.inviterId = 0,
    this.inviterName = '',
    this.inviterPhoneNumber = '',
  });

  @override
  List<Object?> get props => [
        inviterId,
        inviterName,
        inviterPhoneNumber,
      ];
}

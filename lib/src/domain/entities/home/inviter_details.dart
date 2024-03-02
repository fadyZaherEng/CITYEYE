import 'package:equatable/equatable.dart';

final class InviterDetails extends Equatable {
  final int inviterId;
  final String inviterName;
  final String inviterPhoneNumber;

  const InviterDetails({
    this.inviterId = -1,
    this.inviterName = "",
    this.inviterPhoneNumber = "",
  });

  InviterDetails copyWith({
    int? inviterId,
    String? inviterName,
    String? inviterPhoneNumber,
  }) {
    return InviterDetails(
      inviterId: inviterId ?? this.inviterId,
      inviterName: inviterName ?? this.inviterName,
      inviterPhoneNumber: inviterPhoneNumber ?? this.inviterPhoneNumber,
    );
  }

  @override
  String toString() {
    return 'InviterDetails{inviterId: $inviterId, inviterName: $inviterName, inviterPhoneNumber: $inviterPhoneNumber}';
  }

  @override
  List<Object> get props => [inviterId, inviterName, inviterPhoneNumber];
}

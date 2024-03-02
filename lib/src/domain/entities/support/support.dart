import 'package:city_eye/src/domain/entities/support/support_attachment.dart';
import 'package:city_eye/src/domain/entities/support/support_category.dart';
import 'package:city_eye/src/domain/entities/support/support_compund_stuff.dart';
import 'package:city_eye/src/domain/entities/support/support_tech_status.dart';
import 'package:city_eye/src/domain/entities/support/support_user_units.dart';
import 'package:equatable/equatable.dart';

final class Support extends Equatable {
  final int requestId;
  final String requestDate;
  final String requestDescription;
  final SupportCompoundStuff supportCompoundStuff;
  final SupportUserUnits supportUserUnits;
  final SupportCategory supportCategory;
  final SupportTechStatus supportTechStatus;
  final List<SupportAttachment> supportAttachments;

  const Support({
    this.requestId = 0,
    this.requestDate = "",
    this.requestDescription = "",
    this.supportCompoundStuff = const SupportCompoundStuff(),
    this.supportUserUnits = const SupportUserUnits(),
    this.supportCategory = const SupportCategory(),
    this.supportTechStatus = const SupportTechStatus(),
    this.supportAttachments = const [],
  });

  @override
  List<Object> get props => [
        requestId,
        requestDate,
        requestDescription,
        supportCompoundStuff,
        supportUserUnits,
        supportCategory,
        supportTechStatus,
        supportAttachments,
      ];

  Support copyWith({
    int? requestId,
    String? requestDate,
    String? requestDescription,
    SupportCompoundStuff? supportCompoundStuff,
    SupportUserUnits? supportUserUnits,
    SupportCategory? supportCategory,
    SupportTechStatus? supportTechStatus,
    List<SupportAttachment>? supportAttachments,
  }) {
    return Support(
      requestId: requestId ?? this.requestId,
      requestDate: requestDate ?? this.requestDate,
      requestDescription: requestDescription ?? this.requestDescription,
      supportCompoundStuff: supportCompoundStuff ?? this.supportCompoundStuff,
      supportUserUnits: supportUserUnits ?? this.supportUserUnits,
      supportCategory: supportCategory ?? this.supportCategory,
      supportTechStatus: supportTechStatus ?? this.supportTechStatus,
      supportAttachments: supportAttachments ?? this.supportAttachments,
    );
  }
}

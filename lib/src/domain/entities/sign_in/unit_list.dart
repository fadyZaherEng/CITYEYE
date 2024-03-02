import 'package:equatable/equatable.dart';

class UnitLists extends Equatable {
  final int id;
  final int compoundId;
  final String compoundName;
  final int unitId;
  final String unitNo;
  final String unitName;
  final String compoundLogo;
  final String address;
  final bool isActive;
  final int userTypeId;
  final String userTypeName;
  final String userUnitContractEndDate;
  final bool isCompoundVerified;

  const UnitLists({
    this.id = 0,
    this.compoundId = 0,
    this.compoundName = "",
    this.unitId = 0,
    this.unitNo = "",
    this.unitName = "",
    this.compoundLogo = "",
    this.address = "",
    this.isActive = false,
    this.userTypeId = 0,
    this.userTypeName = "",
    this.userUnitContractEndDate = "",
    this.isCompoundVerified = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        compoundId,
        compoundName,
        unitId,
        unitNo,
        unitName,
        compoundLogo,
        address,
        isActive,
        userTypeId,
        userTypeName,
        userUnitContractEndDate,
        isCompoundVerified,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'compoundId': compoundId,
      'compoundName': compoundName,
      'unitId': unitId,
      'unitNo': unitNo,
      'unitName': unitName,
      'compoundLogo': compoundLogo,
      'address': address,
      'isActive': isActive,
      'userTypeId': userTypeId,
      'userTypeName': userTypeName,
      'userUnitContractEndDate': userUnitContractEndDate,
      'isCompoundVerified': isCompoundVerified,
    };
  }

  factory UnitLists.fromMap(Map<String, dynamic> map) {
    return UnitLists(
      id: map['id'] as int,
      compoundId: map['compoundId'] as int,
      compoundName: map['compoundName'] as String,
      unitId: map['unitId'] as int,
      unitNo: map['unitNo'] as String,
      unitName: map['unitName'] as String,
      compoundLogo: map['compoundLogo'] as String,
      address: map['address'] as String,
      isActive: map['isActive'] as bool,
      userTypeId: map['userTypeId'] as int,
      userTypeName: map['userTypeName'] as String,
      userUnitContractEndDate: map['userUnitContractEndDate'] as String,
      isCompoundVerified: map['isCompoundVerified'] as bool,
    );
  }
}

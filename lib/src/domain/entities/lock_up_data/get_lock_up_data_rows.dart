class GetLockUpRows {
  final String lookupCode;
  final List<LookupFiles> lookupFiles;

  const GetLockUpRows({
    required this.lookupCode,
    required this.lookupFiles,
  });
}

class LookupFiles {
  final int id;
  final String name;
  final String code;
  final int sortNo;

  const LookupFiles({
    required this.id,
    required this.name,
    required this.code,
    required this.sortNo,
  });
}

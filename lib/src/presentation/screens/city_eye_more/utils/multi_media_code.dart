enum MultiMediaCode {
  GALLERY,
  COMMUNITYREQUEST,
  DELEGATE,
  STAFF,
  TERMS,
  ABOUTUS,
  FAQ,
  REPORTISSUE,
  VISITOR,
  COMPOUNDRULES,
  SETTINGS,
  PROFILE,
}

String getMultiMediaType(MultiMediaCode multiMediaCode) {
  switch (multiMediaCode) {
    case MultiMediaCode.GALLERY:
      return "GALLERY";
    case MultiMediaCode.COMMUNITYREQUEST:
      return "COMMUNITYREQUEST";
    case MultiMediaCode.DELEGATE:
      return "DELEGATE";
    case MultiMediaCode.STAFF:
      return "STAFF";
    case MultiMediaCode.TERMS:
      return "TERMS&CONDITIONS";
    case MultiMediaCode.ABOUTUS:
      return "ABOUTUS";
    case MultiMediaCode.FAQ:
      return "FAQ";
    case MultiMediaCode.REPORTISSUE:
      return "REPORTISSUE";
    case MultiMediaCode.VISITOR:
      return "VISITOR";
    case MultiMediaCode.COMPOUNDRULES:
      return "COMPOUNDRULES";
    case MultiMediaCode.SETTINGS:
      return "SETTINGS";
    case MultiMediaCode.PROFILE:
      return "PROFILE";
  }
}

sealed class APIKeys {
  static const String baseUrlDevelopment =
      "http://108.181.167.130:8765/CityEye_API_Test_New/api/";
  static const String baseUrlProduction =
      "https://www.connecteye.ws/CityEye_API_Prod/api/";

  // Sign Path
  static const String signIn = "Mobile/Auth/StuffLogin";
  //city eye login
  static const String cityEyeLogin = "Mobile/Auth/Login";

  // Forgot Password
  static const String forgotPassword = 'Mobile/Auth/ForgetPassword';

  /* Home Path*/
  // Get Stuff Attendance Information
  static const String getStuffAttendanceInformation =
      "Mobile/Transaction/GetStuffAttendanceInfo";

  // Add Stuff Attendance
  static const String addStuffAttendance =
      "Mobile/Transaction/AddStuffAttendanceTransaction";

  // Get Visitors
  static const String getVisitors = "Mobile/Transaction/GetQrListForSecurity";

  // Get Qr Code Details
  static const String getQrCodeDetails = "Mobile/Transaction/QRCodeDetails";

  // Validate Visitor Qr Code
  static const String validateVisitorQrCode =
      "Mobile/Transaction/ValidateVisitorQrCodeIn";

  // Support
  static const String getSupportRequestList =
      "Mobile/Transaction/GetSupportRequestList";
  static const String getSupportRequestDetails =
      "Mobile/Transaction/GetSupportRequestDetails";
  static const String changeSupportRequestStatus =
      "Mobile/Transaction/ChangeSupportRequestStatus";
  static const String getSupportComments =
      "Mobile/Transaction/GetSupportComments";
  static const String addSupportComment =
      "Mobile/Transaction/AddSupportComment";
  static const String getQrNumbers = "Mobile/Transaction/GetQrNumbers";
  static const String getSupportRequestNumbers =
      "Mobile/Transaction/GetSupportRequestNumbers";
  static const String getServiceRequestNumbers =
      "Mobile/Transaction/GetServiceRequestNumbers";

  //More
  static const String notifications = "Mobile/Transaction/GetUserNotifications";
  static const String notificationDetail =
      "Mobile/Transaction/GetUserNotificationInfo";
  static const String disableNotifications =
      "Mobile/Transaction/EnableAndDisapleNotifications";
  static const String resetPassword = "Mobile/Auth/ResetPassword";
  static const String getLookupRows = "Mobile/LookupData/GetLookupRows";

  static const String getCoumpondAllUsersStatus =
      "Mobile/Transaction/GetCoumpondAllUsersStatus";
  static const String getCoumpondTopFiveServices =
      "Mobile/Transaction/GetCoumpondTopFiveServices";
  static const String language = "Mobile/LookupData/GetLanguages";

  static const String updateNotificationAsSeen =
      "Mobile/Configration/UpdateNotificationAsSeen";

  static const String getUserUnseenNotificationsCount =
      'Mobile/Configration/UnSeenTechUsersNotificationCount';
  static const String getTechSupportStatus =
      'Mobile/LookupData/GetTechSupportStatus';
  static const String getQrStatus = "Mobile/LookupData/GetQrStatus";
  static const String getCoumpondLast5DaysCashFlow =
      "Mobile/Transaction/GetCoumpondLast5DaysCashFlow";
  static const String getOffers = "Mobile/Configration/GetOffers";
  static const String getHomeSection =
      "Mobile/Configration/GetCompoundHomeSection";
  static const String getSurveyList = "Mobile/Configration/GetSurveyList";
  static const String submitSurvey = "Mobile/Configration/SubmitSurvey";
  static const String submitEventTransaction =
      "Mobile/Transaction/SubmitEventTransaction";
  static const String getCompoundConfigration =
      "Mobile/Configration/GetCompoundConfigration";
}

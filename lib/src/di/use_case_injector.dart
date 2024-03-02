import 'package:city_eye/src/domain/usecase/change_password/change_password_use_case.dart';
import 'package:city_eye/src/domain/usecase/change_password/change_password_validation_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_compound_all_user_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_compound_last_5_day_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_compound_top_five_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_qr_number_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_qr_status_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_service_number_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_support_number_use_case.dart';
import 'package:city_eye/src/domain/usecase/dashboard/get_tech_support_status_use_case.dart';
import 'package:city_eye/src/domain/usecase/forget_password/forget_password_use_case.dart';
import 'package:city_eye/src/domain/usecase/forget_password/forget_password_validation_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_device_info_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_firebase_notification_token_usecase.dart';
import 'package:city_eye/src/domain/usecase/get_language_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_no_internet_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_notification_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_remember_me_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_remote_languages_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_restart_app_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_unit_list_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_user_info_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_user_information_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/add_stuff_attendance_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_compound_configuration_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_compound_home_section_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_notifications_count_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_offer_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_qr_code_details_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_stuff_attendance_information_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_survey_list_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_validate_visitor_qr_code_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/get_visitors_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/submit_event_use_case.dart';
import 'package:city_eye/src/domain/usecase/home/submit_survey_use_case.dart';
import 'package:city_eye/src/domain/usecase/job_details_description_use_case.dart';
import 'package:city_eye/src/domain/usecase/lock_up_data/get_lock_up_rows_use_case.dart';
import 'package:city_eye/src/domain/usecase/notifications/get_notification_details_use_case.dart';
import 'package:city_eye/src/domain/usecase/notifications/get_notifications_use_case.dart';
import 'package:city_eye/src/domain/usecase/notifications/notification_disable_use_case.dart';
import 'package:city_eye/src/domain/usecase/notifications/update_notification_seen_use_case.dart';
import 'package:city_eye/src/domain/usecase/remove_remember_me_use_case.dart';
import 'package:city_eye/src/domain/usecase/remove_user_information_use_case.dart';
import 'package:city_eye/src/domain/usecase/save_firebase_notification_token_usecase.dart';
import 'package:city_eye/src/domain/usecase/save_user_information_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_device_info_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_language_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_no_internet_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_notification_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_remember_me_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_restart_app_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_user_info_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_user_unit_list_use_case.dart';
import 'package:city_eye/src/domain/usecase/sign-in/sign_in_use_case.dart';
import 'package:city_eye/src/domain/usecase/sign_in_validation_use_case.dart';
import 'package:city_eye/src/domain/usecase/support/add_support_comment_use_case.dart';
import 'package:city_eye/src/domain/usecase/support/change_support_status_use_case.dart';
import 'package:city_eye/src/domain/usecase/support/get_available_support_status.dart';
import 'package:city_eye/src/domain/usecase/support/get_support_comment_use_case.dart';
import 'package:city_eye/src/domain/usecase/support/get_support_details_use_case.dart';
import 'package:city_eye/src/domain/usecase/support/get_supports_use_case.dart';

import 'injector.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<SignInUseCase>(() => SignInUseCase(injector()));
  injector.registerFactory<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(injector()));
  injector.registerFactory<SetLanguageUseCase>(
      () => SetLanguageUseCase(injector()));

  injector.registerFactory<GetLanguageUseCase>(
      () => GetLanguageUseCase(injector()));

  injector.registerFactory<GetNotificationsUseCase>(
      () => GetNotificationsUseCase(injector()));

  injector.registerFactory<GetNotificationDetailsUseCase>(
      () => GetNotificationDetailsUseCase(injector()));

  injector.registerFactory<GetUserInformationUseCase>(
      () => GetUserInformationUseCase(injector()));
  injector.registerFactory<RemoveUserInformationUseCase>(
      () => RemoveUserInformationUseCase(injector()));

  injector.registerFactory<RemoveRememberMeUseCase>(
      () => RemoveRememberMeUseCase(injector()));

  injector.registerFactory<ChangePasswordValidationUseCase>(
      () => ChangePasswordValidationUseCase());

  injector.registerFactory<SignInValidationUseCase>(
    () => SignInValidationUseCase(),
  );
  injector.registerFactory<GetRememberMeUseCase>(() => GetRememberMeUseCase(
        injector(),
      ));

  injector.registerFactory<SetRememberMeUseCase>(() => SetRememberMeUseCase(
        injector(),
      ));

  injector.registerFactory<GetRestartAppUseCase>(() => GetRestartAppUseCase(
        injector(),
      ));
  injector.registerFactory<SetRestartAppUseCase>(() => SetRestartAppUseCase(
        injector(),
      ));

  injector.registerFactory<SaveUserInformationUseCase>(
      () => SaveUserInformationUseCase(
            injector(),
          ));

  injector.registerFactory<ForgetPasswordValidationUseCase>(
      () => ForgetPasswordValidationUseCase());

  injector.registerFactory<SaveFirebaseNotificationTokenUseCase>(
      () => SaveFirebaseNotificationTokenUseCase(
            injector(),
          ));

  // Home UseCases
  injector.registerFactory<GetStuffAttendanceInformationUseCase>(
      () => GetStuffAttendanceInformationUseCase(injector()));
  injector.registerFactory<AddStuffAttendanceUseCase>(
      () => AddStuffAttendanceUseCase(injector()));
  injector.registerFactory<GetVisitorsUseCase>(
      () => GetVisitorsUseCase(injector()));
  injector.registerFactory<GetQrCodeDetailsUseCase>(
      () => GetQrCodeDetailsUseCase(injector()));
  injector.registerFactory<GetValidateVisitorQrCodeUseCase>(
      () => GetValidateVisitorQrCodeUseCase(injector()));

  injector.registerFactory<GetSupportsUseCase>(
      () => GetSupportsUseCase(injector()));
  injector.registerFactory<GetSupportDetailsUseCase>(
      () => GetSupportDetailsUseCase(injector()));
  injector.registerFactory<GetSupportCommentsUseCase>(
      () => GetSupportCommentsUseCase(injector()));
  injector.registerFactory<AddSupportCommentUseCase>(
      () => AddSupportCommentUseCase(injector()));
  injector.registerFactory<GetAvailableSupportStatusUseCase>(
      () => GetAvailableSupportStatusUseCase());

  injector.registerFactory<NotificationsDisableUseCase>(
      () => NotificationsDisableUseCase(injector()));

  injector.registerFactory<ChangePasswordUseCase>(
      () => ChangePasswordUseCase(injector()));

  injector.registerFactory<SetNoInternetUseCase>(() => SetNoInternetUseCase(
        injector(),
      ));

  injector.registerFactory<GetNoInternetUseCase>(() => GetNoInternetUseCase(
        injector(),
      ));
  injector
      .registerFactory<GetSupportNumberUseCase>(() => GetSupportNumberUseCase(
            injector(),
          ));
  injector
      .registerFactory<GetServiceNumberUseCase>(() => GetServiceNumberUseCase(
            injector(),
          ));
  injector.registerFactory<GetQrNumberUseCase>(() => GetQrNumberUseCase(
        injector(),
      ));
  injector.registerFactory<GetLockUpRowsUseCase>(() => GetLockUpRowsUseCase(
        injector(),
      ));

  injector.registerFactory<GetCompoundAllUserUseCase>(
      () => GetCompoundAllUserUseCase(
            injector(),
          ));
  injector.registerFactory<GetCompoundTopFiveUseCase>(
      () => GetCompoundTopFiveUseCase(
            injector(),
          ));

  injector.registerFactory<GetFirebaseNotificationTokenUseCase>(
      () => GetFirebaseNotificationTokenUseCase(
            injector(),
          ));

  injector.registerFactory<ChangeSupportStatusUseCase>(
      () => ChangeSupportStatusUseCase(
            injector(),
          ));
  injector.registerFactory<SetNotificationStatusUseCase>(
      () => SetNotificationStatusUseCase(
            injector(),
          ));
  injector.registerFactory<GetNotificationStatusUseCase>(
      () => GetNotificationStatusUseCase(
            injector(),
          ));
  injector.registerFactory<JopDescriptionValidationUseCase>(
    () => JopDescriptionValidationUseCase(),
  );

  injector.registerFactory<GetRemoteLanguagesUseCase>(
      () => GetRemoteLanguagesUseCase(
            injector(),
          ));

  injector.registerFactory<GetNotificationsCountUseCase>(
      () => GetNotificationsCountUseCase(
            injector(),
          ));

  injector.registerFactory<UpdateNotificationSeenUseCase>(
      () => UpdateNotificationSeenUseCase(
            injector(),
          ));
  injector.registerFactory<GetQrStatusUseCase>(() => GetQrStatusUseCase(
        injector(),
      ));
  injector.registerFactory<GetTechSupportStatusUseCase>(
      () => GetTechSupportStatusUseCase(
            injector(),
          ));
  injector.registerFactory<GetCompoundLast5DayCashFlowUseCase>(
      () => GetCompoundLast5DayCashFlowUseCase(
            injector(),
          ));
  injector.registerFactory<GetOfferUseCase>(() => GetOfferUseCase(
        injector(),
      ));
  injector.registerFactory<GetCompoundHomeSectionUseCase>(
      () => GetCompoundHomeSectionUseCase(
            injector(),
          ));
  injector.registerFactory<SaveUnitListUseCase>(() => SaveUnitListUseCase(
        injector(),
      ));
  injector.registerFactory<GetUnitListUseCase>(() => GetUnitListUseCase(
        injector(),
      ));
  injector.registerFactory<GetUserInfoUseCase>(
      () => GetUserInfoUseCase(injector()));
  injector.registerFactory<SetUserInformationUseCase>(
      () => SetUserInformationUseCase(injector()));
  injector
      .registerFactory<GetDeviceUserInfoUseCase>(() => GetDeviceUserInfoUseCase(
            injector(),
          ));
  injector.registerFactory(() => SetDeviceUserInformationUseCase(
        injector(),
      ));
  injector.registerFactory<SubmitSurveyUseCase>(
      () => SubmitSurveyUseCase(injector()));
  injector.registerFactory<GetSurveyListUseCase>(
      () => GetSurveyListUseCase(injector()));
  injector.registerFactory<SubmitEventUseCase>(
      () => SubmitEventUseCase(injector()));
  injector.registerFactory<GetCompoundConfigurationUseCase>(
      () => GetCompoundConfigurationUseCase(injector()));
}

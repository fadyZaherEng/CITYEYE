import 'dart:io';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/request/submit_event_request.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/get_offers/request/get_offer_request.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/survey/request/submit_survey_request.dart';
import 'package:city_eye/src/data/sources/remote/home/request/add_stuff_attendance_request.dart';
import 'package:city_eye/src/data/sources/remote/home/request/qr_code_details_request.dart';
import 'package:city_eye/src/data/sources/remote/home/request/validate_visitor_qr_code_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_configuration.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_home_section.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_offers.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/submit_event.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/entities/home/security/validate_visitor_qr_code_in.dart';
import 'package:city_eye/src/domain/entities/home/stuff_attendance_information.dart';
import 'package:city_eye/src/domain/entities/home/visitor.dart';

abstract interface class HomeRepository {
  Future<DataState<UserAttendanceInformation>> getStuffAttendanceInformation();

  Future<DataState<UserAttendanceInformation>> addStuffAttendance(
      AddStuffAttendanceRequest addStuffAttendanceRequest);

  Future<DataState<List<Visitor>>> getVisitors();

  Future<DataState<QrCodeDetails>> getQrCodeDetails(
      QrCodeDetailsRequest qrCodeDetailsRequest);

  Future<DataState<ValidateVisitorQrCodeIn>> getValidateVisitorQrCode(
      ValidateVisitorQrCodeRequest validateVisitorQrCodeRequest);

  Future<DataState<NotificationCount>> getUserUnseenNotificationsCount();

  Future<DataState<List<GetOffers>>> getOffers({
    required GetOfferRequest getOfferRequest,
  });

  Future<DataState<GetCompoundHomeSection>> getHomeSection();

  Future<DataState<List<Surveys>>> getSurveyList();

  Future<DataState<Surveys>> submitSurvey({
    String? file,
    required SubmitSurveyRequest submitSurveyRequest,
  });

  Future<DataState<SubmitEvent>> submitEvent({
    Map<String, File>? file,
    required SubmitEventRequest submitEventRequest,
  });
  Future<DataState<GetCompoundConfiguration>> getCompoundConfiguration();
}

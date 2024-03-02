import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_qr_number_request.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_service_number_request.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_support_request.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_last_five_day_cash_flow.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_service_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_support_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_tech_support_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/service_data.dart';

abstract interface class DashboardRepository {
  Future<DataState<GetQrNumber>> getQrNumber({
    required GetQrNumberRequest getQrNumber,
  });
  Future<DataState<List<GetServiceNumber>>> getServiceNumber({
    required GetServiceNumberRequest getServiceNumber,
  });
  Future<DataState<GetSupportNumber>> getSupportNumber({
    required GetSupportRequest getSupportNumber,
  });
  Future<DataState<GetCompoundAllUserStatus>> getCompoundAllUserStatus();
  Future<DataState<List<ServiceData>>> getCompoundTopFive();
  Future<DataState<List<GetTechSupportStatus>>> getTechSupportStatus();
  Future<DataState<List<GetQrStatus>>> getQrStatus();
  Future<DataState<List<GetCompoundLast5DayCashFlow>>>
      getCompoundLast5DayCashFlow();
}

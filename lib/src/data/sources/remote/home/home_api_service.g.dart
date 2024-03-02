// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _HomeAPIService implements HomeAPIService {
  _HomeAPIService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteUserAttendanceInformation>>>
      getStuffAttendanceInformation(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<CityEyeTechResponse<RemoteUserAttendanceInformation>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Transaction/GetStuffAttendanceInfo',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<RemoteUserAttendanceInformation>.fromJson(
      _result.data!,
      (json) => RemoteUserAttendanceInformation.fromJson(
          json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteUserAttendanceInformation>>>
      addStuffAttendance(
          CityEyeTechRequest<AddStuffAttendanceRequest> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<CityEyeTechResponse<RemoteUserAttendanceInformation>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Transaction/AddStuffAttendanceTransaction',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<RemoteUserAttendanceInformation>.fromJson(
      _result.data!,
      (json) => RemoteUserAttendanceInformation.fromJson(
          json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteVisitor>>>> getVisitors(
      CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<List<RemoteVisitor>>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Mobile/Transaction/GetQrListForSecurity',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<List<RemoteVisitor>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteVisitor>(
                  (i) => RemoteVisitor.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteQrCodeDetails>>>
      getQrCodeDetails(CityEyeTechRequest<QrCodeDetailsRequest> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<RemoteQrCodeDetails>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Mobile/Transaction/QRCodeDetails',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<RemoteQrCodeDetails>.fromJson(
      _result.data!,
      (json) => RemoteQrCodeDetails.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteValidateVisitorQrCodeIn>>>
      getValidateVisitorQrCode(
          CityEyeTechRequest<ValidateVisitorQrCodeRequest> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<CityEyeTechResponse<RemoteValidateVisitorQrCodeIn>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Transaction/ValidateVisitorQrCodeIn',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<RemoteValidateVisitorQrCodeIn>.fromJson(
      _result.data!,
      (json) =>
          RemoteValidateVisitorQrCodeIn.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteNotificationCount>>>
      getUserUnseenNotificationsCount(
          CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<CityEyeTechResponse<RemoteNotificationCount>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Mobile/Configration/UnSeenTechUsersNotificationCount',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = CityEyeTechResponse<RemoteNotificationCount>.fromJson(
      _result.data!,
      (json) => RemoteNotificationCount.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteGetOffers>>>> getOffers(
      CityEyeTechRequest<GetOfferRequest> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<CityEyeTechResponse<List<RemoteGetOffers>>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Mobile/Configration/GetOffers',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = CityEyeTechResponse<List<RemoteGetOffers>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteGetOffers>(
                  (i) => RemoteGetOffers.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteGetCompoundHomeSection>>>
      getHomeSection(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<CityEyeTechResponse<RemoteGetCompoundHomeSection>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Configration/GetCompoundHomeSection',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<RemoteGetCompoundHomeSection>.fromJson(
      _result.data!,
      (json) =>
          RemoteGetCompoundHomeSection.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteSurveys>>> submitSurvey(
    String requestHeader,
    List<MultipartFile> files,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'requestHeader',
      requestHeader,
    ));
    _data.files.addAll(files.map((i) => MapEntry('Files', i)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<RemoteSurveys>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
                .compose(
                  _dio.options,
                  'Mobile/Configration/SubmitSurvey',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<RemoteSurveys>.fromJson(
      _result.data!,
      (json) => RemoteSurveys.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteSurveys>>>> getSurveyList(
      CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<List<RemoteSurveys>>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Mobile/Configration/GetSurveyList',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<List<RemoteSurveys>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteSurveys>(
                  (i) => RemoteSurveys.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteSubmitEvent>>> submitEvent(
    String requestHeader,
    List<MultipartFile> files,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'requestHeader',
      requestHeader,
    ));
    _data.files.addAll(files.map((i) => MapEntry('Files', i)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<RemoteSubmitEvent>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
                .compose(
                  _dio.options,
                  'Mobile/Transaction/SubmitEventTransaction',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<RemoteSubmitEvent>.fromJson(
      _result.data!,
      (json) => RemoteSubmitEvent.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteGetCompoundConfiguration>>>
      getCompoundConfigration(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<CityEyeTechResponse<RemoteGetCompoundConfiguration>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Configration/GetCompoundConfigration',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<RemoteGetCompoundConfiguration>.fromJson(
      _result.data!,
      (json) =>
          RemoteGetCompoundConfiguration.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

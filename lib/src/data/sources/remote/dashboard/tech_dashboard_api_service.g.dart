// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tech_dashboard_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DashboardApiService implements DashboardApiService {
  _DashboardApiService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteGetQrNumber>>> getQrNumber(
      CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<RemoteGetQrNumber>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Mobile/Transaction/GetQrNumbers',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<RemoteGetQrNumber>.fromJson(
      _result.data!,
      (json) => RemoteGetQrNumber.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteGetServiceNumber>>>>
      getServiceNumber(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<CityEyeTechResponse<List<RemoteGetServiceNumber>>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Transaction/GetServiceRequestNumbers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<List<RemoteGetServiceNumber>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteGetServiceNumber>((i) =>
                  RemoteGetServiceNumber.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteGetSupportNumber>>>
      getSupportNumber(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<CityEyeTechResponse<RemoteGetSupportNumber>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Mobile/Transaction/GetSupportRequestNumbers',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = CityEyeTechResponse<RemoteGetSupportNumber>.fromJson(
      _result.data!,
      (json) => RemoteGetSupportNumber.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteGetCompoundAllUserStatus>>>
      getCompoundAllUserStatus(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<CityEyeTechResponse<RemoteGetCompoundAllUserStatus>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Transaction/GetCoumpondAllUsersStatus',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<RemoteGetCompoundAllUserStatus>.fromJson(
      _result.data!,
      (json) =>
          RemoteGetCompoundAllUserStatus.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteServiceData>>>>
      getCompoundTopFive(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<CityEyeTechResponse<List<RemoteServiceData>>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Mobile/Transaction/GetCoumpondTopFiveServices',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = CityEyeTechResponse<List<RemoteServiceData>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteServiceData>(
                  (i) => RemoteServiceData.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteGetTechSupportStatus>>>>
      getTechSupportStatus(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<
            CityEyeTechResponse<List<RemoteGetTechSupportStatus>>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Mobile/LookupData/GetTechSupportStatus',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value =
        CityEyeTechResponse<List<RemoteGetTechSupportStatus>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteGetTechSupportStatus>((i) =>
                  RemoteGetTechSupportStatus.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteGetQrStatus>>>>
      getQrStatus(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<CityEyeTechResponse<List<RemoteGetQrStatus>>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Mobile/LookupData/GetQrStatus',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = CityEyeTechResponse<List<RemoteGetQrStatus>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteGetQrStatus>(
                  (i) => RemoteGetQrStatus.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<
          HttpResponse<
              CityEyeTechResponse<List<RemoteGetCompoundLast5DayCashFlow>>>>
      getCompoundLast5DayCashFlow(CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            HttpResponse<
                CityEyeTechResponse<List<RemoteGetCompoundLast5DayCashFlow>>>>(
        Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Transaction/GetCoumpondLast5DaysCashFlow',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value =
        CityEyeTechResponse<List<RemoteGetCompoundLast5DayCashFlow>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteGetCompoundLast5DayCashFlow>((i) =>
                  RemoteGetCompoundLast5DayCashFlow.fromJson(
                      i as Map<String, dynamic>))
              .toList()
          : List.empty(),
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

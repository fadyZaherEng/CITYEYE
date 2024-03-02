// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SupportAPIService implements SupportAPIService {
  _SupportAPIService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteSupport>>>> getSupports(
      CityEyeTechRequest<dynamic> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<List<RemoteSupport>>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Mobile/Transaction/GetSupportRequestList',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<List<RemoteSupport>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteSupport>(
                  (i) => RemoteSupport.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteSupport>>> getSupportDetails(
      CityEyeTechRequest<SupportDetailsRequest> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<RemoteSupport>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Mobile/Transaction/GetSupportRequestDetails',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<RemoteSupport>.fromJson(
      _result.data!,
      (json) => RemoteSupport.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteSupport>>> changeSupport(
      CityEyeTechRequest<ChangeSupportRequest> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<RemoteSupport>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'Mobile/Transaction/ChangeSupportRequestStatus',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<RemoteSupport>.fromJson(
      _result.data!,
      (json) => RemoteSupport.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteSupportComment>>>>
      getSupportComments(
          CityEyeTechRequest<GetSupportCommentsRequest> request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<CityEyeTechResponse<List<RemoteSupportComment>>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Mobile/Transaction/GetSupportComments',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = CityEyeTechResponse<List<RemoteSupportComment>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteSupportComment>((i) =>
                  RemoteSupportComment.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<List<RemoteSupportComment>>>>
      addSupportComment(
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
    _data.files.addAll(files.map((i) => MapEntry('image', i)));
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<CityEyeTechResponse<List<RemoteSupportComment>>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'Mobile/Transaction/AddSupportComment',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = CityEyeTechResponse<List<RemoteSupportComment>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<RemoteSupportComment>((i) =>
                  RemoteSupportComment.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteSupport>>> changeSupportStatus(
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
    _data.files.addAll(files.map((i) => MapEntry('files', i)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<RemoteSupport>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
                .compose(
                  _dio.options,
                  'Mobile/Transaction/ChangeSupportRequestStatus',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = CityEyeTechResponse<RemoteSupport>.fromJson(
      _result.data!,
      (json) => RemoteSupport.fromJson(json as Map<String, dynamic>),
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

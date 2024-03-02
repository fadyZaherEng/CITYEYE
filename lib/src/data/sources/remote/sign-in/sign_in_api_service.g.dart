// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SignInAPIService implements SignInAPIService {
  _SignInAPIService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteUser>>> signIn(
      CityEyeTechRequest<SignInRequest> signInRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(signInRequest.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<RemoteUser>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Auth/StuffLogin',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<RemoteUser>.fromJson(
      _result.data!,
      (json) => RemoteUser.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<RemoteLogin>>> cityEyeLogin(
      CityEyeTechRequest<SignInRequest> signInRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(signInRequest.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<RemoteLogin>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Auth/Login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<RemoteLogin>.fromJson(
      _result.data!,
      (json) => RemoteLogin.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CityEyeTechResponse<dynamic>>> forgotPassword(
      CityEyeTechRequest<ForgotPasswordRequest> forgotPasswordRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(forgotPasswordRequest.toJson((value) => value.toJson()));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CityEyeTechResponse<dynamic>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Mobile/Auth/ForgetPassword',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CityEyeTechResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
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

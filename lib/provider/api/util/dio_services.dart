import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dio_interceptor.dart';
import 'global_api_field.dart';

/// <h2> dioService singleton service </h2>
///* DioServices().to()로 사용
class DioServices {
  ///*임시 jwt 토큰
  ///토큰 초기화 이전에 빈값으로 선언
  String tmpToken = "";
  static final DioServices _dioServices = DioServices._internal();

  //dioService singleton
  factory DioServices() => _dioServices;

  //dio 객체
  static Dio _dio = Dio();

  DioServices._internal() {
    BaseOptions _baseOptions = BaseOptions(
      baseUrl: dotenv.env["devApiUrl"]!,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-AUTH-TOKEN': tmpToken
      },
    );
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(CustomDioInterceptor());
  }

  Dio to() {
    return _dio;
  }

  // accessToken을 업데이트하는 메서드 추가
  void setAccessToken(String accessToken) {
    _dio.options.headers[TOKEN_HEADER] = accessToken;
  }

  // accessToken을 업데이트하는 메서드 추가
  void removeAccessToken() {
    _dio.options.headers.remove(TOKEN_HEADER);
  }
  // 헤더에 값을 업데이트하는 메서드 추가
  void addHeader(String key, String value) {
    _dio.options.headers[key] = value;
  }
  // 헤더에 값을 업데이트하는 메서드 추가
  void removeHeader(String key) {
    _dio.options.headers.remove(key);
  }
}

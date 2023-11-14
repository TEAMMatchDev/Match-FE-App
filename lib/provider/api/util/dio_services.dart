import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as Get;
import '../../../util/const/style/global_logger.dart';
import '../../../util/method/get_storage.dart';
import '../../routes/routes.dart';
import 'dio_interceptor.dart';
import 'global_api_code.dart';
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
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: CustomDioInterceptor().onRequest,
        onResponse:CustomDioInterceptor().onResponse,
        onError: (DioException err, ErrorInterceptorHandler handler) async {
          logger.e("Error Message ${err.response
              ?.data[MSG]} \nError code ${err.response?.data[CODE]}");
          switch (err.response?.data[CODE]) {
            case EXPIRE_TOKEN :
              await requestByNewAccessToken(err, handler);
            case UNAUTHORIZE:
              Fluttertoast.showToast(msg: "자동 로그인이 해제되었습니다. 로그인 화면으로 돌아갑니다.");
              //response에서 import 충돌로 Get으로 import 처리
              Get.Get.offAllNamed(Routes.login);
              break;

          }
          return handler.next(err);
        }));
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
  ///* refresh Token
  Future<void> requestByNewAccessToken(DioException err, ErrorInterceptorHandler handler)async{
    var newAccessToken = await setNewAccessToken();
    // AccessToken의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
    err.requestOptions.headers[TOKEN_HEADER] =
        newAccessToken;

    // 수행하지 못했던 API 요청 복사본 생성
    final clonedRequest = await _dio.request(err.requestOptions.path,
        options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers),
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters);

    // header 새로운 AccessToken으로 갱신
    _dio.options.headers[TOKEN_HEADER] =
        newAccessToken;
    // API 복사본으로 재요청
    return handler.resolve(clonedRequest);
  }
}

///* refresh Token을 새 Dio 객체를 생성하여, 요청하는 함수
Future<String> setNewAccessToken() async {
  // 토큰 갱신 요청을 담당할 dio 객체 구현 후 그에 따른 interceptor 정의
  var refreshDio = Dio();
  refreshDio.interceptors.clear();
  refreshDio.interceptors
      .add(InterceptorsWrapper(onError: (error, handler) async {
    logger.e(
        "Error Message ${error.response?.data[MSG]} \n Error code ${error.response?.data[CODE]}");
    // RefreshToken 또한 만료되어 재로그인이 필요한 경우
    if (error.response?.data[CODE] == UNAUTHORIZE ||
        error.response?.data[CODE] == EXPIRE_TOKEN) {
      Fluttertoast.showToast(msg: "자동 로그인이 해제되었습니다. 로그인 화면으로 돌아갑니다.");
      //response에서 import 충돌로 Get으로 import 처리
      Get.Get.offAllNamed(Routes.login);
    }
    return handler.next(error);
  }));
  var refreshToken = await GetStorageUtil.getToken(StorageKey.REFRESH_TOKEN);
  logger.e("refresh token : $refreshToken");
  BaseOptions _baseOptions = BaseOptions(
    baseUrl: dotenv.env["devApiUrl"]!,
    connectTimeout: const Duration(milliseconds: 10000),
    receiveTimeout: const Duration(milliseconds: 10000),
    sendTimeout: const Duration(milliseconds: 10000),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      REFRESH_HEADER: refreshToken
    },
  );
  refreshDio.options = _baseOptions;
  // 토큰 갱신 API 요청
  Response refreshResponse = await refreshDio.post('/users/refresh');
  var accessToken = refreshResponse.data[RESULT]["accessToken"];
  // 기기에 저장된 AccessToken
  await GetStorageUtil.addToken(StorageKey.ACCESS_TOKEN, accessToken);
//TODO: refreshToken 갱신 요청
  return accessToken;
}

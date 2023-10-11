import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../util/const/style/global_logger.dart';

class CustomDioInterceptor extends Interceptor {
  // 1) 요청 보낼때
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i("[REQ] ${options.method} Url ${options.uri} ");
    String header = "";
    options.headers.forEach((key, value) {
      header += '$key:$value\n';
    });
    logger.i("[Header] ${header} ");

    String queryParam = "";
    options.queryParameters.forEach((key, value) {
      queryParam += '$key : $value\n';
    });
    logger.i(queryParam);

    logger.i("Data ${options.data} >>");
    options.connectTimeout != null
        ? ((timeout) => logger.e("Connect Timeout $timeout"))
        : null;
    options.receiveTimeout != null
        ? ((timeout) => logger.e("Receive Timeout $timeout"))
        : null;
    options.sendTimeout != null
        ? ((timeout) => logger.e("Send Timeout $timeout"))
        : null;
    return super.onRequest(options, handler);
  }

  // 2) 응답을 받을때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
        "<< [RESPONSE ${response.statusCode}] Url: ${response.requestOptions.uri} >>");
    logger.i("${response.statusMessage}");
    logger.i("${response.requestOptions.data}");

    logger.i("Connect Timeout ${response.requestOptions.connectTimeout}");
    logger.i("Send Timeout ${response.requestOptions.sendTimeout}");
    logger.i("Receive Timeout ${response.requestOptions.receiveTimeout}");
    return super.onResponse(response, handler);
  }

  // 3) 에러가 났을때
  @override
  void onError(DioException exception, ErrorInterceptorHandler handler) {
    logger.e("Error ${exception.error}");
    logger.e("Error Message ${exception.message}");

    return super.onError(exception, handler);
  }
}

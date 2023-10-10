import 'package:dio/dio.dart';

import '../../../model/util/common/api_error/api_error.dart';
import '../../../model/util/common/common.dart';

extension DioExtensions on Dio {
  Future<ApiResult<dynamic>> safePost(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await post(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);

      return ApiResult.fromResponse(response);
    } on DioException catch (exception) {
      return NetworkError(
        ApiError(
            isSuccess: false,
            code: exception.response?.statusCode.toString() ?? "",
            message: exception.message ?? ""),
      );
    }
  }

  Future<ApiResult<dynamic>> safeGet(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await get(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      return ApiResult.fromResponse(response);
    } on DioException catch (exception) {
      return NetworkError(
        ApiError(
            isSuccess: false,
            code: exception.response?.statusCode.toString() ?? "",
            message: exception.message ?? ""),
      );
    }
  }
}

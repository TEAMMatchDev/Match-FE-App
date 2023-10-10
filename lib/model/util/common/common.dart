import 'package:dio/dio.dart';
import 'package:match/model/util/common/api_error/api_error.dart';

abstract class ApiResult<T> {
  static const String RESULT = "result";
  static const String IS_SUCCESS = "isSuccess";

  ///*에러, 성공 여부를 판별해주는 GenericType function
  static ApiResult fromResponse(Response response) {
    final responseData = response.data;

    if (!responseData[IS_SUCCESS]) {
      return ServerError.fromResponse(response);
    } else if (responseData[RESULT] != null) {
      return Success(response.data[RESULT]);
    } else {
      return InternalError();
    }
  }
}

class Success<T> extends ApiResult<T> {
  final T data;
  Success(this.data);
}

class Failed<T> extends ApiResult<T> {
  ApiError errors;

  Failed(this.errors);
}

class ServerError<T> extends Failed<T> {
  ServerError(ApiError errors) : super(errors);

  static ServerError<T> fromResponse<T>(Response response) {
    return ServerError(response.data);
  }
}

class NetworkError<T> extends Failed<T> {
  NetworkError(ApiError errors) : super(errors);
}

class InternalError<T> extends Failed<T> {
  InternalError()
      : super(const ApiError(
            isSuccess: false, code: "500", message: "Internal Server Error"));
}

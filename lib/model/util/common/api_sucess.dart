class Success<T> {
  final bool isSuccess;
  final String code;
  final String message;
  final T data;

  Success(
      {required this.isSuccess,
      required this.code,
      required this.message,
      required this.data});

  Success.fromMap(
    Map<String, dynamic> map,
  )   : isSuccess = map['isSuccess'],
        code = map['code'],
        message = map['message'],
        data = map['data'];

  Success fromJson(Map<String, dynamic> json) => Success(
      isSuccess: json['isSuccess'],
      code: json['code'],
      message: json['message'],
      data: json['data']);

  Map<String, dynamic> toJson() =>
      {"isSuccess": isSuccess, "code": code, "message": message, "data": data};
}

class SimpleResult<T> {
  final bool isSuccess;
  final String? errorMessage;
  final T? data;

  SimpleResult({required this.isSuccess, this.errorMessage, this.data});

  factory SimpleResult.fromJson(Map<String, dynamic> json) => SimpleResult(
        isSuccess: json["isSuccess"],
        errorMessage: json["errorMessage"],
        data: json["data"],
      );
}

abstract class GenericResponse<T> {
  T fromJson(Map<String, dynamic> json);
}

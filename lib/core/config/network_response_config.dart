import 'package:dio/dio.dart';

abstract class NetworkResponseConfig {
  NetworkResponseConfig();
}

class NetworkSuccesResponse<T> extends NetworkResponseConfig {
  T model;
  NetworkSuccesResponse(this.model);
}

class NetworkErrorResponse extends NetworkResponseConfig {
  String error;
  NetworkErrorResponse(this.error);
}

class NetworkExeptionResponse extends NetworkResponseConfig {
  DioError exeption;
  String messageForUser = "";
  NetworkExeptionResponse(this.exeption) {
    if (exeption.type == DioErrorType.connectionTimeout ||
        exeption.type == DioErrorType.receiveTimeout ||
        exeption.type == DioErrorType.sendTimeout ||
        exeption.type == DioErrorType.unknown) {
      messageForUser = 'Iltimos Internetingizni tekshiring';
    } else {
      messageForUser == exeption.message.toString();
    }
  }
}

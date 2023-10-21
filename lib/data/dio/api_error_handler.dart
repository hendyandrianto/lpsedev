// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.badCertificate:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.badResponse:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.connectionError:
              errorDescription = "Connection Err.";
              break;
            case DioErrorType.unknown:
              break;
            case DioErrorType.sendTimeout:
              break;
            case DioErrorType.receiveTimeout:
              break;
            case DioErrorType.cancel:
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}

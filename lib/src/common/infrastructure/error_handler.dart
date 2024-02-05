import 'dart:io';

import '../domain/app_failure.dart';

class ErrorHandler {
  static AppFailure mapError(exception) {
    switch (exception.runtimeType) {
      case HttpException:
        return _httpException(exception as HttpException);
      default:
        return AppFailure(message: 'Algo deu errado!');
    }
  }

  static AppFailure _httpException(exception) {
    switch (exception.statusCode) {
      case 400:
        return AppFailure(message: 'Bad request');
      case 401:
        return AppFailure(message: 'Unauthorized access');
      case 403:
        return AppFailure(message: 'Forbidden action');
      case 404:
        return AppFailure(message: 'Resource not found');
      case 409:
        return AppFailure(message: 'Conflict with existing data');
      case 422:
        return AppFailure(message: 'Invalid data sent');
      case 500:
        return AppFailure(message: 'Internal server error');
      case 502:
        return AppFailure(message: 'Bad gateway');
      case 503:
        return AppFailure(message: 'Service unavailable');
      case 504:
        return AppFailure(message: 'Gateway timeout');
      default:
        return AppFailure(message: 'Unexpected server error');
    }
  }
}

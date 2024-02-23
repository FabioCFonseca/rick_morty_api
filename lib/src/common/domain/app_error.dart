class AppError implements Exception {
  final int statusCode;
  final String errorMessage;

  factory AppError({required int statusCode}) {
    String message;
    switch (statusCode) {
      case 400:
        message = 'Bad request: The server could not understand the request.';
        break;
      case 401:
        message = 'Unauthorized: The request requires authentication.';
        break;
      case 403:
        message = 'Forbidden: The server refused to fulfill the request.';
        break;
      case 404:
        message = 'Not found: The requested resource could not be found.';
        break;
      case 500:
        message = 'Internal server error: The server encountered an unexpected error.';
        break;
      default:
        message = 'An unknown error occurred.';
        break;
    }
    return AppError._(statusCode, message);
  }

  const AppError._(this.statusCode, this.errorMessage);

  @override
  String toString() => 'AppError: $errorMessage';
}

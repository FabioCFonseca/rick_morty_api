class AppError implements Exception {
  final int? statusCode;

  AppError({
    required this.statusCode,
  });

  String getErrorMessage() {
    if (statusCode != null) {
      switch (statusCode) {
        case 200:
          return 'Teste';
        case 400:
          return 'Bad request: The server could not understand the request.';
        case 401:
          return 'Unauthorized: The request requires authentication.';
        case 403:
          return 'Forbidden: The server refused to fulfill the request.';
        case 404:
          return 'Not found: The requested resource could not be found.';
        case 500:
          return 'Internal server error: The server encountered an unexpected error.';
        default:
          return 'An unknown error occurred.';
      }
    } else {
      return 'An unknown error occurred. ';
    }
  }

  @override
  String toString() {
    return 'AppError: ${getErrorMessage()}';
  }
}

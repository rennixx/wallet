class ServerException implements Exception {
  final String message;
  const ServerException({this.message = 'Server Error'});
}

class CacheException implements Exception {
  final String message;
  const CacheException({this.message = 'Cache Error'});
}

class NetworkException implements Exception {
  final String message;
  const NetworkException({this.message = 'Network Error'});
}

class AuthException implements Exception {
  final String message;
  const AuthException({this.message = 'Authentication Error'});
}

class DatabaseException implements Exception {
  final String message;
  const DatabaseException({this.message = 'Database Error'});
}

class ValidationException implements Exception {
  final String message;
  const ValidationException({this.message = 'Validation Error'});
}

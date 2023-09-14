abstract class MException implements Exception {
  final String? message;

  MException([this.message]);
}

class ServerException extends MException {
  ServerException([super.message]);
}

class NetworkException extends MException {
  NetworkException([super.message]);
}

class LocalException extends MException {
  LocalException([super.message]);
}

class CacheException extends LocalException {
  CacheException([super.message]);
}

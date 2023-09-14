abstract class Failure {
  String? message;
  Failure([this.message]);
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class LocalFailure extends Failure {
  LocalFailure(super.message);
}

class CacheFailure extends LocalFailure {
  CacheFailure(super.message);
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => 'Network error: $message';
}

class EmailAlreadyInUseException implements Exception {
  final String message;
  EmailAlreadyInUseException(this.message);

  @override
  String toString() => message;
}

class InvalidEmailException implements Exception {
  final String message;
  InvalidEmailException(this.message);

  @override
  String toString() => message;
}

class WeakPasswordException implements Exception {
  final String message;
  WeakPasswordException(this.message);

  @override
  String toString() => message;
}

class GenericAuthException implements Exception {
  final String message;
  GenericAuthException(this.message);

  @override
  String toString() => 'Authentication failed: $message';
}

class InvalidCredentialsException implements Exception {
  final String message;
  InvalidCredentialsException(this.message);

  @override
  String toString() => message;
}

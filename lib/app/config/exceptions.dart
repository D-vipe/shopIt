class ConnectionException implements Exception {}

class ParseException implements Exception {}

class NotFoundException implements Exception {}

class CredentialsException implements Exception {}

class ServerException implements Exception {
  final String message;
  ServerException({required this.message});

  @override
  String toString() {
    return message;
  }
}

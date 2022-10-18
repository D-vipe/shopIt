import 'package:shop_it/enums/error_codes.dart';

class CheckAuthCredentials {
  final String login;
  final String password;

  CheckAuthCredentials({required this.login, required this.password});
}

class AuthSuccess {
  // TODO add success auth object params here

  AuthSuccess();
}

class ErrorAction {
  final String login;
  final String password;
  final String errorMessage;
  final ErrorCode errorCode;

  ErrorAction({
    required this.login,
    required this.password,
    required this.errorMessage,
    required this.errorCode,
  });
}

import 'package:shop_it/enums/error_codes.dart';

class CheckRegCredentials {
  final String login;
  final String password;
  final String repeatPassword;

  CheckRegCredentials({required this.login, required this.password, required this.repeatPassword});
}

class RegSuccess {
  RegSuccess();
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

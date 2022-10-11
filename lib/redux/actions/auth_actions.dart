import 'package:shop_it/redux/view_model/auth_view_model.dart';

class CheckAuthCredentials {
  final String login;
  final String password;

  CheckAuthCredentials({required this.login, required this.password});
}

class AuthSuccess {
  // TODO add success auth object params here

  AuthSuccess();
}

class AuthErrorAction {
  final String login;
  final String password;
  final String errorMessage;
  final AuthErrorCode errorCode;

  AuthErrorAction({
    required this.login,
    required this.password,
    required this.errorMessage,
    required this.errorCode,
  });
}

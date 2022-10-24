class CheckAuthCredentials {
  final String login;
  final String password;

  CheckAuthCredentials({required this.login, required this.password});
}

class ResetPhoneError {
  ResetPhoneError();
}

class ResetPasswordError {
  ResetPasswordError();
}

class AuthSuccess {
  AuthSuccess();
}

class ErrorAction {
  final String login;
  final String password;
  final String errorMessage;
  final bool? isPhoneValid;
  final bool? isPasswordValid;
  final String? phoneMessage;
  final String? passwordMessage;

  ErrorAction({
    required this.login,
    required this.password,
    required this.errorMessage,
    this.isPhoneValid,
    this.isPasswordValid,
    this.phoneMessage,
    this.passwordMessage,
  });
}

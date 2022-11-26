class CheckRegCredentials {
  final String login;
  final String password;
  final String repeatPassword;

  CheckRegCredentials({required this.login, required this.password, required this.repeatPassword});
}

class RegSuccess {
  RegSuccess();
}

class ResetPhoneError {
  ResetPhoneError();
}

class ResetPasswordError {
  ResetPasswordError();
}

class ErrorAction {
  final String login;
  final String password;
  final String errorMessage;
  final bool? isLoginValid;
  final bool? isPasswordValid;
  final String? loginError;
  final String? passwordError;

  ErrorAction({
    required this.login,
    required this.password,
    required this.errorMessage,
    this.isLoginValid,
    this.isPasswordValid,
    this.loginError,
    this.passwordError,
  });
}

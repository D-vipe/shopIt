import 'package:flutter/material.dart';
import 'package:shop_it/enums/error_codes.dart';

@immutable
class RegViewModel {
  final String login;
  final String password;
  final String? passwordRepeat;
  final bool isProcessing;
  final bool? isLoginValid;
  final bool? isPasswordValid;
  final bool? regSuccess;
  final String? errorMessage;
  final String? loginMessage;
  final String? passwordMessage;
  final ErrorCode? errorCode;

  const RegViewModel({
    required this.login,
    required this.password,
    required this.isProcessing,
    this.isLoginValid,
    this.isPasswordValid,
    this.passwordRepeat,
    this.regSuccess,
    this.errorMessage,
    this.loginMessage,
    this.passwordMessage,
    this.errorCode,
  });

  factory RegViewModel.initial() {
    return const RegViewModel(
      login: '',
      password: '',
      passwordRepeat: '',
      isProcessing: false,
    );
  }

  RegViewModel copyWith({
    required String login,
    required String password,
    String? passwordRepeat,
    required bool isProcessing,
    bool? isLoginValid,
    bool? isPasswordValid,
    bool? authSuccess,
    bool? regSuccess,
    String? errorMessage,
    String? loginMessage,
    String? passwordMessage,
    ErrorCode? errorCode,
  }) {
    return RegViewModel(
      login: login,
      password: password,
      passwordRepeat: passwordRepeat,
      isProcessing: isProcessing,
      isLoginValid: isLoginValid ?? this.isLoginValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      regSuccess: regSuccess ?? this.regSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      loginMessage: loginMessage ?? this.loginMessage,
      passwordMessage: passwordMessage ?? this.passwordMessage,
      errorCode: errorCode ?? this.errorCode,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegViewModel &&
          runtimeType == other.runtimeType &&
          login == other.login &&
          password == other.password &&
          passwordRepeat == other.passwordRepeat &&
          isProcessing == other.isProcessing &&
          isLoginValid == other.isLoginValid &&
          isPasswordValid == other.isPasswordValid &&
          regSuccess == other.regSuccess &&
          errorCode == other.errorCode &&
          loginMessage == other.loginMessage &&
          passwordMessage == other.passwordMessage &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      login.hashCode ^
      password.hashCode ^
      passwordRepeat.hashCode ^
      isProcessing.hashCode ^
      isLoginValid.hashCode ^
      isPasswordValid.hashCode ^
      regSuccess.hashCode ^
      errorCode.hashCode ^
      loginMessage.hashCode ^
      passwordMessage.hashCode ^
      errorMessage.hashCode;
}

import 'package:flutter/material.dart';

@immutable
class AuthViewModel {
  final String login;
  final String password;
  final String? passwordRepeat;
  final bool isProcessing;
  final bool? authSuccess;
  final bool? regSuccess;
  final String? errorMessage;
  final AuthErrorCode? errorCode;

  const AuthViewModel({
    required this.login,
    required this.password,
    required this.isProcessing,
    this.passwordRepeat,
    this.authSuccess,
    this.regSuccess,
    this.errorMessage,
    this.errorCode,
  });

  factory AuthViewModel.initial() {
    return const AuthViewModel(
      login: '',
      password: '',
      isProcessing: false,
    );
  }

  AuthViewModel copyWith({
    required String login,
    required String password,
    String? passwordRepeat,
    required bool isProcessing,
    bool? authSuccess,
    bool? regSuccess,
    String? errorMessage,
    AuthErrorCode? errorCode,
  }) {
    return AuthViewModel(
      login: login,
      password: password,
      isProcessing: isProcessing,
      authSuccess: authSuccess ?? this.authSuccess,
      passwordRepeat: passwordRepeat,
      regSuccess: regSuccess ?? this.regSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      errorCode: errorCode ?? this.errorCode,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewModel &&
          runtimeType == other.runtimeType &&
          login == other.login &&
          password == other.password &&
          passwordRepeat == other.passwordRepeat &&
          isProcessing == other.isProcessing &&
          authSuccess == other.authSuccess &&
          regSuccess == other.regSuccess &&
          errorCode == other.errorCode &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      login.hashCode ^
      password.hashCode ^
      passwordRepeat.hashCode ^
      isProcessing.hashCode ^
      authSuccess.hashCode ^
      regSuccess.hashCode ^
      errorCode.hashCode ^
      errorMessage.hashCode;
}

enum AuthErrorCode { wrongLogin, wrongCredentials, passwordMismatch, other }

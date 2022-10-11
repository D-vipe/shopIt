import 'package:flutter/material.dart';

@immutable
class AuthViewModel {
  final String login;
  final String password;
  final bool isProcessing;
  final bool? authSuccess;
  final String? errorMessage;
  final AuthErrorCode? errorCode;

  const AuthViewModel({
    required this.login,
    required this.password,
    required this.isProcessing,
    this.authSuccess,
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
    required bool isProcessing,
    bool? authSuccess,
    String? errorMessage,
    AuthErrorCode? errorCode,
  }) {
    return AuthViewModel(
      login: login,
      password: password,
      isProcessing: isProcessing,
      authSuccess: authSuccess ?? this.authSuccess,
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
          isProcessing == other.isProcessing &&
          authSuccess == other.authSuccess &&
          errorCode == other.errorCode &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      login.hashCode ^
      password.hashCode ^
      isProcessing.hashCode ^
      authSuccess.hashCode ^
      errorCode.hashCode ^
      errorMessage.hashCode;
}

enum AuthErrorCode { wrongLogin, wrongCredentials, other }

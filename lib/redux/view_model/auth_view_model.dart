import 'package:flutter/material.dart';

@immutable
class AuthViewModel {
  final String login;
  final String password;
  final bool isProcessing;
  final bool? isPhoneValid;
  final bool? isPasswordValid;
  final String? phoneMessage;
  final String? passwordMessage;
  final bool? authSuccess;
  final String? errorMessage;

  const AuthViewModel({
    required this.login,
    required this.password,
    required this.isProcessing,
    this.isPhoneValid,
    this.isPasswordValid,
    this.phoneMessage,
    this.passwordMessage,
    this.authSuccess,
    this.errorMessage,
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
    bool? isPhoneValid,
    bool? isPasswordValid,
    bool? authSuccess,
    bool? regSuccess,
    String? errorMessage,
    String? phoneMessage,
    String? passwordMessage,
  }) {
    return AuthViewModel(
      login: login,
      password: password,
      isProcessing: isProcessing,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      authSuccess: authSuccess ?? this.authSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      phoneMessage: phoneMessage ?? this.phoneMessage,
      passwordMessage: errorMessage ?? this.passwordMessage,
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
          isPhoneValid == other.isPhoneValid &&
          isPasswordValid == other.isPasswordValid &&
          authSuccess == other.authSuccess &&
          phoneMessage == other.phoneMessage &&
          passwordMessage == other.passwordMessage &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      login.hashCode ^
      password.hashCode ^
      isProcessing.hashCode ^
      isPhoneValid.hashCode ^
      isPasswordValid.hashCode ^
      authSuccess.hashCode ^
      passwordMessage.hashCode ^
      phoneMessage.hashCode ^
      errorMessage.hashCode;
}

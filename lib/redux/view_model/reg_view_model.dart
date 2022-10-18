import 'package:flutter/material.dart';
import 'package:shop_it/enums/error_codes.dart';

@immutable
class RegViewModel {
  final String login;
  final String password;
  final String? passwordRepeat;
  final bool isProcessing;
  final bool? regSuccess;
  final String? errorMessage;
  final ErrorCode? errorCode;

  const RegViewModel({
    required this.login,
    required this.password,
    required this.isProcessing,
    this.passwordRepeat,
    this.regSuccess,
    this.errorMessage,
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
    bool? authSuccess,
    bool? regSuccess,
    String? errorMessage,
    ErrorCode? errorCode,
  }) {
    return RegViewModel(
      login: login,
      password: password,
      passwordRepeat: passwordRepeat,
      isProcessing: isProcessing,
      regSuccess: regSuccess ?? this.regSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
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
          regSuccess == other.regSuccess &&
          errorCode == other.errorCode &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      login.hashCode ^
      password.hashCode ^
      passwordRepeat.hashCode ^
      isProcessing.hashCode ^
      regSuccess.hashCode ^
      errorCode.hashCode ^
      errorMessage.hashCode;
}

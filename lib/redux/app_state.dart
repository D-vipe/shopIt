// Flutter imports:
import 'package:flutter/material.dart';
import 'package:shop_it/redux/view_model/auth_view_model.dart';

@immutable
class AppState {
  final AuthViewModel authScreenState;
  const AppState({required this.authScreenState});

  factory AppState.initialState() => AppState(
        authScreenState: AuthViewModel.initial(),
      );

  AppState copyWith({
    AuthViewModel? authScreenState,
  }) =>
      AppState(
        authScreenState: authScreenState ?? this.authScreenState,
      );
}

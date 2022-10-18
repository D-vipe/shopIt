// Flutter imports:
import 'package:flutter/material.dart';
import 'package:shop_it/redux/view_model/auth_view_model.dart';
import 'package:shop_it/redux/view_model/reg_view_model.dart';

@immutable
class AppState {
  final AuthViewModel authFormState;
  final RegViewModel regFormState;
  const AppState({required this.authFormState, required this.regFormState});

  factory AppState.initialState() => AppState(
        authFormState: AuthViewModel.initial(),
        regFormState: RegViewModel.initial(),
      );

  AppState copyWith({
    AuthViewModel? authFormState,
    RegViewModel? regFormState,
  }) =>
      AppState(
        authFormState: authFormState ?? this.authFormState,
        regFormState: regFormState ?? this.regFormState,
      );
}

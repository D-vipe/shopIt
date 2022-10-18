import 'package:redux/redux.dart';
import 'package:shop_it/redux/actions/auth_actions.dart';
import 'package:shop_it/redux/view_model/auth_view_model.dart';

final authReducer = combineReducers<AuthViewModel>([
  TypedReducer<AuthViewModel, CheckAuthCredentials>(_processAuth),
  TypedReducer<AuthViewModel, AuthSuccess>(_success),
  TypedReducer<AuthViewModel, ErrorAction>(_errorHandler),
]);

AuthViewModel _processAuth(AuthViewModel state, CheckAuthCredentials action) {
  return state.copyWith(
    login: action.login,
    password: action.password,
    isProcessing: true,
    authSuccess: false,
  );
}

AuthViewModel _success(AuthViewModel state, AuthSuccess action) {
  return state.copyWith(
    login: state.login,
    password: state.password,
    authSuccess: true,
    isProcessing: false,
  );
}

AuthViewModel _errorHandler(AuthViewModel state, ErrorAction action) {
  return state.copyWith(
      login: action.login,
      password: action.password,
      isProcessing: false,
      authSuccess: false,
      errorCode: action.errorCode,
      errorMessage: action.errorMessage);
}

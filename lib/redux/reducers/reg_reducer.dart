import 'package:redux/redux.dart';
import 'package:shop_it/redux/actions/reg_actions.dart';
import 'package:shop_it/redux/view_model/reg_view_model.dart';

final regReducer = combineReducers<RegViewModel>([
  TypedReducer<RegViewModel, CheckRegCredentials>(_processReg),
  TypedReducer<RegViewModel, RegSuccess>(_success),
  TypedReducer<RegViewModel, ErrorAction>(_errorHandler),
  TypedReducer<RegViewModel, ResetPhoneError>(_resetPhone),
  TypedReducer<RegViewModel, ResetPasswordError>(_resetPass),
]);

RegViewModel _processReg(RegViewModel state, CheckRegCredentials action) {
  return state.copyWith(
    login: action.login,
    password: action.password,
    passwordRepeat: action.repeatPassword,
    isProcessing: true,
    regSuccess: false,
    isPasswordValid: true,
    isLoginValid: true,
    loginMessage: '',
    passwordMessage: '',
  );
}

RegViewModel _success(RegViewModel state, RegSuccess action) {
  return state.copyWith(
    login: state.login,
    password: state.password,
    regSuccess: true,
    isProcessing: false,
  );
}

RegViewModel _resetPhone(RegViewModel state, ResetPhoneError action) {
  return state.copyWith(
      login: state.login,
      password: state.password,
      regSuccess: state.regSuccess,
      isProcessing: false,
      isLoginValid: true,
      loginMessage: '');
}

RegViewModel _resetPass(RegViewModel state, ResetPasswordError action) {
  return state.copyWith(
      login: state.login,
      password: state.password,
      regSuccess: state.regSuccess,
      isProcessing: false,
      isPasswordValid: true,
      passwordMessage: '');
}

RegViewModel _errorHandler(RegViewModel state, ErrorAction action) {
  return state.copyWith(
      login: action.login,
      password: action.password,
      isProcessing: false,
      regSuccess: false,
      isLoginValid: action.isLoginValid,
      isPasswordValid: action.isPasswordValid,
      loginMessage: action.loginError,
      passwordMessage: action.passwordError,
      errorMessage: action.errorMessage);
}

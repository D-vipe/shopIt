import 'package:redux/redux.dart';
import 'package:shop_it/redux/actions/reg_actions.dart';
import 'package:shop_it/redux/view_model/reg_view_model.dart';

final regReducer = combineReducers<RegViewModel>([
  TypedReducer<RegViewModel, CheckRegCredentials>(_processReg),
  TypedReducer<RegViewModel, RegSuccess>(_success),
  TypedReducer<RegViewModel, ErrorAction>(_errorHandler),
]);

RegViewModel _processReg(RegViewModel state, CheckRegCredentials action) {
  return state.copyWith(
    login: action.login,
    password: action.password,
    passwordRepeat: action.repeatPassword,
    isProcessing: true,
    regSuccess: false,
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

RegViewModel _errorHandler(RegViewModel state, ErrorAction action) {
  return state.copyWith(
      login: action.login,
      password: action.password,
      isProcessing: false,
      regSuccess: false,
      errorCode: action.errorCode,
      errorMessage: action.errorMessage);
}

import 'package:redux/redux.dart';
import 'package:shop_it/api/auth/auth_api.dart';
import 'package:shop_it/api/auth/models/login_model.dart';
import 'package:shop_it/api/user/models/user_model.dart';
import 'package:shop_it/app/config/exceptions.dart';
import 'package:shop_it/app/constants/app_dictionary.dart';
import 'package:shop_it/app/constants/errors_const.dart';
import 'package:shop_it/enums/error_codes.dart';
import 'package:shop_it/redux/actions/reg_actions.dart';
import 'package:shop_it/redux/app_state.dart';
import 'package:shop_it/services/shared_preferences.dart';

final AuthApi _authApi = AuthApi();

List<Middleware<AppState>> createRegMiddleware() {
  return [
    TypedMiddleware<AppState, CheckRegCredentials>(_checkReg()),
  ];
}

Middleware<AppState> _checkReg() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    final Login login = Login(phone: action.login, password: action.password, repeatPassword: action.repeatPassword);

    final bool isLoginValid = (login.phone != '' && login.phone.length == 11);
    final bool isPasswordValid = login.password != '' && login.repeatPassword != '' && login.password == login.repeatPassword;

    if (isLoginValid && isPasswordValid) {
      Future(() async {
        try {
          User? authData;
          // Uncomment API-call when end-point is ready
          // authData = await _authApi.authorize(login: login);

          // Decode user jwt here to get user data

          // if (authData != null) {
          //   await SharedStorageService.setString(PreferenceKey.userId, authData.id);
          //   // save user to hive box
          //   // await HiveService.addUser(data: authData);
          //
          //   store.dispatch(RegSuccess());
          // } else {
          //   store.dispatch(ErrorAction(
          //       login: login.phone,
          //       password: login.password,
          //       errorCode: ErrorCode.wrongCredentials,
          //       errorMessage: GeneralErrors.wrongCredentials));
          // }
        } on ConnectionException {
          store.dispatch(ErrorAction(login: login.phone, password: login.password, errorMessage: GeneralErrors.serverError));
        } on ParseException {
          store.dispatch(ErrorAction(login: login.phone, password: login.password, errorMessage: GeneralErrors.parseError));
        } catch (e) {
          store.dispatch(ErrorAction(login: login.phone, password: login.password, errorMessage: GeneralErrors.generalError));
        }
      });
    } else {
      String loginErrorText = '';
      String passwordErrorText = '';
      if (isLoginValid == false && isPasswordValid) {
        loginErrorText = login.phone == ''
            ? AppDictionary.fillInput
            : login.phone.length != 11
                ? AppDictionary.phoneFormatInvalid
                : AppDictionary.fillInput;
        passwordErrorText = '';
      } else if (isLoginValid && isPasswordValid == false) {
        loginErrorText = '';
        passwordErrorText = AppDictionary.fillInput;
      } else if (login.password != login.repeatPassword) {
        loginErrorText = '';
        passwordErrorText = AppDictionary.passwordMismatch;
      } else {
        loginErrorText = AppDictionary.fillInput;
        passwordErrorText = AppDictionary.fillInput;
      }

      store.dispatch(ErrorAction(
          login: login.phone,
          password: login.password,
          errorMessage: '',
          isLoginValid: isLoginValid,
          isPasswordValid: isPasswordValid,
          loginError: loginErrorText,
          passwordError: passwordErrorText));
    }
  };
}

import 'package:redux/redux.dart';
import 'package:shop_it/api/auth/auth_api.dart';
import 'package:shop_it/api/auth/models/login_model.dart';
import 'package:shop_it/api/user/models/user_model.dart';
import 'package:shop_it/app/config/exceptions.dart';
import 'package:shop_it/app/constants/app_dictionary.dart';
import 'package:shop_it/app/constants/errors_const.dart';
import 'package:shop_it/enums/error_codes.dart';
import 'package:shop_it/redux/actions/auth_actions.dart';
import 'package:shop_it/redux/app_state.dart';
import 'package:shop_it/services/shared_preferences.dart';

final AuthApi _authApi = AuthApi();

List<Middleware<AppState>> createAuthMiddleware() {
  return [
    TypedMiddleware<AppState, CheckAuthCredentials>(_checkAuth()),
  ];
}

Middleware<AppState> _checkAuth() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    final Login login = Login(phone: action.login, password: action.password);

    // first check email field
    final bool isLoginValid = login.phone != '' && login.phone.length == 11;
    final bool isPasswordValid = login.password != '';

    if (isLoginValid && isPasswordValid) {
      Future(() async {
        try {
          Map<String, dynamic> authData;
          // Uncomment API-call when end-point is ready
          authData = await _authApi.authorize(login: login);

          // Decode user jwt here to get user data

          if (authData['user'] != null) {
            await SharedStorageService.setString(PreferenceKey.userJwt, authData['token']);
            // save user to hive box
            // await HiveService.addUser(data: authData);

            store.dispatch(AuthSuccess());
          } else {
            store.dispatch(ErrorAction(login: login.phone, password: login.password, errorMessage: GeneralErrors.wrongCredentials));
          }
        } on NotFoundException {
          store.dispatch(ErrorAction(
            login: login.phone,
            password: login.password,
            errorMessage: GeneralErrors.wrongCredentials,
          ));
        } on ConnectionException {
          store.dispatch(ErrorAction(
            login: login.phone,
            password: login.password,
            errorMessage: GeneralErrors.serverError,
          ));
        } on ParseException {
          store.dispatch(ErrorAction(
            login: login.phone,
            password: login.password,
            errorMessage: GeneralErrors.parseError,
          ));
        } catch (e) {
          store.dispatch(ErrorAction(
            login: login.phone,
            password: login.password,
            errorMessage: GeneralErrors.generalError,
          ));
        }
      });
    } else {
      String loginErrorText = '';
      String passwordErrorText = '';
      // make different conditions not to call set state multiple times
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
      } else {
        loginErrorText = login.phone == ''
            ? AppDictionary.fillInput
            : login.phone.length != 11
                ? AppDictionary.phoneFormatInvalid
                : AppDictionary.fillInput;
        passwordErrorText = AppDictionary.fillInput;
      }

      store.dispatch(ErrorAction(
          login: login.phone,
          password: login.password,
          errorMessage: '',
          isPhoneValid: isLoginValid,
          isPasswordValid: isPasswordValid,
          phoneMessage: loginErrorText,
          passwordMessage: passwordErrorText));
    }
  };
}

// Project imports:
import 'package:shop_it/redux/app_state.dart';
import 'package:shop_it/redux/reducers/auth_reducer.dart';
import 'package:shop_it/redux/reducers/reg_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    authFormState: authReducer(state.authFormState, action),
    regFormState: regReducer(state.regFormState, action),
  );
}

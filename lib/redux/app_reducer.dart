// Project imports:
import 'package:shop_it/redux/app_state.dart';
import 'package:shop_it/redux/reducers/auth_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    authScreenState: authReducer(state.authScreenState, action),
  );
}

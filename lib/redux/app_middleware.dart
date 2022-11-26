// Package imports:
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shop_it/redux/app_state.dart';
import 'package:shop_it/redux/middleware/auth_middleware.dart';
import 'package:shop_it/redux/middleware/reg_middleware.dart';

// Project imports:

List<Middleware<AppState>> createAppMiddleWare() {
  List<Middleware<AppState>> appMiddleware = [];
  appMiddleware.addAll(createAuthMiddleware());
  appMiddleware.addAll(createRegMiddleware());
  appMiddleware.add(LoggingMiddleware.printer());
  return appMiddleware;
}

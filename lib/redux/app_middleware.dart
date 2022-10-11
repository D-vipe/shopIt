// Package imports:
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shop_it/redux/app_state.dart';

// Project imports:

List<Middleware<AppState>> createAppMiddleWare() {
  List<Middleware<AppState>> appMiddleware = [];
  appMiddleware.add(LoggingMiddleware.printer());
  return appMiddleware;
}

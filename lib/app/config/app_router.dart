import 'package:auto_route/auto_route.dart';
import 'package:shop_it/app/config/route_guards/auth_guard.dart';
import 'package:shop_it/app/constants/routes_const.dart';
import 'package:shop_it/ui/pages/auth/auth_screen.dart';
import 'package:shop_it/ui/pages/home/home_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(path: Routes.auth, page: AuthScreen),
  AutoRoute(path: Routes.home, guards: [CheckUserAuth], page: HomeScreen),
])
class $AppAutoRouter {}

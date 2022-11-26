// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../ui/pages/auth/auth_screen.dart' as _i1;
import '../../ui/pages/home/home_screen.dart' as _i2;
import 'route_guards/auth_guard.dart' as _i5;

class AppAutoRouter extends _i3.RootStackRouter {
  AppAutoRouter(
      {_i4.GlobalKey<_i4.NavigatorState>? navigatorKey,
      required this.checkUserAuth})
      : super(navigatorKey);

  final _i5.CheckUserAuth checkUserAuth;

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthScreen());
    },
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(AuthRoute.name, path: 'auth'),
        _i3.RouteConfig(HomeRoute.name, path: '/', guards: [checkUserAuth])
      ];
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i3.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: 'auth');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

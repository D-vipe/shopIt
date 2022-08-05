// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_it/app/constants/routes_const.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
      default:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              // BlocProvider(
              //   create: (BuildContext context) => InitialCubit(),
              // ),
              // BlocProvider(
              //   create: (BuildContext context) => UsersListCubit(),
              // ),
              // BlocProvider(
              //   create: (BuildContext context) => PostsCubit(),
              // ),
              // BlocProvider(
              //   create: (BuildContext context) => AlbumsCubit(),
              // ),
              // BlocProvider(
              //   create: (BuildContext context) => ProfileCubit(),
              // ),
            ],
            child: Container(),
          ),
        );
    }
  }
}

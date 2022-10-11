import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:shop_it/app/config/app_router.gr.dart';
import 'package:shop_it/app/config/route_guards/auth_guard.dart';
import 'package:shop_it/redux/app_middleware.dart';
import 'package:shop_it/redux/app_reducer.dart';
import 'package:shop_it/redux/app_state.dart';
import 'package:shop_it/services/hive_service.dart';
import 'package:shop_it/services/shared_preferences.dart';
import 'package:shop_it/services/theme_service.dart';

import 'app/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedStorageService.init();
  await HiveService.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: createAppMiddleWare(),
  );

  final _appRouter = AppAutoRouter(checkUserAuth: CheckUserAuth());

  bool _light = true;

  @override
  void initState() {
    super.initState();
    _light = ThemeService.getCurrentTheme();
  }

  void changeTheme(bool lightTheme) {
    setState(() {
      _light = lightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'CraftHub',
        locale: const Locale('ru'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
        ],
        theme: _light ? AppTheme.lightTheme() : AppTheme.darkTheme(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
      ),
    );
  }
}

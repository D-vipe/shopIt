import 'package:auto_route/auto_route.dart';
import 'package:shop_it/app/config/app_router.gr.dart';
import 'package:shop_it/services/shared_preferences.dart';

class CheckUserAuth extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final String userJwt = SharedStorageService.getString(PreferenceKey.userJwt);

    if (userJwt != '') {
      resolver.next(true);
    } else {
      router.push(const AuthRoute());
    }
  }
}

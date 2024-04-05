import 'package:auto_route/auto_route.dart';
import 'package:test_task/screens/auth/code/auth_code_screen.dart';
import 'package:test_task/screens/auth/phone/auth_phone_screen.dart';
import 'package:test_task/screens/splash/splash_screen.dart';

// final routes = {
//   '/splash': (context) => const Scaffold(),
//   '/authPhone': (context) => const Scaffold(),
//   '/authCode': (context) => const Scaffold(),
// };

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: AuthPhoneRoute.page, path: '/authPhone'),
        AutoRoute(page: AuthCodeRoute.page, path: '/authCode'),
      ];
}

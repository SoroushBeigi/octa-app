import 'package:go_router/go_router.dart';
import 'package:octa/view/home/home_screen.dart';
import 'package:octa/view/login/login_screen.dart';
import 'package:octa/view/splash/splash_screen.dart';

class Routes{
  final routes = GoRouter(routes: [  GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
        GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
       GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      ]);
}
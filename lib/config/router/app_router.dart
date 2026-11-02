import 'package:go_router/go_router.dart';
import 'package:weather/core/components/app_provider.dart';
import 'package:weather/features/bookmark/presentation/screen/book_mark_screen.dart';
import 'package:weather/features/splash/presentation/screen/splash_screen.dart';
import 'package:weather/features/weather/presentation/screens/curent_weather_screen.dart';

import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: true,

  routes: [
    GoRoute(
      path: AppRoutes.splash,
      // name: RouteNames.home,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.appProvider,
      // name: RouteNames.login,
      builder: (context, state) => const AppProvider(),
    ),

  ],
);

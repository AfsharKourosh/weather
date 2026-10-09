/*
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: RouteNames.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
        GoRoute(
      path: AppRoutes.login,
      name: RouteNames.login,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
  ],
    errorBuilder: (context, state) {
    return const NotFoundPage();
  },
);
---------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}
-------------------------------------------------------
app_routes.dart
    → path constants

route_names.dart
    → route name constants

app_router.dart
    → GoRouter configuration

MaterialApp.router
    → مصرف‌کننده GoRouter
    ---------------------------------
    when routes in features


    
    final GoRouter appRouter = GoRouter(
  routes: [
    ...authRoutes,
    ...homeRoutes,
    ...profileRoutes,
  ],
);
*/
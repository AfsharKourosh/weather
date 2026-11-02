import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/di/injection.dart';
import 'package:weather/config/router/app_router.dart';
import 'package:weather/config/theme/app_theme.dart';
import 'package:weather/core/components/app_toast.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/bookmark_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/screens/counter_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(create: (_) => sl<WeatherBloc>()),
          BlocProvider<BookmarkBloc>(create: (_) => sl<BookmarkBloc>()),
        ],
        child: MaterialApp.router(
          theme: AppTheme.light,
          scaffoldMessengerKey: AppToast.messengerKey,
          debugShowCheckedModeBanner: kDebugMode,
          routerConfig: appRouter,
        ),
      );
    }

    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: kDebugMode,
        scrollBehavior: CupertinoScrollBehavior(),
        home: CounterScreen(),
      );
    }
    return const SizedBox.shrink();
  }
}


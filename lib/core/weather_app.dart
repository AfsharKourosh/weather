import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/cubit/counter_cubit.dart';
import 'package:weather/features/weather/presentation/screens/counter_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: kDebugMode,
      scrollBehavior: CupertinoScrollBehavior(),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: CounterScreen(),
      ),
    );

    // if (Platform.isAndroid) {
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: kDebugMode,
    //     home: const CurentWeather(),
    //   );
    // }

    // if (Platform.isIOS) {
    //   return CupertinoApp(
    //     debugShowCheckedModeBanner: kDebugMode,
    //     scrollBehavior: CupertinoScrollBehavior(),
    //     home: CounterScreen(),
    //   );
    // }
    // return const SizedBox.shrink();
  }
}

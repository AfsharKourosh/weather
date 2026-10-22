import 'package:flutter/material.dart';
import 'package:weather/core/components/custom_app_bar.dart';


class CurentWeatherScreen extends StatelessWidget {
  const CurentWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(),
        
        child: Center(child: Text('home'))),

      // BlocBuilder<WeatherBloc, WeatherState>(
      //   builder: (context, state) {
      //     if (state.curentWeatherStatus is CurentWeatherLoading) {
      //       return Center(child: Text('loading'));
      //     }

      //     if (state.curentWeatherStatus is CurentWeatherCompleted) {
      //       return Center(child: Text('completed'));
      //     }
      //     if (state.curentWeatherStatus is Error) {
      //       return Center(child: Text('error'));
      //     }

      //     return const SizedBox.shrink();
      //   },
      // ),
      // appBar: AppBar(),
    );
  }
}

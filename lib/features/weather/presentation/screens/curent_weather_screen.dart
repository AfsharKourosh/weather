import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/di/injection.dart';
import 'package:weather/core/components/custom_loading.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';
import 'package:weather/features/weather/domain/entitys/weather_res_entity.dart';
import 'package:weather/features/weather/domain/use-cases/search_box_usecase.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_status.dart';
import 'package:weather/features/weather/presentation/widgets/info_weather.dart';
import 'package:weather/features/weather/presentation/widgets/max_min_temp.dart';
import 'package:weather/features/weather/presentation/widgets/search_box.dart';
import 'package:weather/features/weather/presentation/widgets/weather_cities.dart';

class CurentWeatherScreen extends StatefulWidget {
  const CurentWeatherScreen({super.key});

  @override
  State<CurentWeatherScreen> createState() => _CurentWeatherScreenState();
}

class _CurentWeatherScreenState extends State<CurentWeatherScreen> {
  late TextEditingController _textEditingController;

  late SearchBoxUsecase _searchBoxUsecase;

  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    _textEditingController = TextEditingController();
    _searchBoxUsecase = sl<SearchBoxUsecase>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<WeatherBloc>().add(
        GetCurentWeather(
          WeatherReqModel(cityName: 'Tehran', measure: 'metric'),
        ),
      );
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: SearchBox(
                    focusNode: _searchFocusNode,
                    textEditingController: _textEditingController,
                    searchBoxUsecase: _searchBoxUsecase,
                  ),
                ),
              ],
            ),
          ),

          BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state.curentWeatherStatus is CurentWeatherCompleted) {
                FocusScope.of(context).unfocus();
              }
            },
            builder: (context, state) {
              if (state.curentWeatherStatus is CurentWeatherLoading) {
                return Expanded(child: CustomLoading());
              }

              if (state.curentWeatherStatus is CurentWeatherCompleted) {
                final CurentWeatherCompleted curentWeatherCompleted =
                    state.curentWeatherStatus as CurentWeatherCompleted;

                final WeatherResEntity weatherResEntity =
                    curentWeatherCompleted.weatherResEntity;

                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WeatherCities(weatherResEntity: weatherResEntity),
                      MaxMinTemp(weatherResEntity: weatherResEntity),
                      InfoWeather(weatherResEntity: weatherResEntity),
                    ],
                  ),
                );
              }
              if (state.curentWeatherStatus is Error) {
                return Center(
                  child: Text(
                    'error',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

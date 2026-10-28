import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/config/di/injection.dart';
import 'package:weather/core/components/custom_loading.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/bookmark_bloc.dart';
import 'package:weather/features/weather/date/model/weather_req_model.dart';
import 'package:weather/features/weather/domain/entity/weather_res_entity.dart';
import 'package:weather/features/weather/domain/use-case/search_box_usecase.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_status.dart';
import 'package:weather/features/weather/presentation/widgets/bookmark_icon.dart';
import 'package:weather/features/weather/presentation/widgets/info/info_weather.dart';
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
                BlocBuilder<WeatherBloc, WeatherState>(
                  buildWhen: (previous, current) {
                    if (previous.weatherStatus == current.weatherStatus) {
                      return false;
                    }
                    return true;
                  },
                  builder: (context, state) {
                    if (state.weatherStatus is WeatherLoading) {
                      return const CircularProgressIndicator();
                    }

                    if (state.weatherStatus
                        case WeatherCompleted weatherCompleted) {
                      context.read<BookmarkBloc>().add(
                        GetBookmarkByNameEvent(
                          weatherCompleted.weatherResEntity.name!,
                        ),
                      );

                      return BookMarkIcon(
                        name: weatherCompleted.weatherResEntity.name!,
                      );
                    }

                    if (state.weatherStatus is WeatherError) {
                      return IconButton(
                        onPressed: () {
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: Text("please load a city!"),
                          //   behavior: SnackBarBehavior.floating, // Add this line
                          // ));
                        },
                        icon: const Icon(
                          Icons.error,
                          color: Colors.white,
                          size: 35,
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ],
            ),
          ),

          BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state.weatherStatus is WeatherCompleted) {
                FocusScope.of(context).unfocus();
              }
            },
            builder: (context, state) {
              if (state.weatherStatus is WeatherLoading) {
                return Expanded(child: CustomLoading());
              }

              if (state.weatherStatus case WeatherCompleted(
                :final weatherResEntity,
              )) {
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
              if (state.weatherStatus is Error) {
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather/features/weather/date/models/search_box_res_model.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';
import 'package:weather/features/weather/domain/use-cases/search_box_usecase.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this._textEditingController,
    required this._searchBoxUsecase,
  });

  final TextEditingController _textEditingController;
  final SearchBoxUsecase _searchBoxUsecase;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return TypeAheadField<Datum>(
      controller: _textEditingController,

      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          onSubmitted: (String prefix) {
            _textEditingController.text = prefix;
            context.read<WeatherBloc>().add(
              GetCurentWeather(
                WeatherReqModel(cityName: prefix, measure: 'metric'),
              ),
            );
          },
          style: DefaultTextStyle.of(context).style
              .copyWith(fontSize: height * 0.02, color: Colors.white),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(
              20,
              height * 0.02,
              0,
              height * 0.02,
            ),
            hintText: 'Enter a City...',
            hintStyle: const TextStyle(color: Colors.white),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        );
      },
      itemBuilder: (context, Datum model) {
        return ListTile(
          leading: const Icon(Icons.location_on),
          title: Text(model.name),
          subtitle: Text("${model.region}, ${model.country}"),
        );
      },

      onSelected: (Datum model) {
        _textEditingController.text = model.name;

        context.read<WeatherBloc>().add(
          GetCurentWeather(
            WeatherReqModel(cityName: model.name, measure: 'metric'),
          ),
        );
      },

      suggestionsCallback: (search) async {
        final result = await _searchBoxUsecase(search);

        return result.fold(
          (failure) => <Datum>[],
          (entity) => entity.data ?? <Datum>[],
        );
      },
    );
  }
}

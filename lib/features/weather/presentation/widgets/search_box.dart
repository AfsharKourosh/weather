import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather/features/weather/date/model/search_box_res_model.dart';
import 'package:weather/features/weather/date/model/weather_req_model.dart';
import 'package:weather/features/weather/domain/use-case/search_box_usecase.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this._textEditingController,
    required this._searchBoxUsecase,
    required this._focusNode,
  });

  final TextEditingController _textEditingController;
  final SearchBoxUsecase _searchBoxUsecase;
  final FocusNode _focusNode;

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
          title: Text(
            model.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text("${model.region}, ${model.country}"),
        );
      },

      onSelected: (Datum model) {
        _textEditingController.text = model.name;
        _focusNode.unfocus();

        context.read<WeatherBloc>().add(
          GetCurentWeather(
            WeatherReqModel(cityName: model.name, measure: 'metric'),
          ),
        );
      },

      suggestionsCallback: (search) async {
        final prefix = search.trim();

        if (prefix.length < 2) {
          return <Datum>[];
        }

        debugPrint('Searching cities: "$prefix"');

        final result = await _searchBoxUsecase(prefix);

        return result.fold(
          (failure) {
            debugPrint('Search failed: $failure');
            return <Datum>[];
          },
          (data) {
            debugPrint('Cities found: ${data.length}');
            return data;
          },
        );
      },
    );
  }
}

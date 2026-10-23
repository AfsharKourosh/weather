import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/core/use-case/use_case.dart';
import 'package:weather/features/weather/date/models/search_box_res_model.dart';
import 'package:weather/features/weather/domain/repositorys/weather_repository.dart';

class SearchBoxUsecase implements UseCase<List<Datum>, String> {
  final WeatherRepository weatherRepository;

  SearchBoxUsecase(this.weatherRepository);

  @override
  Future<Either<Failure, List<Datum>>> call(String prefix) {
    return weatherRepository.searchBox(prefix);
  }
}

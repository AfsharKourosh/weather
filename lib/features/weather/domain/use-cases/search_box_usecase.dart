import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/core/use-case/use_case.dart';
import 'package:weather/features/weather/domain/entitys/search_box_res_entity.dart';
import 'package:weather/features/weather/domain/repositorys/weather_repository.dart';

class SearchBoxUsecase implements UseCase<SearchBoxResEntity, String> {
  final WeatherRepository weatherRepository;

  SearchBoxUsecase(this.weatherRepository);

  @override
  Future<Either<Failure, SearchBoxResEntity>> call(String prefix) {
    return weatherRepository.searchBox(prefix);
  }
}

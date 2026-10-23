import 'package:dartz/dartz.dart';
import 'package:weather/core/error/exceptions/app_exception.dart';
import 'package:weather/core/error/exceptions/network_exception.dart';
import 'package:weather/core/error/exceptions/server_exception.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/features/weather/date/data-sources/remote/weather_data_source.dart';
import 'package:weather/features/weather/date/models/search_box_res_model.dart';
import 'package:weather/features/weather/date/models/weather_req_model.dart';
import 'package:weather/features/weather/domain/entitys/weather_res_entity.dart';
import 'package:weather/features/weather/domain/repositorys/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource weatherDataSource;

  WeatherRepositoryImpl(this.weatherDataSource);

  @override
  Future<Either<Failure, WeatherResEntity>> curentWeather(
    WeatherReqModel weatherReqModel,
  ) async {
    try {
      final model = await weatherDataSource.curentWeather(weatherReqModel);
      return Right(model.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Datum>>> searchBox(String prefix) async {
    try {
      final model = await weatherDataSource.searchBox(prefix);

      return Right(model);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}

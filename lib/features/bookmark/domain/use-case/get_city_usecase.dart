


class GetCityUseCase implements UseCase<DataState<City?>, String>{
  final CityRepository _cityRepository;
  GetCityUseCase(this._cityRepository);

  @override
  Future<DataState<City?>> call(String params) {
      return _cityRepository.findCityByName(params);
  }
}
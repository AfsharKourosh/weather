


class SaveBookmarkUseCase implements UseCase<DataState<City>, String>{
  final CityRepository _cityRepository;
  SaveBookmarkUseCase(this._cityRepository);

  @override
  Future<DataState<City>> call(String params) {
    return _cityRepository.saveCityToDB(params);
  }
}
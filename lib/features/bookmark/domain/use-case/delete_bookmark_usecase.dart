class DeleteCityUseCase implements UseCase<DataState<String>, String>{
  final CityRepository _cityRepository;
  DeleteCityUseCase(this._cityRepository);

  @override
  Future<DataState<String>> call(String params) {
    return _cityRepository.deleteCityByName(params);
  }
}
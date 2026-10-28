import 'package:get_it/get_it.dart';
import 'package:weather/config/di/network_module.dart';
import 'package:weather/config/di/storage_module.dart';
import 'package:weather/config/environment/environment_config.dart';
import 'package:weather/config/environment/environment_loader.dart';
import 'package:weather/core/network/client/api_client.dart';
import 'package:weather/features/bookmark/data/data-source/local/bookmark_dao.dart';
import 'package:weather/features/bookmark/data/repository/bookmark_repository_impl.dart';
import 'package:weather/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:weather/features/bookmark/domain/use-case/delete_bookmark_usecase.dart';
import 'package:weather/features/bookmark/domain/use-case/get_all_bookmark_usecase.dart';
import 'package:weather/features/bookmark/domain/use-case/get_bookmark_usecase.dart';
import 'package:weather/features/bookmark/domain/use-case/save_bookmark_usecase.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/bookmark_bloc.dart';
import 'package:weather/features/weather/date/data-source/remote/weather_data_source.dart';
import 'package:weather/features/weather/date/repository/weather_repository_impl.dart';
import 'package:weather/features/weather/domain/repository/weather_repository.dart';
import 'package:weather/features/weather/domain/use-case/search_box_usecase.dart';
import 'package:weather/features/weather/domain/use-case/weather_usecase.dart';
import 'package:weather/features/weather/presentation/bloc-cubit/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Environment
  sl.registerSingleton<EnvironmentConfig>(EnvironmentLoader.load());

  // Storage
  await setupDatabaseDependencies(sl);

  // Network

  setupNetworkDependencies(sl);

  //   sl.registerLazySingleton<GoRouter>(
  //   () => createAppRouter(
  //     // dependencies
  //   ),
  // );

  // setupAuthDependencies(sl);
  // .
  // .
  // .
  // featurs
  setupWeatherDependencies(sl);
}

void setupWeatherDependencies(GetIt sl) {
  // Data Source
  sl.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceImpl(
      sl<ApiClient>(instanceName: 'weather'),
      sl<ApiClient>(instanceName: 'searchBox'),
    ),
  );

  // Repository
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(sl<WeatherDataSource>()),
  );

  sl.registerLazySingleton<BookmarkRepository>(
    () => BookmarkRepositoryImpl(sl<BookmarkDao>()),
  );

  // Use Case
  sl.registerLazySingleton<WeatherUseCase>(
    () => WeatherUseCase(sl<WeatherRepository>()),
  );

  sl.registerLazySingleton<SearchBoxUsecase>(
    () => SearchBoxUsecase(sl<WeatherRepository>()),
  );

  sl.registerLazySingleton<SaveBookmarkUseCase>(
    () => SaveBookmarkUseCase(sl<BookmarkRepository>()),
  );

  sl.registerLazySingleton<GetBookmarkUseCase>(
    () => GetBookmarkUseCase(sl<BookmarkRepository>()),
  );

  sl.registerLazySingleton<GetAllBookmarkUseCase>(
    () => GetAllBookmarkUseCase(sl<BookmarkRepository>()),
  );

  sl.registerLazySingleton<DeleteBookmarkUseCase>(
    () => DeleteBookmarkUseCase(sl<BookmarkRepository>()),
  );

  // bloc/cubit

  sl.registerLazySingleton<WeatherBloc>(
    () => WeatherBloc(sl<WeatherUseCase>()),
  );

  sl.registerLazySingleton<BookmarkBloc>(
    () => BookmarkBloc(
      deleteBookmarkUseCase: sl<DeleteBookmarkUseCase>(),
      getAllBookmarkUseCase: sl<GetAllBookmarkUseCase>(),
      getBookmarkUseCase: sl<GetBookmarkUseCase>(),
      saveBookmarkUseCase: sl<SaveBookmarkUseCase>(),
    ),
  );
}

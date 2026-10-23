import 'package:get_it/get_it.dart';
import 'package:weather/features/bookmark/data/data-source/local/bookmark_dao.dart';
import 'package:weather/features/bookmark/data/data-source/local/bookmark_database.dart';

Future<void> setupDatabaseDependencies(GetIt sl) async {
  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .build();

  sl.registerSingleton<AppDatabase>(database);

  sl.registerLazySingleton<BookmarkDao>(() => sl<AppDatabase>().bookmarkDao);
}

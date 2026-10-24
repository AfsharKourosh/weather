import 'package:dartz/dartz.dart';
import 'package:weather/core/error/exceptions/execute_with_failure.dart';
import 'package:weather/core/error/exceptions/server_exception.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/core/logging/app_logger.dart';
import 'package:weather/features/bookmark/data/data-source/local/bookmark_dao.dart';
import 'package:weather/features/bookmark/domain/entity/bookmark_entity.dart';
import 'package:weather/features/bookmark/domain/repository/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  BookmarkDao bookmarkDao;
  BookmarkRepositoryImpl(this.bookmarkDao);

  @override
  Future<Either<Failure, BookmarkEntity?>> saveBookmarkEntityToDB(
    String cityName,
  ) {
    return executeWithFailure(() async {
      AppLogger.debug('Saving bookmark: $cityName');
      final existingCity = await bookmarkDao.findBookmarkEntityByName(cityName);
      if (existingCity != null) {
        AppLogger.warning('Bookmark already exists: $cityName');

        throw ServerException('$cityName already exists');
      }

      final city = BookmarkEntity(name: cityName);
      await bookmarkDao.insertBookmarkEntity(city);
      AppLogger.info('Bookmark saved successfully: $cityName');

      return city;
    });
  }

  /// call get All city from DB and set status
  @override
  Future<Either<Failure, List<BookmarkEntity>>>
  getAllBookmarkEntityFromDB() async {
    return executeWithFailure(() => bookmarkDao.getAllBookmarkEntity());
  }

  /// call  get city by name from DB and set status
  @override
  Future<Either<Failure, BookmarkEntity?>> findBookmarkEntityByName(
    String name,
  ) async {
    return executeWithFailure(() => bookmarkDao.findBookmarkEntityByName(name));
  }

  @override
  Future<Either<Failure, void>> deleteBookmarkEntityByName(String name) async {
    return executeWithFailure(
      () => bookmarkDao.deleteBookmarkEntityByName(name),
    );
  }
}

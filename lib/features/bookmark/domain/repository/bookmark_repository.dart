import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/features/bookmark/domain/entity/bookmark_entity.dart';

abstract interface class BookmarkRepository {
  Future<Either<Failure, BookmarkEntity?>> saveBookmarkEntityToDB(
    String cityName,
  );

  Future<Either<Failure, List<BookmarkEntity>>> getAllBookmarkEntityFromDB();

  Future<Either<Failure, BookmarkEntity?>> findBookmarkEntityByName(
    String name,
  );

  Future<Either<Failure, void>> deleteBookmarkEntityByName(String name);
}

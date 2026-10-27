import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/core/use-case/use_case.dart';
import 'package:weather/features/bookmark/domain/entity/bookmark_entity.dart';
import 'package:weather/features/bookmark/domain/repository/bookmark_repository.dart';

class SaveBookmarkUseCase implements UseCase<BookmarkEntity?, String> {
  final BookmarkRepository _bookmarkRepository;
  SaveBookmarkUseCase(this._bookmarkRepository);

  @override
  Future<Either<Failure, BookmarkEntity?>> call(String params) {
    return _bookmarkRepository.saveBookmarkEntityToDB(params);
  }
}

import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/core/use-case/use_case.dart';
import 'package:weather/features/bookmark/domain/entity/bookmark_entity.dart';
import 'package:weather/features/bookmark/domain/repository/bookmark_repository.dart';

class GetAllBookmarkUseCase implements UseCase<List<BookmarkEntity>, NoParams> {
  final BookmarkRepository _bookmarkRepository;
  GetAllBookmarkUseCase(this._bookmarkRepository);

  @override
  Future<Either<Failure, List<BookmarkEntity>>> call(NoParams params) {
    return _bookmarkRepository.getAllBookmarkEntityFromDB();
  }
}

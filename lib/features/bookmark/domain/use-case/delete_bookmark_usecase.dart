import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failures/failure.dart';
import 'package:weather/core/use-case/use_case.dart';
import 'package:weather/features/bookmark/domain/repository/bookmark_repository.dart';

class DeleteBookmarkUseCase implements UseCase<String, String> {
  final BookmarkRepository _bookmarkRepository;
  DeleteBookmarkUseCase(this._bookmarkRepository);

  @override
  Future<Either<Failure, String>> call(String params) {
    return _bookmarkRepository.deleteBookmarkEntityByName(params);
  }
}

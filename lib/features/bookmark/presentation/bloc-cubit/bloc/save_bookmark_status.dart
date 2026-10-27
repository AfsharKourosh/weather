import 'package:equatable/equatable.dart';
import 'package:weather/features/bookmark/domain/entity/bookmark_entity.dart';

sealed class SaveBookmarkStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SaveBookmarkInitial extends SaveBookmarkStatus {}

final class SaveBookmarkLoading extends SaveBookmarkStatus {}

final class SaveBookmarkCompleted extends SaveBookmarkStatus {
  final BookmarkEntity bookmarkEntity;
  SaveBookmarkCompleted(this.bookmarkEntity);

  @override
  List<Object?> get props => [bookmarkEntity];
}

final class SaveBookmarkError extends SaveBookmarkStatus {
  final String? message;
  SaveBookmarkError(this.message);

  @override
  List<Object?> get props => [message];
}

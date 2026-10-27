import 'package:equatable/equatable.dart';
import 'package:weather/features/bookmark/domain/entity/bookmark_entity.dart';

sealed class GetAllBookmarkStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetAllBookmarkLoading extends GetAllBookmarkStatus {}

final class GetAllBookmarkCompleted extends GetAllBookmarkStatus {
  final List<BookmarkEntity> bookmarks;
  GetAllBookmarkCompleted(this.bookmarks);

  @override
  List<Object?> get props => [bookmarks];
}

final class GetAllBookmarkError extends GetAllBookmarkStatus {
  final String? message;
  GetAllBookmarkError(this.message);

  @override
  List<Object?> get props => [message];
}

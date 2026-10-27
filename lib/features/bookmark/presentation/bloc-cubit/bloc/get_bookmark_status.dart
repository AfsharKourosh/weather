import 'package:equatable/equatable.dart';
import 'package:weather/features/bookmark/domain/entity/bookmark_entity.dart';

sealed class GetBookmarkStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GetBookmarkLoading extends GetBookmarkStatus {}

final class GetBookmarkCompleted extends GetBookmarkStatus {
  final BookmarkEntity? bookmarkEntity;
  GetBookmarkCompleted(this.bookmarkEntity);

  @override
  List<Object?> get props => [bookmarkEntity];
}

final class GetBookmarkBookmarkError extends GetBookmarkStatus {
  final String? message;
  GetBookmarkBookmarkError(this.message);

  @override
  List<Object?> get props => [message];
}

part of 'bookmark_bloc.dart';

sealed class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

final class GetAllBookmarkEvent extends BookmarkEvent {}

final class GetBookmarkByNameEvent extends BookmarkEvent {
  final String cityName;
  const GetBookmarkByNameEvent(this.cityName);
  @override
  List<Object> get props => [cityName];
}

final class SaveCwEvent extends BookmarkEvent {
  final String name;
  const SaveCwEvent(this.name);
  @override
  List<Object> get props => [name];
}

final class SaveBookmarkInitialEvent extends BookmarkEvent {}

final class DeleteBookmarkEvent extends BookmarkEvent {
  final String name;
  const DeleteBookmarkEvent(this.name);
  @override
  List<Object> get props => [name];
}

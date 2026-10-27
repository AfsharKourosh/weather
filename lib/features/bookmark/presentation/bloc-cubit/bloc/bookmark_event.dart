part of 'bookmark_bloc.dart';

sealed class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class GetAllBookmarkEvent extends BookmarkEvent {}

class GetBookmarkByNameEvent extends BookmarkEvent {
  final String cityName;
  const GetBookmarkByNameEvent(this.cityName);
}

class SaveCwEvent extends BookmarkEvent {
  final String name;
  const SaveCwEvent(this.name);
}

class SaveBookmarkInitialEvent extends BookmarkEvent {}

class DeleteBookmarkEvent extends BookmarkEvent {
  final String name;
  const DeleteBookmarkEvent(this.name);
}

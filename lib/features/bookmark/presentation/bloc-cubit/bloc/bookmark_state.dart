part of 'bookmark_bloc.dart';

class BookmarkState extends Equatable {
  const BookmarkState({
    required this.deleteBookmarkStatus,
    required this.getBookmarkStatus,
    required this.getAllBookmarkStatus,
    required this.saveBookmarkStatus,
  });
  final DeleteBookmarkStatus deleteBookmarkStatus;
  final GetBookmarkStatus getBookmarkStatus;
  final GetAllBookmarkStatus getAllBookmarkStatus;
  final SaveBookmarkStatus saveBookmarkStatus;
  BookmarkState copyWith({
    DeleteBookmarkStatus? deleteBookmarkStatus,
    GetBookmarkStatus? getBookmarkStatus,
    GetAllBookmarkStatus? getAllBookmarkStatus,
    SaveBookmarkStatus? saveBookmarkStatus,
  }) {
    return BookmarkState(
      deleteBookmarkStatus: deleteBookmarkStatus ?? this.deleteBookmarkStatus,
      getBookmarkStatus: getBookmarkStatus ?? this.getBookmarkStatus,
      getAllBookmarkStatus: getAllBookmarkStatus ?? this.getAllBookmarkStatus,
      saveBookmarkStatus: saveBookmarkStatus ?? this.saveBookmarkStatus,
    );
  }

  @override
  List<Object> get props => [
    deleteBookmarkStatus,
    getBookmarkStatus,
    getAllBookmarkStatus,
    saveBookmarkStatus,
  ];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/use-case/use_case.dart';
import 'package:weather/features/bookmark/domain/use-case/delete_bookmark_usecase.dart';
import 'package:weather/features/bookmark/domain/use-case/get_all_bookmark_usecase.dart';
import 'package:weather/features/bookmark/domain/use-case/get_bookmark_usecase.dart';
import 'package:weather/features/bookmark/domain/use-case/save_bookmark_usecase.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/delete_bookmark_status.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/get_all_bookmark_status.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/get_bookmark_status.dart';
import 'package:weather/features/bookmark/presentation/bloc-cubit/bloc/save_bookmark_status.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final DeleteBookmarkUseCase _deleteBookmarkUseCase;
  final GetAllBookmarkUseCase _getAllBookmarkUseCase;
  final GetBookmarkUseCase _getBookmarkUseCase;
  final SaveBookmarkUseCase _saveBookmarkUseCase;

  BookmarkBloc({
    required this._deleteBookmarkUseCase,
    required this._getAllBookmarkUseCase,
    required this._getBookmarkUseCase,
    required this._saveBookmarkUseCase,
  }) : super(
         BookmarkState(
           deleteBookmarkStatus: DeleteBookmarkInitial(),
           getBookmarkStatus: GetBookmarkLoading(),
           getAllBookmarkStatus: GetAllBookmarkLoading(),
           saveBookmarkStatus: SaveBookmarkInitial(),
         ),
       ) {
    on<DeleteBookmarkEvent>((event, emit) async {
      emit(state.copyWith(deleteBookmarkStatus: DeleteBookmarkLoading()));

      final result = await _deleteBookmarkUseCase(event.name);

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              deleteBookmarkStatus: DeleteBookmarkError(failure.message),
            ),
          );
        },
        (deletedName) {
          final currentStatus = state.getBookmarkStatus;

          final updatedGetStatus = switch (currentStatus) {
            GetBookmarkCompleted(:final bookmarkEntity)
                when bookmarkEntity?.name == event.name =>
              GetBookmarkCompleted(null),
            _ => currentStatus,
          };

          emit(
            state.copyWith(
              deleteBookmarkStatus: DeleteBookmarkCompleted(deletedName),
              getBookmarkStatus: updatedGetStatus,
            ),
          );
        },
      );
    });

    // on<DeleteBookmarkEvent>((event, emit) async {
    //   emit(state.copyWith(deleteBookmarkStatus: DeleteBookmarkLoading()));

    //   final result = await _deleteBookmarkUseCase(event.name);

    //   result.fold(
    //     (failure) {
    //       emit(
    //         state.copyWith(
    //           deleteBookmarkStatus: DeleteBookmarkError(failure.message),
    //         ),
    //       );
    //     },
    //     (name) {
    //       emit(
    //         state.copyWith(deleteBookmarkStatus: DeleteBookmarkCompleted(name)),
    //       );
    //     },
    //   );
    // });

    on<GetAllBookmarkEvent>((event, emit) async {
      emit(state.copyWith(getAllBookmarkStatus: GetAllBookmarkLoading()));

      final result = await _getAllBookmarkUseCase(NoParams());

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              getAllBookmarkStatus: GetAllBookmarkError(failure.message),
            ),
          );
        },
        (bookmarks) {
          emit(
            state.copyWith(
              getAllBookmarkStatus: GetAllBookmarkCompleted(bookmarks),
            ),
          );
        },
      );
    });

    on<GetBookmarkByNameEvent>((event, emit) async {
      emit(state.copyWith(getBookmarkStatus: GetBookmarkLoading()));

      final result = await _getBookmarkUseCase(event.cityName);

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              getBookmarkStatus: GetBookmarkBookmarkError(failure.message),
            ),
          );
        },
        (name) {
          emit(state.copyWith(getBookmarkStatus: GetBookmarkCompleted(name)));
        },
      );
    });

    on<SaveCwEvent>((event, emit) async {
      emit(state.copyWith(saveBookmarkStatus: SaveBookmarkLoading()));

      final result = await _saveBookmarkUseCase(event.name);

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              saveBookmarkStatus: SaveBookmarkError(failure.message),
            ),
          );
        },
        (bookmark) {
          final savedBookmark = bookmark!;

          emit(
            state.copyWith(
              saveBookmarkStatus: SaveBookmarkCompleted(savedBookmark),
              getBookmarkStatus: GetBookmarkCompleted(savedBookmark),
            ),
          );
        },
      );
    });

    // on<SaveCwEvent>((event, emit) async {
    //   emit(state.copyWith(saveBookmarkStatus: SaveBookmarkLoading()));

    //   final result = await _saveBookmarkUseCase(event.name);

    //   result.fold(
    //     (failure) {
    //       emit(
    //         state.copyWith(
    //           saveBookmarkStatus: SaveBookmarkError(failure.message),
    //         ),
    //       );
    //     },
    //     (name) {
    //       emit(
    //         state.copyWith(saveBookmarkStatus: SaveBookmarkCompleted(name!)),
    //       );
    //     },
    //   );
    // });

    on<SaveBookmarkInitialEvent>((event, emit) async {
      emit(state.copyWith(saveBookmarkStatus: SaveBookmarkInitial()));
    });
  }
}

import 'package:equatable/equatable.dart';

sealed class DeleteBookmarkStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteBookmarkInitial extends DeleteBookmarkStatus {}

class DeleteBookmarkLoading extends DeleteBookmarkStatus {}

class DeleteBookmarkCompleted extends DeleteBookmarkStatus {
  final String name;
  DeleteBookmarkCompleted(this.name);

  @override
  List<Object?> get props => [name];
}

class DeleteBookmarkError extends DeleteBookmarkStatus {
  final String? message;
  DeleteBookmarkError(this.message);

  @override
  List<Object?> get props => [message];
}

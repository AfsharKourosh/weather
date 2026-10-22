part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterStateChanged extends CounterState {
  final int counter;

  const CounterStateChanged({required this.counter});
  //CounterStateChanged copyWith({int? counter})
  //                              named & nallable

  CounterStateChanged copyWith({int? counter}) {
    return CounterStateChanged(counter: counter ?? this.counter);
  }

  @override
  List<Object> get props => [counter];
}
/*
class ImageState {
  SelectImageStatus selectedImageStatus;
  GetRecentImagesStatus recentImagesStatus;

  ImageState({
    required this.recentImagesStatus,
    required this.selectedImageStatus,
  });

  ImageState copyWith({
    SelectImageStatus? selectedImageStatus,
    GetRecentImagesStatus? recentImagesStatus,
  }) {
    return ImageState(
      recentImagesStatus: recentImagesStatus ?? this.recentImagesStatus,
      selectedImageStatus: selectedImageStatus ?? this.selectedImageStatus,
    );
  }
}
---------------------------------------------------------------------------
abstract class SelectImageStatus {}

class SelectImageInitial extends SelectImageStatus {}

class SelectImageLoading extends SelectImageStatus {}

class SelectImageDone extends SelectImageStatus {
  final ImageModel? selectedImage;
  SelectImageDone({this.selectedImage});
}

class SelectImageError extends SelectImageStatus {
  final String message;
  SelectImageError(this.message);
}



*/
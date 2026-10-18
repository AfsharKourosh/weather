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

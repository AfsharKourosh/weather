import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterStateChanged(counter: 0));

  void increment() {
    final currentState = state;

    if (currentState is CounterStateChanged) {
      emit(currentState.copyWith(counter: currentState.counter + 1));
    }
  }

  void decrement() {
    final currentState = state;
    if (currentState is CounterStateChanged) {
      emit(currentState.copyWith(counter: currentState.counter - 1));
    }
  }
  /*
use useCase when just have local or remote data source

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfile;

  ProfileCubit(this.getProfile) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());

    try {
      final profile = await getProfile();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}

  */
}

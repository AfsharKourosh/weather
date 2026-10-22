import 'package:bloc/bloc.dart';

class PageNavCubit extends Cubit<int> {
  PageNavCubit() : super(0);
  void changeIndex(int index) {
    emit(index);
  }
}

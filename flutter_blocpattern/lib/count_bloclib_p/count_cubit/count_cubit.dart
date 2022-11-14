import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  // initialState 초기 값

  void add() => emit(state + 1);
  // initialState 값 변경을 emit에 알림

  void remove() => emit(state - 1);
  // initialState 값 변경을 emit에 알림
}

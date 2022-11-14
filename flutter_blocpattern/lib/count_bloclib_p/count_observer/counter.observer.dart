import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver {
  // BlocObserver을 상속 받아 CounterObserver 클래스를 만들고 상태 변화를 감시하는 onChange함수 구현
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    print('초기화 진행 ${bloc.runtimeType} $change');
  }
}

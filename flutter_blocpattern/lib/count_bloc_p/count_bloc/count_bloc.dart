import 'dart:async';

class CountBloc {
  int _count = 0;
  Map _tt = {"abc": 2};

  final StreamController _countSubject = StreamController.broadcast();
  // StreamController를 통해 여러 이벤트를 처리

  Stream get stream => _countSubject.stream;
  // Count는 _countSubject.stream을 구독하고 있는 모든 위젯에게 변경된 상태를 알림

  addCount() {
    _count++;
    _countSubject.sink.add(_count);
    // 변경된 값을 _countSubject에 넣음
  }

  removeCount() {
    _count--;
    _countSubject.sink.add(_count);
  }

  dispose() {
    _countSubject.close();
    // 구독 종료
  }
}

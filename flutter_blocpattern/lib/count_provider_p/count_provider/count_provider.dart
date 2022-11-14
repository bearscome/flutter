import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier {
  // ChangeNotifier를 상속 받아 상태 관리
  int _count = 0;

  Map _tt = {"abc": 2};

  int get getCount => _count;
  Map get gettt => _tt;
  // get 함수를 통해 외부에서 접근이 가능하다.

  add() {
    _count++;
    notifyListeners();
    // notifyListeners함수를 호출하여 구독하는 위젯에게 알린다.
  }

  remove() {
    _count--;
    notifyListeners();
    // notifyListeners함수를 호출하여 구독하는 위젯에게 알린다.
  }
}

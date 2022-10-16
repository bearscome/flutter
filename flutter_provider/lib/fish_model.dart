import 'package:flutter/cupertino.dart';

class FishModel with ChangeNotifier {
  final String name;
  int number;
  final String size;

  FishModel({required this.name, required this.number, required this.size});

  void chageFishNumber() {
    number++;
    notifyListeners();
  }
}

class FishModelTest {
  late Map initData;

  void init() {
    // api 땡기고
    initData['test'] = 'aa';
    initData['ㅁ'] = 'ㅁ';
  }

  get getInitData => initData;
}

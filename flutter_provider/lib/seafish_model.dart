import 'package:flutter/cupertino.dart';

class SeaFishModel with ChangeNotifier {
  final String name;
  int tunaNuber;
  final String size;

  SeaFishModel(
      {required this.name, required this.tunaNuber, required this.size});

  void chageSeaFishNumber() {
    tunaNuber++;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class DeviceProvider extends ChangeNotifier {
  num _width = 0;
  num _height = 0;

  num get getDeviceWidth => _width;
  num get getDeviceHeight => _height;

  void setDeviceSize({required width, required height}) {
    _width = width;
    _height = height;
  }
}

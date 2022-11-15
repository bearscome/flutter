import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/audio.dart';
import 'package:flutter_application_4/repository/audioRepository.dart';

class AudioProvider extends ChangeNotifier {
  List<AudioModelItem> _data = [];
  int _total = 0;
  bool _status = false;

  List<AudioModelItem> get getData => _data;
  int _index = 0;
  AudioModelItem get getCurrentData => _data[_index];
  int get getIndex => _index;
  bool get getStatus => _status;
  int get getLength => _total;

  var audioRepository = AudioRepository();

  Future<void> setInit() async {
    await audioRepository.getAudioData();
    List<AudioModelItem> audioItems = audioRepository.getData;
    int total = audioRepository.getTotal;
    _data = audioItems;
    _total = total;
    _status = true;
    notifyListeners();
    // setData(audioItems);
    // setTotal(total);
    // setStatus();
  }

  void setData(List<AudioModelItem> data) {
    debugPrint('datadata $data');
    _data = data;
    notifyListeners();
  }

  void setTotal(int total) {
    debugPrint('totaltotal $total');
    _total = total;
    notifyListeners();
  }

  void setStatus() {
    _status = true;
    notifyListeners();
  }

  void setIndex(index) {
    _index = index;
    notifyListeners();
  }

  void next() {
    if (getData.length - 1 == _index) {
      _index = 0;
    } else {
      _index++;
    }

    notifyListeners();
  }

  void prev() {
    if (_index == 0) {
      _index = getData.length - 1;
    } else {
      _index--;
    }

    notifyListeners();
  }
}

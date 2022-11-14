import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_4/model/audio.dart';

class AudioRepository {
  late List _audioList = [];
  late int _total = 0;
  List<AudioModelItem> _parseData = [];

  Future<void> getAudioData() async {
    final String response = await rootBundle.loadString('lib/dummy/audio.json');
    final data = await json.decode(response);
    _audioList = data['list'];
    _total = data['total'];

    _parseData = _audioList.map((e) => AudioModelItem.fromJson(e)).toList();
  }

  List<AudioModelItem> get getData => _parseData;
  int get getTotal => _total;
}

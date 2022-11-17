import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/audiopage.dart';
import 'package:flutter_application_4/page/google_map.dart';
import 'package:flutter_application_4/page/todopage.dart';
import 'package:flutter_application_4/page/webviewpage.dart';
import 'package:flutter_application_4/provider/audioProvider.dart';
import 'package:provider/provider.dart';

final List<Map<String, dynamic>> route = [
  {
    "title": "투두 리스트",
    "page": const ToDoList(),
    "button": const BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: "home",
    ),
  },
  {
    "title": "오디오",
    "page": ChangeNotifierProvider(
      create: (context) => AudioProvider(),
      child: const AudioPage(),
    ),
    "button": const BottomNavigationBarItem(
      icon: Icon(Icons.audio_file),
      label: "Audio",
    ),
  },
  {
    "title": "구글 지도",
    "page": const GoogleMapPage(),
    "button": const BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: "Map",
    ),
  },
  {
    "title": "웹뷰",
    "page": const WebviewPage(),
    "button": const BottomNavigationBarItem(
      icon: Icon(Icons.web),
      label: "Web",
    ),
  },
];

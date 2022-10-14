import 'package:bloc_1/camera/camera.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ui text',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('기능단위 테스트'),
        ),
        body: const Page(),
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({super.key});

  void _goto(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Camera()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => _goto(context),
          child: const Text('카메라 테스트'),
        ),
      ],
    );
  }
}

// 이미지, gps, LED, Video, 지문인식, paceID, 잠금패턴
// mvc mvvc
// sqlite
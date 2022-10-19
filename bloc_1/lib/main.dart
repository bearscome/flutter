import 'package:bloc_1/camera/camera.dart';
import 'package:bloc_1/googlePlay/movetopage.dart';
import 'package:bloc_1/gps/gps.dart';
import 'package:bloc_1/local_auth/local_auth.dart';
import 'package:bloc_1/notification/notification.dart';
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

  void _goto(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final m2s = MoveToStore();
    return Column(
      children: [
        TextButton(
          onPressed: () => _goto(context, const Camera()),
          child: Text(const Camera().PageTitle.toString()),
        ),
        TextButton(
          onPressed: () => _goto(context, const GetGps()),
          child: Text(const GetGps().PageTitle.toString()),
        ),
        TextButton(
          onPressed: () => _goto(context, const LocalAuth()),
          child: Text(const LocalAuth().PageTitle.toString()),
        ),
        TextButton(
          onPressed: () => _goto(context, const LocalNotification()),
          child: Text(const LocalNotification().PageTitle.toString()),
        ),
        TextButton(
          onPressed: () {
            const String androidAppId = 'com.iyaffle.rangoli';
            const String iOSAppId = '585027354';
            m2s.move2Page(androidAppId: androidAppId, iOSAppId: iOSAppId);
          },
          child: const Text('move to Store'),
        ),
      ],
    );
  }
}

// 이미지, gps, LED, Video, 지문인식, paceID, 잠금패턴, push 알림
// mvc mvvc
// sqlite
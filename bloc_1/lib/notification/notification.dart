import 'dart:async';

import 'package:bloc_1/notification/localNotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final pushAl = LocalNotificationTest();

class LocalNotification extends StatefulWidget {
  const LocalNotification({super.key});
  final PageTitle = 'LocalNotification';

  @override
  State<LocalNotification> createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  @override
  void initState() {
    super.initState();
    pushAl.initLocalNotificationPlugin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.PageTitle.toString()),
      ),
      body: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            pushAl.initLocalNotificationPlugin();
          },
          child: Text('알림 초기화'),
        ),
        ElevatedButton(
          onPressed: () {
            pushAl.sampleNotification();
          },
          child: Text('알림 반복'),
        ),
        ElevatedButton(
          onPressed: () {
            pushAl.requestPermission();
          },
          child: Text('알람 동의 여부'),
        )
      ],
    );
  }
}

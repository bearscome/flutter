import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

class LocalNotificationTest {
  int num = 0;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initLocalNotificationPlugin() async {
    debugPrint('초기화 진행');
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // aos 초기화
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(); // ios 초기화
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        debugPrint('안녕 $notificationResponse');
      },
    ); // 플러그인 초기화
  }

  void requestPermission() async {
    final bool? result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    debugPrint('알림 권한  동의:true, 비동의:false $result');
  }

  Future<void> sampleNotification({
    String title = '알람 타이틀',
    String body = '알람 내용',
    String payload = '없을수 있음',
    bool selfNotification = true,
  }) async {
    debugPrint('임의로 푸쉬팝업 전송');
    if (selfNotification) {
      num++;
    }

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      // 안드로이드 세부 알람 설정
      'channelId',
      'channelName',
      channelDescription: 'channelDescription',
      importance: Importance.max,
      priority: Priority.max,
      showWhen: false,
      // subText: subText,
    );

    const NotificationDetails platformChannelSpcifics = NotificationDetails(
        android: androidNotificationDetails, // 안드로이드는 적용 안하면 안됨
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ));

    await flutterLocalNotificationsPlugin.show(
      num,
      title,
      body,
      platformChannelSpcifics,
      payload: 'itemX',
    );
  }
}

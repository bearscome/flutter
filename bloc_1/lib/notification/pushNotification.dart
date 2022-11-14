import 'dart:async';
import 'dart:io';
import 'package:bloc_1/camera/camera.dart';
import 'package:bloc_1/main.dart';
import 'package:flutter/material.dart';

import 'package:bloc_1/firebase_options.dart';
import 'package:bloc_1/notification/localNotification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

late String custom;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message ${message.messageId}');
  debugPrint('Handling a background message ${message.data}');
  debugPrint('Handling a background message ${message.data['custom']}');
  custom = message.data['custom'];
  Navigator.of(CandyGlobalVariable.naviagatorState.currentContext!).push(
    MaterialPageRoute(
      builder: (_) => const Camera(),
    ),
  );
}

class FirebaseService {
  static FirebaseMessaging? _firebaseMessaging;
  static FirebaseMessaging get firebaseMessaging =>
      FirebaseService._firebaseMessaging ?? FirebaseMessaging.instance;
  static final notificationTest = LocalNotificationTest();

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FirebaseService._firebaseMessaging = FirebaseMessaging.instance;
    await notificationTest.initLocalNotificationPlugin();
    await FirebaseService.onMessage();
    await FirebaseService.onBackgroundMessage();
    debugPrint('파이어 서버스 완료');
  }

  static Future<String?> getDeviceToken() async =>
      await FirebaseMessaging.instance.getToken();

  static Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint('onMessage: $message');
      if (Platform.isAndroid) {
        await notificationTest.sampleNotification(
          title: message.notification!.title.toString(),
          body: message.notification!.body.toString(),
          payload: message.data.toString(),
          selfNotification: false,
        );
      }
    });
  }

  static Future<void> onBackgroundMessage() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

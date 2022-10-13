import 'package:chatting_app/screens/chat_screen.dart';
import 'package:chatting_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 위젯 초기화
  await Firebase.initializeApp();
  // flutter 코어(위젯)가 초기화 되기 전에 FireBase 연동
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        // 파이어베이스가 로그인 로그아웃에 따라 토큰 값을 리턴
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ChatScreen();
          }

          return LoginSingupScreen();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/main.dart';
import 'package:flutter_application_4/provider/loginProvider.dart';
import 'package:flutter_application_4/provider/todoListProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserStateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoListProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '안녕',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('하이'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => fluuterToast(),
          child: Text('data'),
        ),
      ),
    );
  }
}

void fluuterToast() {
  Fluttertoast.showToast(
    msg: 'msg',
    gravity: ToastGravity.BOTTOM_LEFT,
    backgroundColor: Colors.redAccent,
    fontSize: 20.0,
    textColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
  );
}

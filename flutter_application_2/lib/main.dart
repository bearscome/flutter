import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ScreenB.dart';
import 'package:flutter_application_1/ScreenA.dart';
import 'package:flutter_application_1/ScreenC.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('button'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print('object');
                },
                onLongPress: () => print('object'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text(
                  'hi',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('안녕');
                },
                child: Text('Elevated Button'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0.0,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  print('OutlinedButton');
                },
                child: Text('OutlinedButton'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green,
                  side: const BorderSide(
                    color: Colors.black87,
                    width: 2.0,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  print('TextButton.icon');
                },
                icon: const Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                ),
                label: const Text('Go to Home'),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    minimumSize: const Size(200, 50),
                    backgroundColor: Colors.black87),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonPadding: EdgeInsets.all(20.0),
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("hi"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('hi'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

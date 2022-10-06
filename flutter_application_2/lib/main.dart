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
      home: Builder(
          builder: ((context) => Center(
                child: ElevatedButton(
                  child: Text('go to A'),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => ScreenA()),
                      )),
                ),
              ))),
      // debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => ScreenA(),
      //   '/b': (context) => ScreenB(),
      //   '/c': (context) => ScreenC()
      // },
      // home: Center(
      //   child: ElevatedButton(
      //     child: Text('go to A'),
      //     onPressed: () => Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: ((context) => ScreenA()),
      //         )),
      //   ),
      // ),
    );
  }
}

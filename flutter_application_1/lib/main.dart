import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeaderWidget(),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('안녕'),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Column(
              children: [
                Container(
                  height: 33.3,
                  color: Colors.purple,
                ),
                Container(
                  height: 33.3,
                  color: Colors.pink,
                ),
                Container(
                  height: 33.3,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

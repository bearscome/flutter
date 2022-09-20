import 'package:flutter/material.dart';

class SecondMan extends StatelessWidget {
  String name;
  int age;
  String gender;
  bool isKorean;

  SecondMan({this.name, this.age, this.gender, this.isKorean});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("두번째 페이지 입니다"),
      ),
      body: Column(
        children: [
          Container(
            child: Text(name ?? "안녕"),
          ),
          Container(
            child: Text(name),
          ),
          Container(
            child: Text(name),
          ),
          Container(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SecondMan extends StatelessWidget {
  String name;
  int age;
  String gender;
  bool isKorean;

  SecondMan(
      {required this.name,
      required this.age,
      required this.gender,
      required this.isKorean});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("두번째 페이지 입니다"),
      ),
      body: Column(
        children: [
          Container(
            child: Text(name),
          ),
          Container(
            child: Text(age.toString()),
          ),
          Container(
            child: Text(gender),
          ),
          Container(
            child: Text(isKorean.toString()),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SecondMan extends StatelessWidget {
  final String name;
  final int age;
  final String gender;
  final bool isKorean;

  const SecondMan(
      {super.key,
      required this.name,
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
          Text(name),
          Text(age.toString()),
          Text(gender),
          Text(isKorean.toString()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SecondMan extends StatelessWidget {
  const SecondMan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("두번째 페이지 입니다"),
      ),
      body: Container(
        child: const Text("안녕하세요"),
      ),
    );
  }
}

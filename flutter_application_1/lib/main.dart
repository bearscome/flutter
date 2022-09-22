import 'package:flutter/material.dart';
import 'package:flutter_application_1/testPages/secondman.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HeaderWidget(),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('안녕'),
      ),
      body: Row(
        children: [
          GestureDetector(
            onTap: () {
              // 페이지 이동
              Get.to(SecondMan(
                  name: '김아무개', age: 12, gender: '남자', isKorean: true));
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SecondMan(
              //             name: '김아무개',
              //             age: 12,
              //             gender: '남자',
              //             isKorean: true)));
            },
            child: Container(
              color: Colors.pinkAccent,
              child: const Text("여기를 누르세요"),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.yellow,
                  ),
                )
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

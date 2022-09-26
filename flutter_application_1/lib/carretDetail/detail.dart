import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class Detail extends StatelessWidget {
  final String itemTitle;
  final String area;
  final int price;
  final int chatCount;
  final int jjimCount;

  const Detail(
      {super.key,
      required this.itemTitle,
      required this.area,
      required this.price,
      required this.chatCount,
      required this.jjimCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("상품정보"),
      ),
      body: Column(
        children: [
          Text(itemTitle),
          Text(area),
          Text(price.toString()),
          Text(chatCount.toString()),
          Text(jjimCount.toString()),
        ],
      ),
    );
  }
}

//
// class SimpleController extends GetxController {
//   int counter = 0;

//   void increase() {
//     counter++;
//     update();
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('단순 상태관리 테스트'),
//       ),
//       body: Center(child: GetBuilder<SimpleController>(builder: (controller) {
//         return ElevatedButton(
//             onPressed: () {
//               controller.increase();
//             },
//             child: Text('현재숫자:${controller.counter}'));
//       })),
//     );
//   }
// }

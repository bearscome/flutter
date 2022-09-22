import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  String itemTitle;
  String area;
  int price;
  int chatCount;
  int jjimCount;

  Detail(
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

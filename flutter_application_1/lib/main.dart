import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/testPages/secondman.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/carretDetail/detail.dart';

void main() {
  runApp(const MyApp());
}

final _dropMenuList = ["서울", "부산"];
final _items = [
  {
    "itemTitle": "고장난 모니터",
    "area": "서울 1동",
    "price": 13000,
    "chatCount": 1,
    "jjimCount": 2,
    "image": 'assets/67565847.png'
  },
  {
    "itemTitle": "고장난 키보드",
    "area": "서울 2동",
    "price": 15000,
    "chatCount": 2,
    "jjimCount": 1,
    "image": 'assets/67565847.png'
  },
  {
    "itemTitle": "없어 나가",
    "area": "서울 3동",
    "price": 0,
    "chatCount": 2,
    "jjimCount": 1,
    "image": 'assets/67565847.png'
  }
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Carret(),
      // home: HeaderWidget(),
    );
  }
}

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropMenuStatus();
}

class _DropMenuStatus extends State<DropDownButton> {
  String dropDownValue = _dropMenuList[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        value: dropDownValue,
        items: _dropMenuList
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (String? value) {
          setState(() {
            dropDownValue = value!;
          });
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _items
          .map((item) => GestureDetector(
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(item['image'] as String),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['itemTitle'] as String),
                            Text(item['area'] as String),
                            Text(item['price'].toString()),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.forum_outlined),
                                  Text(item['chatCount'].toString()),
                                  Icon(Icons.favorite_border),
                                  Text(item['jjimCount'].toString()),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(
                        itemTitle: item['itemTitle'] as String,
                        area: item['area'] as String,
                        price: item['price'] as int,
                        chatCount: item['chatCount'] as int,
                        jjimCount: item['jjimCount'] as int,
                      ),
                    )),
              ))
          .toList(),
    );
  }
}

class Carret extends StatelessWidget {
  const Carret({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropDownButton(),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Icon(Icons.menu),
                        Icon(Icons.notifications),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.green,
                child: Container(
                  color: Colors.white,
                  child: Items(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class HeaderWidget extends StatelessWidget {
//   const HeaderWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('안녕'),
//       ),
//       body: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               // 페이지 이동
//               Get.to(SecondMan(
//                   name: '김아무개', age: 12, gender: '남자', isKorean: true));
//               // Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //         builder: (context) => SecondMan(
//               //             name: '김아무개',
//               //             age: 12,
//               //             gender: '남자',
//               //             isKorean: true)));
//             },
//             child: Container(
//               color: Colors.pinkAccent,
//               child: const Text("여기를 누르세요"),
//             ),
//           ),
//           SizedBox(
//             width: 100,
//             height: 100,
//             child: Column(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     color: Colors.purple,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     color: Colors.pink,
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     color: Colors.yellow,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             width: 100,
//             height: 100,
//             color: Colors.green,
//           ),
//           Container(
//             width: 100,
//             height: 100,
//             color: Colors.blue,
//           ),
//         ],
//       ),
//     );
//   }
// }

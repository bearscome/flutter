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
  },
  {
    "itemTitle": "없어 나가",
    "area": "서울 3동",
    "price": 0,
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
  },
  {
    "itemTitle": "없어 나가",
    "area": "서울 3동",
    "price": 0,
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
  },
  {
    "itemTitle": "없어 나가",
    "area": "서울 3동",
    "price": 0,
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
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarretStatus(),
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

class TopLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
    );
  }
}

class BottomLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [Icon(Icons.home), Text('홈')],
          ),
          Column(
            children: [Icon(Icons.business), Text('동네생활')],
          ),
          Column(
            children: [Icon(Icons.public), Text('내근처')],
          ),
          Column(
            children: [Icon(Icons.forum_outlined), Text('채팅')],
          ),
          Column(
            children: [Icon(Icons.person), Text('나의당근')],
          ),
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
            .toList());
  }
}

class CarretStatus extends StatefulWidget {
  @override
  State<CarretStatus> createState() => Carret();
}

class Carret extends State<CarretStatus> {
  int selected = 0;

  void tapped(int index) => {
        setState(() {
          selected = index;
        })
      };

  var BodyTapList = [
    Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.green,
        child: Container(
          color: Colors.white,
          child: ListItems(),
        ),
      ),
    ),
    Text('2'),
    Text('3'),
    Text('4'),
    Text('5')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TopLayOut(),
            BodyTapList.elementAt(selected)
            // BottomLayOutState() // 커스텀 버튼
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "홈",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "동네생활",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.public),
              label: "내근처",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.forum_outlined),
              label: "채팅",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "나의당근",
              backgroundColor: Colors.black),
        ],
        // backgroundColor: Colors.blue,
        fixedColor: Colors.white,
        currentIndex: selected,
        onTap: (value) => tapped(value),
      ),
    );
  }
}

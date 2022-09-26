// import 'dart:convert';
// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_application_1/testPages/secondman.dart';
// import 'package:get/get.dart';
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
    return const MaterialApp(
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
    return DropdownButton(
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
    );
  }
}

class TopLayOut extends StatelessWidget {
  const TopLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.fromLTRB(30, 40, 10, 0), //left, top, right, bottom
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DropDownButton(),
          Row(
            children: const [
              Icon(Icons.search),
              Icon(Icons.menu),
              Icon(Icons.notifications),
            ],
          )
        ],
      ),
    );
  }
}

class BottomLayOut extends StatelessWidget {
  const BottomLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [Icon(Icons.home), Text('홈')],
          ),
          Column(
            children: const [Icon(Icons.business), Text('동네생활')],
          ),
          Column(
            children: const [Icon(Icons.public), Text('내근처')],
          ),
          Column(
            children: const [Icon(Icons.forum_outlined), Text('채팅')],
          ),
          Column(
            children: const [Icon(Icons.person), Text('나의당근')],
          ),
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({super.key});

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
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['itemTitle'] as String),
                              Text(item['area'] as String),
                              Text(item['price'].toString()),
                              Container(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.forum_outlined),
                                    Text(item['chatCount'].toString()),
                                    const Icon(Icons.favorite_border),
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
  const CarretStatus({super.key});

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

  var bodyTapList = [
    Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.green,
        child: Container(
          color: Colors.white,
          child: const ListItems(),
        ),
      ),
    ),
    const Text('2'),
    const Text('3'),
    const Text('4'),
    const Text('5')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopLayOut(),
          bodyTapList.elementAt(selected)
          // BottomLayOutState() // 커스텀 버튼
        ],
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

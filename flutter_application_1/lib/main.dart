import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/carretDetail/detail.dart';
import 'models/photo_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

final _dropMenuList = ["서울", "부산"];

Future<List<Album>> getPosts() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/photos?_limit=20'),
    // headers: {"Accept": "application/json"},
  );

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((e) => Album.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed');
  }
}

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late Future<List<Album>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
      future: futurePosts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!
                .map(
                  (e) => GestureDetector(
                    child: Row(
                      children: [
                        Image(
                          image: NetworkImage(e.thumbnailUrl),
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.fill,
                        ),
                        Text(e.title),
                      ],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Detail(
                              albumId: e.id,
                            )),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.hasError}');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing App',
      home: Scaffold(
        appBar: AppBar(
          // title: const Text('앱 타이틀'),
          leading: const DropDownButton(),
          actions: [
            IconButton(
              onPressed: () => print('hi'),
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => print('hi'),
              icon: const Icon(Icons.menu),
            ),
            IconButton(
              onPressed: () => print('hi'),
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
        body: const CarretStatus(),
      ),
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
    return const PostList();
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
        height: 200,
        color: Colors.green,
        child: const ListItems(),
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
      body: SafeArea(
        child: Column(
          children: [
            bodyTapList.elementAt(selected)
            // const TopLayOut(width: 3.0),
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
